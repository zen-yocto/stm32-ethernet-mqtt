/*
 * tcp_test.c
 *
 *  Created on: Sep 2, 2026
 *      Author: Home
 */

#include "tcp_test.h"

uint8_t tcp_busy=0;
uint8_t tcp_count=0;
static err_t tcp_client_connected(void *arg, struct tcp_pcb *tpcb, err_t err)
{
    if (err != ERR_OK) {
        tcp_abort(tpcb);
        return err;
    }
    tcp_output(tpcb);
    tcp_count++;
    // We reached SYN‑ACK → lwIP already sent ACK automatically.
    // Now immediately close the connection.
   // if(tcp_count>4)tcp_close(tpcb);
    return ERR_OK;
}

void tcp_client_init(void)
{
    ip_addr_t server_ip;
    struct tcp_pcb *pcb;

    // Your PC LAN IP
    //IP4_ADDR(&server_ip, 104,18,37,76);
    IP4_ADDR(&server_ip, 18,196,210,147);
if(!tcp_busy){
    pcb = tcp_new();
    if (!pcb)
        return;

    // Register only the "connected" callback
    tcp_recv(pcb, NULL);   // no receive handler
    tcp_err(pcb, NULL);

    // Connect → lwIP sends SYN
    // When SYN‑ACK arrives, tcp_client_connected() is called
    tcp_connect(pcb, &server_ip, 1883, tcp_client_connected);
    tcp_busy=1;
}
}
#include "lwip/sockets.h"
#include "lwip/inet.h"
#include "lwip/netdb.h"

#define MQTT_PORT 1883

int mqtt_socket_connect(void)
{
    int sock;
    struct sockaddr_in broker_addr;

    // 1. Create socket
    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0) {
        printf("Socket create failed\n");
        return -1;
    }

    // 2. Prepare broker address (your IP)
    memset(&broker_addr, 0, sizeof(broker_addr));
    broker_addr.sin_family = AF_INET;
    broker_addr.sin_port = htons(MQTT_PORT);
    broker_addr.sin_addr.s_addr = inet_addr("192.168.1.21");//inet_addr("18.196.210.147");   // HiveMQ broker

    // 3. Connect to broker
    if (connect(sock, (struct sockaddr *)&broker_addr, sizeof(broker_addr)) < 0) {
        printf("TCP connect failed\n");
        close(sock);
        return -1;
    }

    printf("TCP connected to HiveMQ broker\n");

    // 4. Build minimal MQTT CONNECT packet
    uint8_t mqtt_connect[] = {
        0x10,       // CONNECT packet type
        0x12,       // Remaining length (18 bytes after this field)

        0x00, 0x04, // Protocol name length
        'M','Q','T','T',
        0x04,       // Protocol level (MQTT 3.1.1)

        0x02,       // Connect flags (Clean Session)
        0x00, 0x3C, // Keepalive = 60 seconds

        0x00, 0x04, // Client ID length = 4
        'T','E','S','T' // Client ID = "TEST"
    };

    // 5. Send CONNECT
    if (send(sock, mqtt_connect, sizeof(mqtt_connect), 0) < 0) {
        printf("Send failed\n");
        close(sock);
        return -1;
    }

    printf("MQTT CONNECT sent\n");

    // 6. Receive CONNACK
    uint8_t rxbuf[120];

    int len = recv(sock, rxbuf, sizeof(rxbuf), 0);

    if (len > 0) {
        printf("Received %d bytes\n", len);
        printf("CONNACK: %02X %02X\n", rxbuf[0], rxbuf[1]);
    } else {
        printf("No CONNACK received\n");
    }

    // 7. Close socket
   // close(sock);
    printf("Socket closed\n");

    return 0;
}

#include "lwip/tcp.h"

static struct tcp_pcb *mqtt_pcb;

static err_t mqtt_recv(void *arg, struct tcp_pcb *tpcb,
                       struct pbuf *p, err_t err)
{
    if (p == NULL) return ERR_OK;

    uint8_t *payload = (uint8_t *)p->payload;

    // Check for CONNACK
    if (payload[0] == 0x20) {
        printf("Got CONNACK, now publishing...\n");

        // Example MQTT PUBLISH packet (QoS0)
        const char publish[] = {
            0x30, 0x0F,             // PUBLISH fixed header
            0x00, 0x0A,             // Topic length = 10
            't','e','s','t','/','t','o','p','i','c',
            'H','e','l','l','o','!' // Payload
        };

        tcp_write(tpcb, publish, sizeof(publish), TCP_WRITE_FLAG_COPY);
        tcp_output(tpcb);
    }

    pbuf_free(p);
    return ERR_OK;
}

static err_t mqtt_connected(void *arg, struct tcp_pcb *tpcb, err_t err)
{
    if (err != ERR_OK) {
        printf("Connection failed\n");
        return err;
    }

    printf("TCP connected, sending MQTT CONNECT...\n");

    // Example MQTT CONNECT packet
    const char connect[] = {
        0x10, 0x16,             // CONNECT fixed header (Remaining Length = 22)
        0x00, 0x04, 'M','Q','T','T', // Protocol name
        0x04,                   // Protocol level = 4 (MQTT 3.1.1)
        0x02,                   // Connect flags (CleanSession)
        0x00, 0x3C,             // KeepAlive = 60
        0x00, 0x0A,             // ClientID length = 10
        't','c','p','_','c','l','i','e','n','t'
    };


    tcp_write(tpcb, connect, sizeof(connect), TCP_WRITE_FLAG_COPY);
    tcp_output(tpcb);

    return ERR_OK;
}

void mqtt_test(void)
{
    ip_addr_t server_ip;
    IP4_ADDR(&server_ip, 18,196,210,147);

    mqtt_pcb = tcp_new();
    if (!mqtt_pcb) {
        printf("Failed to create PCB\n");
        return;
    }

    tcp_recv(mqtt_pcb, mqtt_recv);

    tcp_connect(mqtt_pcb, &server_ip, 1883, mqtt_connected);
}
#include "lwip/pbuf.h"
#include "lwip/netif.h"
static const uint8_t test_frame[] = {
    // Ethernet II
    0x2c,0xf0,0x5d,0x94,0xf1,0x15,    // dst MAC
    0x00,0x17,0x22,0xed,0xa5,0x01,    // src MAC
    0x08,0x00,                        // IPv4

    // IPv4 header
    0x45,0x00,
    0x00,0x6b,                        // total length = 107
    0x00,0x00,                        // ID
    0x00,0x00,                        // flags/fragment
    0xff,                             // TTL
    0x06,                             // TCP
    0x00,0x00,                        // checksum (ignored)
    0xc0,0xa8,0x01,0x39,              // src IP 192.168.1.57
    0x12,0xc3,0x96,0x93,              // dst IP 18.195.150.147

    // TCP header
    0xcc,0xd0,                        // src port
    0x07,0x5b,                        // dst port 1883
    0x00,0x00,0x19,0x87,              // seq
    0x00,0x00,0x00,0x00,              // ack
    0x50,                             // data offset
    0x18,                             // PSH+ACK
    0x39,0x04,                        // window
    0x00,0x00,                        // checksum
    0x00,0x00,                        // urgent

    // MQTT PUBLISH
    0x30,                             // PUBLISH
    0x3a,                             // Remaining Length = 58

    // Topic length = 12
    0x00,0x0c,

    // Topic "stm32/sensor"
    0x73,0x74,0x6d,0x33,0x32,0x2f,0x73,0x65,0x6e,0x73,0x6f,0x72,

    // Payload {"temp":0.0,"humid":0.0,"errors":0,"good":0}
    0x7b,0x22,0x74,0x65,0x6d,0x70,0x22,0x3a,0x30,0x2e,0x30,0x2c,
    0x22,0x68,0x75,0x6d,0x69,0x64,0x22,0x3a,0x30,0x2e,0x30,0x2c,
    0x22,0x65,0x72,0x72,0x6f,0x72,0x73,0x22,0x3a,0x30,0x2c,
    0x22,0x67,0x6f,0x6f,0x64,0x22,0x3a,0x30,0x7d
};
static const uint16_t test_frame_len = sizeof(test_frame);



extern err_t low_level_output(struct netif *netif, struct pbuf *p);

void send_test_publish(struct netif *netif)
{
    struct pbuf *p = pbuf_alloc(PBUF_RAW, test_frame_len, PBUF_POOL);
    if (!p) {
        //printf("pbuf_alloc failed\n");
        return;
    }

    memcpy(p->payload, test_frame, test_frame_len);

    err_t err = low_level_output(netif, p);
    if (err != ERR_OK) {
       // printf("low_level_output failed: %d\n", err);
    }

    pbuf_free(p);
}


void tcp_packets(void) {
    struct netconn *conn;
    struct netbuf *buf;
    uint16_t packet_id = 1;
    ip_addr_t server_ip;
     IP4_ADDR(&server_ip, 192,168,1,21);
    conn = netconn_new(NETCONN_TCP);
    if (netconn_connect(conn, &server_ip, 1883) == ERR_OK) {
       // printf("Connected to PC server\n");

        while (1) {
            // Build packet: [ID + payload]
            char payload[32];
            sprintf(payload, "DATA_%u", packet_id);

            uint8_t pkt[2 + sizeof(payload)];
            pkt[0] = (packet_id >> 8) & 0xFF;
            pkt[1] = packet_id & 0xFF;
            memcpy(&pkt[2], payload, sizeof(payload));

            netconn_write(conn, pkt, sizeof(pkt), NETCONN_COPY);
         //   printf("Sent packet %u\n", packet_id);

            // Wait for ACK
            if (netconn_recv(conn, &buf) == ERR_OK) {
                void *data;
                u16_t len;
                netbuf_data(buf, &data, &len);

                if (len >= 3) {
                    uint16_t ack_id = ( ((uint8_t*)data)[0] << 8 ) | ((uint8_t*)data)[1];
                    uint8_t status = ((uint8_t*)data)[2];

                    if (status == 1 && ack_id == packet_id) {
                      //  printf("ACK for %u\n", ack_id);
                        packet_id++;
                    } else {
                     //   printf("NACK for %u, retransmitting...\n", ack_id);
                        // retransmit same packet_id
                    }
                }
                netbuf_delete(buf);
            }
        }
    }
}
