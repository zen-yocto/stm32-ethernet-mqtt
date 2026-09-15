/*
 * Display_task.c
 *
 *  Created on: Aug 26, 2026
 *      Author: Home
 */
#include <stdio.h>
#include "ssd1306_tests.h"
#include "ssd1306_fonts.h"
#include "ssd1306.h"
#include "cmsis_os.h"
#include "defines.h"

char buffer[20];
DHT22_Data_t dht22_display = {0};
TaskHandle_t displayTaskHandle;

void Display_Task(void *argument){
	uint8_t count=0;
 	  ssd1306_Init();
 for(;;){
	 if (xQueueReceive(dhtQueue, &dht22_display, pdMS_TO_TICKS(100)) == pdTRUE){
		sprintf(buffer, "%.2fC", dht22_display.temp);
		ssd1306_SetCursor(15, 5);
		ssd1306_WriteString("Temp", Font_7x10, White);
		ssd1306_SetCursor(15, 16);
		ssd1306_WriteString(buffer, Font_7x10, White);
		sprintf(buffer, "%.2f%c ", dht22_display.humid,'%');
		ssd1306_SetCursor(15, 26);
		ssd1306_WriteString("Humidity", Font_7x10, White);
		ssd1306_SetCursor(15, 37);
		ssd1306_WriteString(buffer, Font_7x10, White);
		if(dht22_display.error_counter){
			sprintf(buffer, "Error : %0.2f",(float)dht22_display.error_counter/dht22_display.good_data_count);
			ssd1306_SetCursor(15, 48);
			  ssd1306_WriteString(buffer, Font_7x10, White);
				}
	 	 	 }
	 	 	 ssd1306_SetCursor(90, 5);
	 	 	sprintf(buffer, "%3d",count) ;
	 	 	ssd1306_WriteString(buffer, Font_7x10, White);
	 	 	count= (count+1)%255;
	 	 	ssd1306_UpdateScreen();
	 	 	vTaskDelay(100);
 	 }

}
  void CreateDisplayTask(void)
	{
	  xTaskCreate(
		  Display_Task,          // task function
		  "OLed display Task",         // name
		  display_Stack_Size,                 // stack
		  NULL,                // argument
		  DISPLAY_TASK_PRIORITY,  // priority
		  &displayTaskHandle     // handle
	  );
	}
