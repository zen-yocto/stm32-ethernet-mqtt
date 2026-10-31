# STM32F411 Ethernet Temperature/Humidity Monitor with Flex UI

A feature-rich STM32F411 project for monitoring temperature and humidity using a DHT22 sensor, publishing telemetry over MQTT, and serving a lightweight web dashboard through an embedded HTTP server. The system continuously samples environmental data, updates a local web interface, and synchronizes the latest readings in the background to an MQTT broker.

This project is designed for embedded systems use cases where you need a low-power, connected sensor node with both local visualization and cloud publishing.

## Key Features

- DHT22 temperature and humidity sensing
- STM32F411 + ENC28J60 Ethernet connectivity
- Embedded HTTP server with a responsive web UI
- Background data sync for live temperature and humidity updates
- MQTT publishing for cloud or broker-based telemetry forwarding
- TCP/IP networking with lwIP
- TLS 1.2 secure MQTT support with mbedTLS and multi-CA trust store
- UART debugging and structured status logging
- Non-blocking DNS retry handling and resilient network startup
- Robust error handling and recovery flows

## Hardware Requirements

- STM32F411 Nucleo board or compatible STM32F411CE/RE board
- ENC28J60 Ethernet controller over SPI
- DHT22 (AM2302) sensor
- 10/100Base-T Ethernet connection to a local router or network
- Pull-up resistor on the DHT22 data line as required by the sensor wiring
- Optional USB-UART adapter for serial debugging

## Wiring Overview

- SPI interface connected to ENC28J60: SCK, MISO, MOSI, CS
- DHT22 data pin connected to a defined GPIO input
- Ethernet RJ45 cable connected to a LAN with DHCP or a configured static IP
- Serial UART connected to a PC at 115200 baud for logs and diagnostics

## System Overview

The firmware performs the following tasks concurrently:

1. Reads temperature and humidity from the DHT22 sensor.
2. Stores the latest sensor values in memory and updates the UI state.
3. Serves an HTTP page from the STM32 board to allow local monitoring in a browser.
4. Runs a background synchronization loop to periodically push the latest telemetry to an MQTT broker.
5. Maintains network connectivity through retry logic and watchdog-friendly error handling.

This gives you both a local web dashboard and remote data forwarding without requiring a separate host computer.

## Web Interface

The embedded HTTP server hosts a small responsive Flex-based web UI that displays:

- Current temperature
- Current humidity
- Refresh/update status
- Connection state
- Recent telemetry or last sync timestamp

The UI is intentionally lightweight and optimized for embedded resources, making it suitable for local monitoring without a powerful external web stack.

## Background Sync Behavior

The project includes a background synchronization routine that continuously updates the temperature and humidity values and sends them to the configured broker in the background. This ensures that the system remains responsive while telemetry continues to stream even when the UI is being accessed or when the device is actively serving HTTP pages.

Typical synchronization flow:

- Read sensor values
- Validate and filter the data
- Update local state
- Publish data to MQTT broker or queue it for transfer
- Refresh dashboard values for the current web session

## MQTT and Secure Connectivity

The firmware includes secure communication support using mbedTLS for MQTT over TLS 1.2. The project includes a bundled CA trust store so it can validate server certificates from commonly used public brokers.

Example trust configuration:

```c
mbedtls_x509_crt_parse(&cert, (const unsigned char*) amazon_root_ca1, strlen(amazon_root_ca1) + 1);
mbedtls_x509_crt_parse(&cert, (const unsigned char*) letsencrypt_root_x1, strlen(letsencrypt_root_x1) + 1);
mbedtls_x509_crt_parse(&cert, (const unsigned char*) digicert_root_ca, strlen(digicert_root_ca) + 1);
mbedtls_ssl_conf_ca_chain(&conf, &cert, NULL);
```

## Network Initialization

The board uses lwIP and includes a resilient DNS loop to avoid failures during startup when the Ethernet link or router has not fully initialized yet.

```c
do {
    dns_err = netconn_gethostbyname("broker.hivemq.com", &server_ip);
    if (dns_err != ERR_OK) {
        vTaskDelay(pdMS_TO_TICKS(2000));
    }
} while (dns_err != ERR_OK);
```

## Telemetry Logging

Telemetry is exposed over UART to aid in debugging and verification of sensor readings, network state, MQTT status, and HTTP server operations.

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

## Project Structure

- `Core/` — main firmware and application logic
- `Drivers/` — hardware abstraction and peripheral drivers
- `Middlewares/` — lwIP and related networking middleware
- `TLS/` — certificate and secure MQTT configuration
- `HTTP/` — embedded web server and UI assets
- `README.md` — project documentation

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/zen-yocto/stm32-ethernet-mqtt.git
```

2. Open the project in STM32CubeIDE or your preferred ARM-GCC development environment.

3. Configure the board and network settings:
   - Ethernet IP mode (DHCP or static)
   - MQTT broker address and port
   - TLS certificate settings if required
   - DHT22 GPIO pin and sensor configuration

4. Build and flash the firmware to your STM32F411 board.

5. Connect the board to the local network and power it on.

6. Open the embedded web UI in a browser using the board's IP address.

7. Monitors logs over UART at 115200 baud for debugging and telemetry status.

## Example Use Cases

- Remote environmental monitoring in a lab or workshop
- Indoor climate monitoring for smart building prototypes
- Embedded sensor dashboards with local HTTP access
- MQTT telemetry for IoT dashboards and data collection systems
- Educational platform for STM32 networking, telemetry, and UI development

## Notes

This project combines embedded networking, sensor acquisition, secure cloud connectivity, and a lightweight local UI in a single STM32-based firmware. The HTTP server and Flex-based dashboard are designed to provide immediate visibility into current conditions while the background synchronization keeps telemetry flowing to the broker without interrupting normal operations.

## License

This project is provided as-is for educational and prototyping use. Update the license text as needed for your deployment or commercial usage.
