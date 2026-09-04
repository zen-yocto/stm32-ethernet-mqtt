/*
 * UART.c
 *
 *  Created on: Aug 19, 2026
 *      Author: Home
 */
#include "UART.h"



uint8_t UART6_RX_Buffer[256];
volatile uint16_t UART6_RX_Index=0;
esp_error esp_code;
char payload[64];
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == USART6)
    {
        uint8_t c = UART6_RX_Buffer[UART6_RX_Index];

        // End of line → process command
        if (c == '\n')
        {
            UART6_RX_Buffer[UART6_RX_Index] = 0;  // null terminate

            // Process received line
            ESP8266_ProcessLine((char*)UART6_RX_Buffer);

            UART6_RX_Index = 0;  // reset buffer
        }
        else
        {
            UART6_RX_Index++;
            if (UART6_RX_Index >= sizeof(UART6_RX_Buffer))
                UART6_RX_Index = 0; // prevent overflow
        }

        // Restart interrupt
        HAL_UART_Receive_IT(&huart6, &UART6_RX_Buffer[UART6_RX_Index], 1);
    }
}

void ESP8266_Send(char *cmd)
{
    HAL_UART_Transmit(&huart6, (uint8_t*)cmd, strlen(cmd), 100);
}

esp_error ESP8266_ProcessLine(char *line)
{
    if (strstr(line, "OK"))
    {
        esp_code = OK;
    }
    else if (strstr(line, "ERROR"))
    {
    	esp_code = FAULT;
    }
    else if (strstr(line, "WIFI CONNECTED"))
    {
    	esp_code = WIFI_CONNECTED;
    }
    else if (strstr(line, "TCP CONNECTED"))
    {
    	esp_code = TCP_CONNECTED;
    }
    else if (strstr(line, "SENT:"))
    {
    	esp_code = SENT;
    }
    else
    {
    	esp_code = UNKNOWN;
    }
    return esp_code;
}
void ESP8266_test_sequence_init(void){
	ESP8266_Send("AT\r\n");
	HAL_Delay(500);

	ESP8266_Send("AT+CWJAP=\"Fiber_Home\",\"Eluga@7800#\"\r\n");
	HAL_Delay(2000);
	// Now send MQTT CONNECT packet
	ESP8266_Send("AT+CIPSTART=\"TCP\",\"broker.hivemq.com\",1883\r\n");
	HAL_Delay(1000);
	ESP8266_Send("AT+CIPSEND=16\r\n");
	HAL_Delay(100);

	uint8_t mqtt_connect[] = {
	0x10, 0x0E, 0x00, 0x04, 'M','Q','T','T', 0x04, 0x02,
	0x00, 0x3C, 0x00, 0x03, 'S','T','M'
	};

	HAL_UART_Transmit(&huart6, mqtt_connect, sizeof(mqtt_connect), 100);
}
void ESP8266_test_sequence_transmit(void){
//todo:

	sprintf(payload, "{ \"temperature\": %.2f, \"humidity\": %.2f }", temp, humid);

	ESP8266_Send("PUB stm32/sensors ");
	ESP8266_Send(payload);
	ESP8266_Send("\n");

}
