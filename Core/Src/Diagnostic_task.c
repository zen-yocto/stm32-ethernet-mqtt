/*
 * Diagnostic_task.c
 *
 *  Created on: Sep 16, 2026
 *      Author: Home
 */
#include "rtos_resources.h"
#include "defines.h"
#include <stm32f4xx_hal.h>
#include <stdio.h>
#include <string.h>
TaskHandle_t diagTaskHandle;
extern void CreateDisplayTask(void);
extern void CreateDHT22Task(void);
extern void CreateEthernetTask(void);
extern void CreateMQTTTask(void);
extern void CreateDiagnosticsTask(void);
extern UART_HandleTypeDef huart2;
int _write(int file, char *ptr, int len)
{
    HAL_UART_Transmit(&huart2, (uint8_t*)ptr, len, HAL_MAX_DELAY);
    return len;
}



void vDiagnosticsTask(void *pvParameters)
{

    for(;;)
    {
     //   uint32_t now = xTaskGetTickCount();

         //  printf("DIAG: MQTT task last alive: %lu \n", now - mqtt_last_alive);


     UBaseType_t mqtt_hwm = uxTaskGetStackHighWaterMark(mqttTaskHandle);

           printf("DIAG: MQTT task stack (%lu)\r\n", mqtt_hwm);

         //  printf("DIAG: NET task last alive: %lu \n", now - net_last_alive);
        UBaseType_t net_hwm = uxTaskGetStackHighWaterMark(EthernetTaskHandle);

            printf("DIAG: NET task stack (%lu)\r\n", net_hwm);

        UBaseType_t sensor_hwm = uxTaskGetStackHighWaterMark(dht22TaskHandle);

      //  printf("DIAG: DHT22 task last alive: %lu \n", now - sensor_last_alive);
            printf("DIAG: SENSOR task stack(%lu)\r\n", sensor_hwm);

        UBaseType_t display_hwm = uxTaskGetStackHighWaterMark(displayTaskHandle);
       // printf("DIAG: Display task last alive: %lu \n", now - display_last_alive);
            printf("DIAG: DISPLAY task stack (%lu)\r\n", display_hwm);
        UBaseType_t diag_hwm = uxTaskGetStackHighWaterMark(diagTaskHandle);

            printf("DIAG: DIAGNOSTICS task stack (%lu)\r\n", diag_hwm);


        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}



void CreateDiagnosticsTask(void)
{
    xTaskCreate(
        vDiagnosticsTask,        // Task function
        "Diagnostics Task",      // Task name
        diag_Stack_Size,         // Stack size
        NULL,                    // Parameter
        DIAG_TASK_PRIORITY,      // Priority
        &diagTaskHandle          // Handle
    );
}


