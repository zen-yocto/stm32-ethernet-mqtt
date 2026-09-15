/*
 * thread_entry.c
 *
 *  Created on: Aug 26, 2026
 *      Author: Home
 */

#include "cmsis_os.h"
#include "defines.h"
extern void CreateDisplayTask(void);
extern void CreateDHT22Task(void);
extern void CreateEthernetTask(void);
extern void CreateMQTTTask(void);

void main_thread_entry(void){
CreateEthernetTask();
CreateMQTTTask();
CreateDHT22Task();
CreateDisplayTask();
}



