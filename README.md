# STM32F411 Ethernet Temperature/Humidity Monitor with HTTP server, mbedTLS, MQTT Telemetry

A feature-rich STM32F411 project for monitoring temperature and humidity using a DHT22 sensor, publishing telemetry over MQTT, and serving a lightweight web dashboard through an embedded HTTP server.

This project is designed for embedded systems use cases where you need a low-power, connected sensor node with both local visualization and cloud publishing.

## Key Features

- DHT22 temperature and humidity sensing
- STM32F411 + ENC28J60 Ethernet connectivity
- Embedded HTTP server with a responsive web UI
- Background data sync for live temperature and humidity updates
- MQTT publishing for cloud or broker-based telemetry forwarding
- Secure MQTT with mbedTLS and TLS 1.2 certificate validation
- lwIP-based TCP/IP networking for Ethernet communication
- DHCP client support for automatic network configuration, with static IP fallback
- UART debugging and structured status logging
- Non-blocking DNS retry handling and resilient network startup
- Robust error handling and recovery flows

## Hardware Requirements

- STM32F411 Nucleo board or compatible STM32F411CE/RE board
- ENC28J60 Ethernet controller over SPI
- DHT22 (AM2302) sensor
- 10/100Base-T Ethernet connection to a local router or network
- 128x64 SSD1306-compatible OLED display (SPI) for local status information

## Wiring Overview

- SPI interface connected to ENC28J60: SCK, MISO, MOSI, CS
- DHT22 data pin connected to a defined GPIO input
- SPI interface connected to the OLED display: SCK, MOSI, CS and power/ground
- Ethernet RJ45 cable connected to a LAN with DHCP or a configured static IP

## System Overview

The firmware performs the following tasks concurrently:

1. Reads temperature and humidity from the DHT22 sensor.
2. Stores the latest sensor values in memory and updates the UI state.
3. Serves an HTTP page from the STM32 board to allow local monitoring in a browser.
4. Updates the OLED display with current readings, network status, and system health.
5. Runs a background synchronization loop to periodically push the latest telemetry to an MQTT broker.
6. Maintains network connectivity through retry logic and watchdog-friendly error handling.

This gives you both a local web dashboard, a visible on-device display, and remote data forwarding without requiring a separate host computer.

## Web Interface

The embedded HTTP server hosts a small responsive Flex-based web UI that displays:

- Current temperature
- Current humidity


The UI is intentionally lightweight and optimized for embedded resources, making it suitable for local monitoring without a powerful external web stack.

## Network and Protocol Stack

This firmware uses a compact embedded networking stack built around lwIP, which provides the low-level TCP/IP services needed for communication on the ENC28J60 Ethernet controller.

Key networking features include:

- DHCP client support for automatic IP assignment on local networks
- Static IP configuration support for controlled deployments
- DNS resolution for broker discovery and network reachability checks
- HTTP server for local browser access and system monitoring
- MQTT client connectivity for publishing sensor data to an MQTT broker
- mbedTLS-backed TLS support for secure MQTT communication

The stack is designed to be dependable on constrained hardware, with retry loops and startup backoff logic to handle slow or transient network conditions.

## Background Sync Behavior

The project includes a background synchronization routine that continuously updates the temperature and humidity values on http client using javascript

## MQTT and Secure Connectivity

The firmware includes secure communication support using mbedTLS for MQTT over TLS 1.2. The project includes a bundled CA trust store so it can validate server certificates from commonly used public certificate authorities.

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

## OLED Display

A small OLED display can be connected to the STM32 to provide a quick visual summary of the device status without needing a browser session. Typical display content includes:

- Current temperature and humidity
- Error and heartbeat indicators

This makes the board useful for local standalone deployment or rapid debugging during bring-up.

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
   - OLED display I2C pins and address

4. Build and flash the firmware to your STM32F411 board.

5. Connect the board to the local network and power it on.

6. Open the embedded web UI in a browser using the board's IP address.

7. Monitor logs over UART at 115200 baud for debugging and telemetry status.

## Example Use Cases

- Remote environmental monitoring in a lab or workshop
- Indoor climate monitoring for smart building prototypes
- Embedded sensor dashboards with local HTTP access
- MQTT telemetry for IoT dashboards and data collection systems
- Educational platform for STM32 networking, telemetry, and UI development

## Notes

This project combines embedded networking, sensor acquisition, secure cloud connectivity, and a lightweight local UI in a single STM32-based firmware. The HTTP server, MQTT client, mbedTLS secure transport, lwIP networking stack, and OLED display provide a complete embedded monitoring platform suitable for learning, prototyping, and practical environmental monitoring.

## License

This project is provided as-is for educational and prototyping use. Update the license text as needed for your deployment or commercial usage.
