/*
 * DH22_measure_task.c
 *
 *  Created on: Aug 26, 2026
 *      Author: Home
 */
#include "cmsis_os.h"
#include "rtos_resources.h"
#include  "defines.h"
#include <main.h>

uint8_t data[5] = {0};
TaskHandle_t dht22TaskHandle;

DHT22_Data_t dht22_measure={0};
QueueHandle_t dhtQueue;
void DHT_SetPinInput(void);
void DHT_SetPinOutput(void);

uint8_t DHT_ReadByte(void);
uint8_t DHT_Read(float *temperature, float *humidity);

void DHT22_Task(void *argument)
{
	 dhtQueue = xQueueCreate(5, sizeof(DHT22_Data_t));
	 xMQTTQueue = xQueueCreate(5, sizeof(DHT22_Data_t));
	 for(;;){
		if (DHT_Read(&dht22_measure.temp, &dht22_measure.humid) == 0)
			{
			  printf("Temp: %.1f C, Hum: %.1f %%\n", dht22_measure.temp, dht22_measure.humid);
			  dht22_measure.good_data_count++;
				  }
					  else
					  {
						  printf("DHT22 read error\n");
						  dht22_measure.error_counter++;

					  }
					if (uxQueueSpacesAvailable(dhtQueue) > 0) {
						// Queue has space, safe to send
						xQueueSend(dhtQueue, &dht22_measure, 0);
					} else {
						// Queue is full

					}
					if (uxQueueSpacesAvailable(xMQTTQueue) > 0) {
						// Queue has space, safe to send
						xQueueSend(xMQTTQueue, &dht22_measure, 0);
					} else {
						// Queue is full

					}
					vTaskDelay(pdMS_TO_TICKS(2000));
			}
}
  void CreateDHT22Task(void)
  {
	  xTaskCreate(
		  DHT22_Task,          // task function
		  "DHT22 Measurement Task",         // name
		  DHT22_Stack_Size,                 // stack
		  NULL,                // argument
		  DHT22_TASK_PRIORITY,  // priority
		  &dht22TaskHandle     // handle
	  );
  }

void Delay_us(uint32_t us)
{
  uint32_t cycles = (SystemCoreClock / 1000000) * us;
  uint32_t start = DWT->CYCCNT;
  while ((DWT->CYCCNT - start) < cycles);
}
void DHT_SetPinOutput(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = DHT_PIN;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(DHT_PORT, &GPIO_InitStruct);
}

void DHT_SetPinInput(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = DHT_PIN;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(DHT_PORT, &GPIO_InitStruct);
}
uint8_t DHT_ReadByte(void)
{
  uint8_t result = 0;

  for (int i = 0; i < 8; i++)
  {
	  // Wait for LOW
	  while (!HAL_GPIO_ReadPin(DHT_PORT, DHT_PIN));

	  Delay_us(30);

	  if (HAL_GPIO_ReadPin(DHT_PORT, DHT_PIN))
		  result |= (1 << (7 - i));

	  uint32_t timeout = 10000;
	        while (HAL_GPIO_ReadPin(DHT_PORT, DHT_PIN))
	        {
	            if (--timeout == 0)
	                return 0xFF;   // timeout → abort byte read
	        }

  }

  return result;
}
uint8_t DHT_Read(float *temperature, float *humidity)
{


  // Start signal
  DHT_SetPinOutput();
  HAL_GPIO_WritePin(DHT_PORT, DHT_PIN, GPIO_PIN_RESET);
  Delay_us(2000);  // 2 ms
  HAL_GPIO_WritePin(DHT_PORT, DHT_PIN, GPIO_PIN_SET);
  DHT_SetPinInput();

  Delay_us(40);

  if (HAL_GPIO_ReadPin(DHT_PORT, DHT_PIN))
	return 1; // Sensor didn't pull low

  while (!HAL_GPIO_ReadPin(DHT_PORT, DHT_PIN));
  while (HAL_GPIO_ReadPin(DHT_PORT, DHT_PIN));

  // Read 5 bytes
  for (int i = 0; i < 5; i++)
	  data[i] = DHT_ReadByte();

  // Checksum
  if (data[4] != (data[0] + data[1] + data[2] + data[3]))
	  return 2;

  *humidity = (data[0] << 8 | data[1]) * 0.1f;
  *temperature = ((data[2] & 0x7F) << 8 | data[3]) * 0.1f;

  if (data[2] & 0x80)
	  *temperature *= -1;

  return 0; // OK
}
