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
#define MQTT_BROKER_PORT 1883

QueueHandle_t xMQTTQueue;
TaskHandle_t mqttTaskHandle;
DHT22_Data_t MQTT_data;
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

Network network;
void NetworkInit(struct Network *n);
int NetworkConnect(struct Network *n, const char *host, int port);
int NetworkRead(struct Network *n, unsigned char *buffer, int len, int timeout_ms);
int NetworkWrite(struct Network *n, unsigned char *buffer, int len, int timeout_ms);
void NetworkDisconnect(struct Network *n);
void mqtt_connect_netconn(void){


   NetworkInit(&network);
   // Resolve broker hostname
   ip_addr_t server_ip;

   	    //IP4_ADDR(&server_ip, 18,195,150,147);
   	    //IP4_ADDR(&server_ip, 192,168,1,21);
   err_t err= netconn_gethostbyname("broker.hivemq.com", &server_ip);
   	    // Initialize network
   	    network.conn = netconn_new(NETCONN_TCP);
			if (!network.conn) {


			}

   	  rc = netconn_connect(network.conn, &server_ip, MQTT_BROKER_PORT);

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
//   rc = MQTTConnect(&client, &data);

   MQTTConnect(&client, &data);

}


void vMQTTTask(void *pvParameters)
{

	//tcp_packets();

//mqtt_test();for(;;);
	// tcp_client_init();
	//mqtt_connect_netconn();
	//mqtt_socket_connect();

	for(;;){
		if(MQTT_tcp_corrupt) {
			netconn_close(network.conn);
	       netconn_delete(network.conn); MQTT_tcp_corrupt=0;
		}
			if(!client.isconnected)
								{
									//try to connect to the broker
									MQTTDisconnect(&client);
									mqtt_connect_netconn();
									vTaskDelay(pdMS_TO_TICKS(3000));
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
}

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

