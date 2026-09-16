/*
 * rtos_resources.h
 *
 *  Created on: Aug 26, 2026
 *      Author: Home
 */

#ifndef SRC_RTOS_RESOURCES_H_
#define SRC_RTOS_RESOURCES_H_
#include "cmsis_os.h"
#include "semphr.h"


extern QueueHandle_t dhtQueue;
extern SemaphoreHandle_t txSemaphore;
extern QueueHandle_t xMQTTQueue;
extern TaskHandle_t mqttTaskHandle;
extern TaskHandle_t EthernetTaskHandle;
extern TaskHandle_t displayTaskHandle;
extern TaskHandle_t dht22TaskHandle;
#endif /* SRC_RTOS_RESOURCES_H_ */
