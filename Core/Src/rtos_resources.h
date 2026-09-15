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
//extern SemaphoreHandle_t Netif_IRQSemaphore;
extern SemaphoreHandle_t txSemaphore;
extern QueueHandle_t xMQTTQueue;

#endif /* SRC_RTOS_RESOURCES_H_ */
