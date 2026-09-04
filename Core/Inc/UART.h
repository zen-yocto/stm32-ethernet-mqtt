/*
 * UART.h
 *
 *  Created on: Aug 19, 2026
 *      Author: Home
 */

#ifndef INC_UART_H_
#define INC_UART_H_
#include <stdint.h>
#include <string.h>
#include <main.h>

typedef enum {
	OK =1,
	FAULT,
	WIFI_CONNECTED,
	TCP_CONNECTED,
	SENT,
	UNKNOWN

}esp_error;
extern UART_HandleTypeDef huart6;
extern esp_error esp_code;
extern uint8_t UART6_RX_Buffer[256];
extern volatile uint16_t UART6_RX_Index;
extern char payload[64];
extern float temp;
extern float humid;
extern char buffer[20];
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart);
void ESP8266_Send(char *cmd);
esp_error ESP8266_ProcessLine(char *line);
void ESP8266_test_sequence_init(void);
void ESP8266_test_sequence_transmit(void);

#endif /* INC_UART_H_ */
