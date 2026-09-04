/*
 * defines.h
 *
 *  Created on: Aug 26, 2026
 *      Author: Home
 */

#ifndef THREAD_ENTRY_H_
#define THREAD_ENTRY_H_
#include "rtos_resources.h"

//#define USE_DHCP    0
#define DHT22_TASK_PRIORITY  14
#define DISPLAY_TASK_PRIORITY 13
#define ETHERNET_TASK_PRIORITY 12
#define MQTT_TASK_PRIORITY 10
//#define DEFAULT_TASK_PRIORITY 1

#define ethernet_Stack_Size 	configMINIMAL_STACK_SIZE * 8
#define display_Stack_Size 		configMINIMAL_STACK_SIZE * 4
#define DHT22_Stack_Size  		configMINIMAL_STACK_SIZE * 4

#define DHT_PORT GPIOC
#define DHT_PIN  GPIO_PIN_1

typedef struct {
    float temp;
    float humid;
    int error_counter;
    int good_data_count;
} DHT22_Data_t;

#endif /* THREAD_ENTRY_H_ */
