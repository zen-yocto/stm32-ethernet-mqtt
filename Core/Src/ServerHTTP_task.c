/*
 * ServerHTTP_task.c
 *
 *  Created on: Oct 22, 2026
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
#include "lwip/api.h"
#include <stdio.h>
#include <string.h>
typedef struct {
    struct netconn *conn;
    struct netbuf  *buf;
    u16_t          offset;
} ClientContext;
QueueHandle_t 	xHTTPQueue;
DHT22_Data_t	HTTP_data;
TaskHandle_t serverTaskHandle;

extern uint8_t eth_link_up;

static char http_response[4048];
static char html_body[4000];
static const char *HTML_TEMPLATE =
    "<!DOCTYPE html><html style='height:100%%; width:100%%;'><head><title>STM32 Telemetry</title>"
    "<meta charset='utf-8'>"
    "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
    "<style>"
    "*, *::before, *::after { box-sizing: border-box; }"
    "html, body { height: 100%%; width: 100%%; margin: 0; padding: 0; background-color: #ffffff; overflow: hidden; }"
    "html { display: flex; justify-content: center; align-items: center; }"
    "body { font-family: 'Segoe UI', Arial, sans-serif; display: flex; justify-content: center; align-items: center; width: 100%%; }"
    ".card { background: #0e131f; padding: 45px; border-radius: 20px; width: 85%%; max-width: 400px; text-align: center; border: 1px solid #1f293d; }"
    "h2 { color: #38bdf8; margin-bottom: 25px; font-size: 28px; font-weight: 600; }"
    "hr { border: 0; border-top: 1px solid #1f293d; margin: 20px 0; }"
    ".metric { font-size: 18px; color: #94a3b8; margin: 15px 0; }"
    ".val { font-size: 42px; color: #38bdf8; font-weight: bold; display: inline-block; margin-top: 5px; }"
    "</style>"
    "<script>"
    "function updateData() {"
    "  fetch('/api/data').then(r => r.json()).then(d => {"
    "    document.getElementById('t').innerText = d.temp.toFixed(1);"
    "    document.getElementById('h').innerText = d.humid.toFixed(1);"
    "  }).catch(err => console.log('Fetch error:', err));"
    "}"
    "setInterval(updateData, 2000);"
    "</script>"
    "</head><body>"
    "<div class='card'>"
    "<h2>STM32 Live Monitor</h2>"
    "<hr>"
    "<div class='metric'>Temperature<br><span id='t' class='val'>%.1f</span> &deg;C</div>"
    "<div class='metric' style='margin-top:25px;'>Humidity<br><span id='h' class='val'>%.1f</span> %%</div>"
    "</div>"
    "</body></html>";
const char *json_header =
                     "HTTP/1.1 200 OK\r\n"
                     "Content-Type: application/json; charset=utf-8\r\n"
                     "Content-Length: %d\r\n"
                     "Connection: close\r\n\r\n%s";
const char *html_header =
		"HTTP/1.1 200 OK\r\n"
		"Content-Type: text/html; charset=utf-8\r\n"
		"Content-Length: %d\r\n"
		"Connection: close\r\n\r\n%s";
void ServerHttp_Task(void *argument)
{
    struct netconn *conn, *newconn;
    err_t status;
    struct netbuf *buf;
    void *data;
    u16_t len;

    // 1. Create TCP connection listener
    conn = netconn_new(NETCONN_TCP);
    if (conn == NULL) {
        printf("Failed to create TCP connection!\r\n");
        vTaskDelete(NULL);
    }

    status = netconn_bind(conn, IP_ADDR_ANY, 80);
    if (status != ERR_OK) {
        vTaskDelete(NULL);
    }

    status = netconn_listen(conn);
    if (status != ERR_OK) {
        vTaskDelete(NULL);
    }

    printf("HTTP Static Server started on port 80\r\n");

    for(;;)
    {

        // Wait for a client connection
    	if(eth_link_up){
        status = netconn_accept(conn, &newconn);

        if (status == ERR_OK)
        {

                // Directly receive the browser's incoming request packet
                status = netconn_recv(newconn, &buf);
                if (status != ERR_OK) {
                    break; // Client disconnected or error occurred
                }

                netbuf_data(buf, &data, &len);

                // Copy request safely to local stack scratchpad for parsing
                char rx_buffer[256];
                int copy_len = (len < sizeof(rx_buffer) - 1) ? len : sizeof(rx_buffer) - 1;
                memcpy(rx_buffer, data, copy_len);
                rx_buffer[copy_len] = '\0';

                // Done with the received netbuf immediately
                netbuf_delete(buf);
                buf = NULL;

                // Non-blocking queue check for latest telemetry updates
                if (xQueueReceive(xHTTPQueue, &HTTP_data, 0) == pdTRUE) {
                    // Updated with latest sensor data
                }

                int html_len = 0;

                // Check if browser requested the JSON API endpoint via AJAX
                if (memcmp(rx_buffer, "GET /api/data", 13) == 0)
                {
                    char json_body[128];
                    int json_len = snprintf(json_body, sizeof(json_body),
                                            "{\"temp\":%.1f,\"humid\":%.1f}",
                                            HTTP_data.temp, HTTP_data.humid);



                    html_len = snprintf(http_response, sizeof(http_response),
                                        json_header, json_len, json_body);
                }
		else
		{
	int body_len = snprintf(html_body, sizeof(html_body),
			HTML_TEMPLATE, HTTP_data.temp, HTTP_data.humid);



	html_len = snprintf(http_response, sizeof(http_response),
						html_header, body_len, html_body);
		}

                // Send response back to the browser
                err_t write_err = netconn_write(newconn, http_response, html_len, NETCONN_COPY);
                if (write_err != ERR_OK) {
                    printf("Write error: %d\r\n", write_err);
                }


            }
            netconn_close(newconn);
            netconn_delete(newconn);
    	}
            vTaskDelay(200);
    }
}
// 3. Initialization function
void CreateServerTask(void)
	{
	  xTaskCreate(
		  ServerHttp_Task,          // task function
		  "HTTP Server Task",         // name
		  server_Stack_Size,                 // stack
		  NULL,                // argument
		  SERVER_TASK_PRIORITY,  // priority
		  &serverTaskHandle     // handle
	  );
	}
