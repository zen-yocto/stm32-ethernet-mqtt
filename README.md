STM32F411 Secure Ethernet MQTT Client with DHT22 Sensor

A robust, production-ready implementation of a TLS 1.2 secure MQTT client running on an STM32F411 microcontroller. This project integrates real-time environmental telemetry from an onboard DHT22 sensor, secures communication via mbedTLS, handles networking through the lwIP TCP/IP stack, and communicates over an ENC28J60 Ethernet module to a public MQTT broker (HiveMQ).

🚀 Key Features

Secure TLS 1.2 Connections: Fully implements cryptographic handshakes using mbedTLS.

Multi-CA Trust Store: Bundles multiple global Root CAs (Amazon Root CA 1, Let's Encrypt ISRG Root X1, and DigiCert Global Root CA) into a single flash context to ensure resilience against broker certificate rotations.

Real-time Environmental Telemetry: Polls temperature and humidity data from an integrated DHT22 sensor and publishes structured payloads securely to public brokers.

Resilient Network Initialization: Features a non-blocking, non-halting DNS retry loop via lwIP to cleanly resolve broker endpoints and prevent bad or garbage IP assignments.

Robust Error Handling & Flow Control: Clean separation of success and failure paths with explicit error codes mapped in hexadecimal (e.g., -0xXXXX) for rapid hardware debugging.

Real-time Telemetry Logging: Streamlined diagnostic outputs and structured status reporting over UART.

🛠️ Hardware Requirements

Microcontroller: STM32F411 Nucleo Board (or custom STM32F411CE/RE core).

Ethernet Module: ENC28J60 Standalone Ethernet Controller (SPI interface).

Sensor: DHT22 (AM2302) Digital Temperature and Humidity Sensor.

Interconnect Wiring:

SPI lines connected to the ENC28J60 (SCK, MISO, MOSI, CS).

DHT22 Data pin connected to a designated GPIO pin with a pull-up resistor.

RJ45 Ethernet cable connected to a local router with active DHCP/Internet access.

⚙️ Core Implementation Highlights
1. Multi-CA Trust Parsing
To ensure your device never drops connections due to issuer shifts, multiple root certificates are chain-parsed into the shared `mbedtls_x509_crt` structure:
```c
mbedtls_x509_crt_parse(&cert, (const unsigned char*) amazon_root_ca1, strlen(amazon_root_ca1) + 1);
mbedtls_x509_crt_parse(&cert, (const unsigned char*) letsencrypt_root_x1, strlen(letsencrypt_root_x1) + 1);
mbedtls_x509_crt_parse(&cert, (const unsigned char*) digicert_root_ca, strlen(digicert_root_ca) + 1);
mbedtls_ssl_conf_ca_chain(&conf, &cert, NULL);
```
2. Resilient DNS Resolution Loop
Protects against boot-up timing race conditions where the Ethernet link or router DHCP takes a few seconds to negotiate:
```c
do {
    dns_err = netconn_gethostbyname("broker.hivemq.com", &server_ip);
    if (dns_err != ERR_OK) {
        vTaskDelay(pdMS_TO_TICKS(2000)); // Non-blocking OS delay
    }
} while (dns_err != ERR_OK);
```
3. Telemetry Formatting & Log Console
Once connected, telemetry read from the DHT22 is formatted cleanly:
```c
printf("Data published successfully!\r\n"
       "  - Temperature: %.1f °C\r\n"
       "  - Humidity:    %.1f %%\r\n"
       "  - Errors:      %d\r\n"
       "  - Good Packets: %d\r\n",
       MQTT_data.temp,
       MQTT_data.humid,
       MQTT_data.error_counter,
       MQTT_data.good_data_count);
```
---
🚀 Getting Started & Building
Clone the Repository:
```bash
   git clone https://github.com/zen-yocto/stm32-ethernet-mqtt.git
   ```
Open the Project: Import the workspace into STM32CubeIDE or your preferred ARM-GCC toolchain environment.
Configure Network Parameters: Adjust static IP configurations in `main.c` if you are not using DHCP.
Compile & Flash: Build the project and flash your STM32F411 board.
Monitor Serial Output: Open your serial terminal (e.g., PuTTY, TeraTerm) at `115200 baud` to view real-time DNS status, TLS handshake execution codes, and telemetry message logs.
