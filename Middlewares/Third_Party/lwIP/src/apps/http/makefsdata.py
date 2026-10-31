import os

FS_DIR = "fs"
OUTPUT_FILE = "fsdata.c"

def main():
    if not os.path.exists(FS_DIR):
        print(f"Error: Directory '{FS_DIR}' not found!")
        return

    files_info = []

    # Walk through the fs directory recursively (matching "find . -type f")
    for root, _, filenames in os.walk(FS_DIR):
        for filename in filenames:
            filepath = os.path.join(root, filename)
            # Normalize path to match Unix style like "./index.html" or "./img/sics.gif"
            relpath = "./" + os.path.relpath(filepath, FS_DIR).replace("\\", "/")
            
            # Skip CVS or backup files (~/)
            if "CVS" in relpath or "~" in relpath:
                continue

            files_info.append((filepath, relpath))

    with open(OUTPUT_FILE, "w", encoding="utf-8") as out:
        fvars = []
        
        for filepath, file_path_str in files_info:
            # Determine HTTP Header based on extension (matching original Perl logic)
            if "404" in file_path_str:
                http_header = "HTTP/1.0 404 File not found\r\n"
            else:
                http_header = "HTTP/1.0 200 OK\r\n"
            
            http_header += "Server: lwIP/pre-0.6 (http://www.sics.se/~adam/lwip/)\r\n"
            
            if file_path_str.endswith(".html") or file_path_str.endswith(".htm"):
                http_header += "Content-type: text/html\r\n"
            elif file_path_str.endswith(".gif"):
                http_header += "Content-type: image/gif\r\n"
            elif file_path_str.endswith(".png"):
                http_header += "Content-type: image/png\r\n"
            elif file_path_str.endswith(".jpg") or file_path_str.endswith(".jpeg"):
                http_header += "Content-type: image/jpeg\r\n"
            elif file_path_str.endswith(".class"):
                http_header += "Content-type: application/octet-stream\r\n"
            elif file_path_str.endswith(".ram"):
                http_header += "Content-type: audio/x-pn-realaudio\r\n"
            else:
                http_header += "Content-type: text/plain\r\n"
            
            http_header += "\r\n"

            # Read actual file content
            with open(filepath, "rb") as f:
                file_content = f.read()

            # Combine header + file content (matching `cat /tmp/header $file > /tmp/file`)
            combined_data = http_header.encode('ascii') + file_content

            # Generate C variable name transformation matching Perl:
            # $file =~ s/\.//; $fvar =~ s-/-_-g; $fvar =~ s-\.-_-g;
            # e.g., "./index.html" -> "data_index_html"
            fvar = file_path_str.replace(".", "", 1) # remove first dot
            fvar = fvar.replace("/", "_").replace(".", "_").replace("-", "_")

            out.write(f"static const unsigned char data{fvar}[] = {{\n")
            out.write(f"\t/* {file_path_str} */\n\t")

            # Write filename characters as ASCII byte array (matching original lwIP layout)
            for j in range(len(file_path_str)):
                out.write(f"0x{ord(file_path_str[j]):02x}, ")
            out.write("0,\n")

            # Write combined header + content bytes in chunks of 10
            i = 0
            for b in combined_data:
                if i == 0:
                    out.write("\t")
                out.write(f"0x{b:02x}, ")
                i += 1
                if i == 10:
                    out.write("\n")
                    i = 0
            if i != 0:
                out.write("\n")
            out.write("};\n\n")

            fvars.append((fvar, file_path_str))

        # Write struct array definitions mapping back to each other
        for idx, (fvar, file_path_str) in enumerate(fvars):
            if idx == 0:
                prevfile = "NULL"
            else:
                prevfile = "file" + fvars[idx - 1][0]

            name_len = len(file_path_str) + 1
            data_size_minus_name = f"sizeof(data{fvar}) - {name_len}"

            out.write(f"const struct fsdata_file file{fvar}[] = {{{{ (struct fsdata_file *){prevfile}, data{fvar}, data{fvar} + {name_len}, {data_size_minus_name}, FS_FILE_FLAGS_HEADER_INCLUDED | FS_FILE_FLAGS_HEADER_PERSISTENT }}}};\n\n")

        # Write root definitions
        if fvars:
            last_fvar = fvars[-1][0]
            out.write(f"#define FS_ROOT file{last_fvar}\n\n")
            out.write(f"#define FS_NUMFILES {len(fvars)}\n")
        else:
            out.write("#define FS_ROOT NULL\n\n")
            out.write("#define FS_NUMFILES 0\n")

    print(f"Successfully generated {OUTPUT_FILE} with {len(fvars)} files using Python!")

if __name__ == "__main__":
    main()