/*
 * MQTT_task.c
 *
 *  Created on: Sep 4, 2026
 *      Author: Home
 */

#include "defines.h"
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "lwip/api.h"
#include "MQTTClient.h"
#include "rtos_resources.h"

#include "lwip/netdb.h"
#include "lwip/err.h"
#include "lwip/sys.h"
#include <string.h>
#include "mbedtls/net_sockets.h"
#include "mbedtls/ssl.h"
#include "mbedtls/entropy.h"
#include "mbedtls/ctr_drbg.h"
#include "mbedtls/certs.h"
#include "mbedtls/x509_crt.h"
#include "mbedtls/error.h"
extern mbedtls_ssl_context ssl;
extern mbedtls_ssl_config conf;
extern mbedtls_x509_crt cert;
extern mbedtls_ctr_drbg_context ctr_drbg;
extern mbedtls_entropy_context entropy;
extern const char amazon_root_ca1[];
extern const char digicert_root_ca[];
extern const char letsencrypt_root_x1[];


#define MQTT_BROKER_PORT 1883
#define MQTT_BROKER_PORT_TLS 8883

QueueHandle_t 	xMQTTQueue;
TaskHandle_t 	mqttTaskHandle;
DHT22_Data_t	MQTT_data;
extern uint8_t MQTT_tcp_corrupt;
extern int mqtt_socket_connect(void);
extern void  tcp_client_init(void);
extern void mqtt_test(void);
extern void tcp_packets(void);
void TimerInit(Timer *t);
void TimerCountdownMS(Timer *t, unsigned int );
char TimerIsExpired(Timer *t);
int TimerLeftMS(Timer* t);
void TimerCountdown(Timer* , unsigned int);
void vMQTTTask(void *pvParameters);
unsigned char sendbuf[250], readbuf[250];
int rc;
MQTTClient client;
void tls_init(void);
Network network;
void NetworkInit(struct Network *n);
int NetworkConnect(struct Network *n, const char *host, int port);
int NetworkRead(struct Network *n, unsigned char *buffer, int len, int timeout_ms);
int NetworkWrite(struct Network *n, unsigned char *buffer, int len, int timeout_ms);
void NetworkDisconnect(struct Network *n);
static int tls_send(void *ctx, const unsigned char *buf, size_t len);
int tls_recv(void *ctx, unsigned char *buf, size_t len);

int mqtt_connect_netconn(void){

	tls_init();
   // Initialize MQTT client
   MQTTClientInit(&client, &network, 3000,
                  sendbuf, sizeof(sendbuf),
                  readbuf, sizeof(readbuf));

   MQTTPacket_connectData data = MQTTPacket_connectData_initializer;
   data.MQTTVersion = 4;                 // use 3.1.1
   data.clientID.cstring = "stm32client";
   data.keepAliveInterval = 30;
   data.willFlag = 0;
   	data.cleansession = 1;
   rc = MQTTConnect(&client, &data);


   	// Send CONNECT frame over mbedTLS
   	if ((rc = MQTTConnect(&client, &data)) != 0) {
   	    // Handle MQTT Connection Failure
   	    printf("MQTT Connect failed with code: %d\r\n", rc);
   	} else {
   	    printf("Successfully connected to MQTT Broker over TLS!\r\n");
   	}
return rc;

}

void vMQTTTask(void *pvParameters)
{

	//tcp_packets();
	//tls_init();
//mqtt_test();for(;;);
	// tcp_client_init();
	//mqtt_connect_netconn();
	//mqtt_socket_connect();

	for(;;){

		if(MQTT_tcp_corrupt) {
			netconn_close(network.conn);
	       netconn_delete(network.conn); MQTT_tcp_corrupt=0;
		}
		if (!client.isconnected)
		{
		    printf("MQTT connection lost. Cleaning up and reconnecting...\r\n");
		     client.isconnected = 0;
		    mbedtls_ssl_close_notify(&ssl);
		    mbedtls_ssl_free(&ssl);
		    mbedtls_ssl_config_free(&conf);
		    if (network.conn != NULL) {
		        netconn_close(network.conn);
		        netconn_delete(network.conn);
		        network.conn = NULL;
		    }

		    vTaskDelay(pdMS_TO_TICKS(5000));
		    if (mqtt_connect_netconn() != 0) {
		        printf("Reconnection attempt failed. Retrying in next loop...\r\n");
		    }
		}

		if (xQueueReceive(xMQTTQueue, &MQTT_data, pdMS_TO_TICKS(100)) == pdPASS) {
				  MQTTMessage message;
				  char payload[128];

				// Format as JSON
			  snprintf(payload, sizeof(payload),
			"{\"temp\":%.1f,\"humid\":%.1f,\"errors\":%d,\"good\":%d}",
				MQTT_data.temp,
				MQTT_data.humid,
				MQTT_data.error_counter,
				MQTT_data.good_data_count);
				  message.qos = QOS1;
                  message.retained = 0;
                  message.payload = (void*)payload;
                  message.payloadlen = strlen(payload);
                  const char* topic = "stm32f411/telemetry";
                 rc= MQTTPublish(&client,topic, &message);
			 if (rc == 0) {
				 printf("Data published successfully!\r\n"
				        "  - Temperature: %.1f °C\r\n"
				        "  - Humidity:    %.1f %%\r\n"
				        "  - Errors:      %d\r\n"
				        "  - Good Packets: %d\r\n",
				        MQTT_data.temp,
				        MQTT_data.humid,
				        MQTT_data.error_counter,
				        MQTT_data.good_data_count);
			 } else {
				 printf("Failed to publish data, MQTT return code: %d\r\n", rc);
			 }

        }
			//MQTTYield(&client,100);
		 vTaskDelay(pdMS_TO_TICKS(1000)); // publish every 5s
		}
}
void CreateMQTTTask(void)
{
    xTaskCreate(
        vMQTTTask,              // Task function
        "MQTT Client Task",     // Task name
        MQTT_Stack_Size,        // Stack size (words, not bytes)
        NULL,                   // Task parameter
        MQTT_TASK_PRIORITY,     // Task priority
        &mqttTaskHandle         // Task handle
    );
}
/*
int NetworkRead(struct Network* n, unsigned char* buffer, int len, int timeout_ms) {
	int rc;
		struct netbuf *inbuf;
		int offset = 0;
		int bytes = 0;

		while(bytes < len) {
			if(n->buf != NULL) {
				inbuf = n->buf;
				offset = n->offset;
				rc = ERR_OK;
			} else {
				rc = netconn_recv(n->conn, &inbuf);
				offset = 0;
			}

			if(rc != ERR_OK) {
				if(rc != ERR_TIMEOUT) {
					bytes = -1;
				}
			break;
		} else {
			int nblen = netbuf_len(inbuf) - offset;
			if((bytes+nblen) > len) {
				netbuf_copy_partial(inbuf, buffer+bytes, len-bytes,offset);
				n->buf = inbuf;
				n->offset = offset + len - bytes;
				bytes = len;
			} else {
				netbuf_copy_partial(inbuf, buffer+bytes, nblen, offset);
				bytes += nblen;
				netbuf_delete(inbuf);
				n->buf = NULL;
				n->offset = 0;
			}
		}
	}
		return bytes;
}

int NetworkWrite(struct Network* n, unsigned char* buffer, int len, int timeout_ms) {
    // Send using lwIP netconn
	int rc = netconn_write(n->conn, buffer, len, NETCONN_NOCOPY);
		if(rc != ERR_OK) return -1;
		return len;
}*/
void NetworkDisconnect(struct Network* n) {
    if (n->conn) {
        netconn_close(n->conn);
        netconn_delete(n->conn);
        n->conn = NULL;
    }
}

void NetworkInit(struct Network* n) {
    n->conn       = NULL;              // no connection yet
    n->mqttread   = NetworkRead;       // assign function pointers
    n->mqttwrite  = NetworkWrite;
    n->disconnect = NetworkDisconnect;
}
 void TimerInit(Timer* timer) {
    timer->xTicksToWait = 0;
    timer->xStartTime = 0;
}

void TimerCountdownMS(Timer* timer, unsigned int timeout) {
    timer->xTicksToWait = pdMS_TO_TICKS(timeout);
    timer->xStartTime = xTaskGetTickCount();
}

void TimerCountdown(Timer* timer, unsigned int timeout) {
    TimerCountdownMS(timer, timeout * 1000);
}

int TimerLeftMS(Timer* timer) {
    TickType_t xElapsed = xTaskGetTickCount() - timer->xStartTime;
    if (timer->xTicksToWait > xElapsed) {
        return (timer->xTicksToWait - xElapsed)*portTICK_PERIOD_MS;
    }
    return 0;
}

char TimerIsExpired(Timer* timer) {
    return (xTaskGetTickCount() - timer->xStartTime) >= timer->xTicksToWait;
}

int stm32_entropy_source(void *data, unsigned char *output, size_t len, size_t *olen) {
    uint32_t tick =xTaskGetTickCount();

    for (size_t i = 0; i < len; i++) {

        output[i] = (unsigned char)(tick ^ (rand() & 0xFF));
    }

    *olen = len;
    return 0;
}
void tls_init(void)
{
	err_t err=0;
    ip_addr_t server_ip;


    printf("\r\n--- Starting Secure TLS Test ---\r\n");

    NetworkInit(&network);

    do {
         	 err = netconn_gethostbyname("broker.hivemq.com", &server_ip);
            if (err != ERR_OK) {
                printf("DNS lookup failed (%s). Retrying in 2 seconds...\r\n", lwip_strerr(err));
                vTaskDelay(pdMS_TO_TICKS(2000)); // Wait before trying again, keeping FreeRTOS happy
            }
        } while (err != ERR_OK);

        printf("DNS lookup successful! IP resolved.\r\n");
    	//IP4_ADDR(&server_ip, 192,168,1,27);
       	    // Initialize network
       	    network.conn = netconn_new(NETCONN_TCP);
    			if (!network.conn) {
				printf("Connection Failed!\r\n");
    			}

       	  rc = netconn_connect(network.conn, &server_ip, MQTT_BROKER_PORT_TLS);

    rc = mbedtls_x509_crt_parse(&cert,
                                (const unsigned char*) amazon_root_ca1,
                                strlen(amazon_root_ca1)+1);
    mbedtls_x509_crt_parse(&cert, (const unsigned char *)letsencrypt_root_x1, strlen(letsencrypt_root_x1));

    mbedtls_x509_crt_parse(&cert, (const unsigned char *)digicert_root_ca, strlen(digicert_root_ca));
    if (rc != 0)
        printf("Failed to parse cert: -0x%04X\r\n", -rc);
    mbedtls_ssl_conf_ca_chain(&conf, &cert, NULL);
    mbedtls_entropy_add_source(&entropy, stm32_entropy_source, NULL, 1, MBEDTLS_ENTROPY_SOURCE_STRONG);
    if((rc = mbedtls_ssl_config_defaults(&conf, MBEDTLS_SSL_IS_CLIENT, MBEDTLS_SSL_TRANSPORT_STREAM, MBEDTLS_SSL_PRESET_DEFAULT)) != 0)
      {
        printf(" failed\n  ! mbedtls_ssl_config_defaults returned %d\r\n", rc);

      }

    const char *pers = "stm32f411";
    rc= mbedtls_ctr_drbg_seed(
            &ctr_drbg,
            mbedtls_entropy_func,
            &entropy,
            (const unsigned char *)pers,
            strlen(pers));
    printf("DRBG Seed: %d\r\n", rc);



    mbedtls_ssl_conf_rng(&conf, mbedtls_ctr_drbg_random, &ctr_drbg);

    // Set Server Name Indication (SNI)
    rc = mbedtls_ssl_set_hostname(&ssl,"broker.hivemq.com");
    printf("SNI Hostname set: %d\r\n", rc);

    mbedtls_ssl_conf_max_frag_len(&conf, MBEDTLS_SSL_MAX_FRAG_LEN_4096);
    // Attach open socket handle & low-level I/O callbacks
    mbedtls_ssl_set_bio(&ssl, network.conn, tls_send, tls_recv, NULL);
    mbedtls_ssl_conf_authmode(&conf, MBEDTLS_SSL_VERIFY_REQUIRED);
    // Setup SSL buffer contexts
    rc = mbedtls_ssl_setup(&ssl, &conf);
    printf("SSL Setup: %d\r\n", rc);


    printf("Performing TLS Handshake...\r\n");
    	do
    	{
      	rc = mbedtls_ssl_handshake(&ssl);
      	} while(rc == MBEDTLS_ERR_SSL_WANT_READ ||
      	rc == MBEDTLS_ERR_SSL_WANT_WRITE);
    	if (rc != 0) {

    	    printf("Handshake Failed!\r\n");
    	    printf("  Return Code: -0x%04X (Decimal: %d)\r\n", -rc, rc);

    	} else {
    	    printf("TLS Handshake Successful!\r\n");
    	}

}
/*
int NetworkRead(struct Network* n, unsigned char* buffer, int len, int timeout_ms) {
	int rc;
		struct netbuf *inbuf;
		int offset = 0;
		int bytes = 0;

		while(bytes < len) {
			if(n->buf != NULL) {
				inbuf = n->buf;
				offset = n->offset;
				rc = ERR_OK;
			} else {
				rc = netconn_recv(n->conn, &inbuf);
				offset = 0;
			}

			if(rc != ERR_OK) {
				if(rc != ERR_TIMEOUT) {
					bytes = -1;
				}
			break;
		} else {
			int nblen = netbuf_len(inbuf) - offset;
			if((bytes+nblen) > len) {
				netbuf_copy_partial(inbuf, buffer+bytes, len-bytes,offset);
				n->buf = inbuf;
				n->offset = offset + len - bytes;
				bytes = len;
			} else {
				netbuf_copy_partial(inbuf, buffer+bytes, nblen, offset);
				bytes += nblen;
				netbuf_delete(inbuf);
				n->buf = NULL;
				n->offset = 0;
			}
		}
	}
		return bytes;
}

int NetworkWrite(struct Network* n, unsigned char* buffer, int len, int timeout_ms) {
    // Send using lwIP netconn
	int rc = netconn_write(n->conn, buffer, len, NETCONN_NOCOPY);
		if(rc != ERR_OK) return -1;
		return len;
}*/
// Example mapping for MQTT Transport Layer using mbedTLS
int NetworkRead(struct Network* n, unsigned char* buffer, int len, int timeout_ms)
{
    // Configure mbedTLS socket read timeout
    mbedtls_ssl_conf_read_timeout(&conf, timeout_ms);

    int ret = mbedtls_ssl_read(&ssl, buffer, len);
    if (ret > 0) {
        return ret; // Return bytes read
    }
    if (ret == MBEDTLS_ERR_SSL_WANT_READ || ret == MBEDTLS_ERR_SSL_TIMEOUT) {
        return 0; // Return 0 on timeout (non-fatal for Paho)
    }
    return -1; // Connection/TLS error
}

int NetworkWrite(struct Network* n, unsigned char* buffer, int len, int timeout_ms)
{
    int sent = 0;
    while (sent < len) {
        int ret = mbedtls_ssl_write(&ssl, buffer + sent, len - sent);
        if (ret > 0) {
            sent += ret;
        } else if (ret != MBEDTLS_ERR_SSL_WANT_WRITE) {
            return -1; // Error writing to TLS layer
        }
    }
    return sent;
}
static int tls_send(void *ctx, const unsigned char *buf, size_t len)
{
    struct netconn *conn = (struct netconn *)ctx;

      if(netconn_write(conn,
                     buf,
                     len,
                     NETCONN_COPY) != ERR_OK)
    {
        return MBEDTLS_ERR_NET_SEND_FAILED;
    }

    return (int)len;
}
int tls_recv(void *ctx, unsigned char *buf, size_t len)
{
    // Assuming your custom network structure or context tracks residual pbufs/offsets
    // If 'ctx' is just a raw netconn, you can cast or use a wrapper struct like your previous Network struct.
    struct netconn *conn = (struct netconn *)ctx;
    static struct pbuf *saved_inbuf = NULL;
    static u16_t saved_offset = 0;

    struct pbuf *inbuf;
    err_t err;
    u16_t copied = 0;

    // 1. If we have leftover bytes from a previous read, use them first!
    if (saved_inbuf != NULL) {
        inbuf = saved_inbuf;
    } else {
        // Otherwise, fetch a new TCP pbuf block from lwIP
        err = netconn_recv_tcp_pbuf(conn, &inbuf);
        if (err == ERR_OK && inbuf != NULL) {
            saved_offset = 0;
        } else if (err == ERR_TIMEOUT || err == ERR_WOULDBLOCK || err == ERR_INPROGRESS) {
            return MBEDTLS_ERR_SSL_WANT_READ;
        } else {
            return -1; // Connection closed or error
        }
    }

    // 2. Calculate remaining length in the current pbuf chain
    u16_t available_len = inbuf->tot_len - saved_offset;
    u16_t bytes_to_copy = (len < available_len) ? len : available_len;

    // 3. Copy the data into mbedTLS's buffer
    pbuf_copy_partial(inbuf, buf, bytes_to_copy, saved_offset);
    copied = bytes_to_copy;

    // 4. Manage the pbuf lifecycle (consume or cache remainder)
    if (available_len > len) {
        // There is still unread data in this pbuf! Save it for the next mbedTLS read call.
        saved_offset += bytes_to_copy;
        saved_inbuf = inbuf;
    } else {
        // We consumed this pbuf entirely. Free it and reset cache.
        pbuf_free(inbuf);
        saved_inbuf = NULL;
        saved_offset = 0;
    }

    return copied;
}
