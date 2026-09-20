################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/DHT22_measure_task.c \
../Core/Src/Diagnostic_task.c \
../Core/Src/Display_task.c \
../Core/Src/Ethernet_task.c \
../Core/Src/MQTT_task.c \
../Core/Src/enc28j60.c \
../Core/Src/freertos.c \
../Core/Src/main.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_hal_timebase_tim.c \
../Core/Src/stm32f4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f4xx.c \
../Core/Src/tcp_test.c \
../Core/Src/thread_entry.c 

OBJS += \
./Core/Src/DHT22_measure_task.o \
./Core/Src/Diagnostic_task.o \
./Core/Src/Display_task.o \
./Core/Src/Ethernet_task.o \
./Core/Src/MQTT_task.o \
./Core/Src/enc28j60.o \
./Core/Src/freertos.o \
./Core/Src/main.o \
./Core/Src/stm32f4xx_hal_msp.o \
./Core/Src/stm32f4xx_hal_timebase_tim.o \
./Core/Src/stm32f4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f4xx.o \
./Core/Src/tcp_test.o \
./Core/Src/thread_entry.o 

C_DEPS += \
./Core/Src/DHT22_measure_task.d \
./Core/Src/Diagnostic_task.d \
./Core/Src/Display_task.d \
./Core/Src/Ethernet_task.d \
./Core/Src/MQTT_task.d \
./Core/Src/enc28j60.d \
./Core/Src/freertos.d \
./Core/Src/main.d \
./Core/Src/stm32f4xx_hal_msp.d \
./Core/Src/stm32f4xx_hal_timebase_tim.d \
./Core/Src/stm32f4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f4xx.d \
./Core/Src/tcp_test.d \
./Core/Src/thread_entry.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE '-DMBEDTLS_CONFIG_FILE=<mbedtls_config.h>' -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/MQTT/MQTTClient-C/src" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/MQTT/MQTTPacket/src" -I../MBEDTLS/App -I../Middlewares/Third_Party/mbedTLS/include/mbedtls -I../Middlewares/Third_Party/mbedTLS/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/DHT22_measure_task.cyclo ./Core/Src/DHT22_measure_task.d ./Core/Src/DHT22_measure_task.o ./Core/Src/DHT22_measure_task.su ./Core/Src/Diagnostic_task.cyclo ./Core/Src/Diagnostic_task.d ./Core/Src/Diagnostic_task.o ./Core/Src/Diagnostic_task.su ./Core/Src/Display_task.cyclo ./Core/Src/Display_task.d ./Core/Src/Display_task.o ./Core/Src/Display_task.su ./Core/Src/Ethernet_task.cyclo ./Core/Src/Ethernet_task.d ./Core/Src/Ethernet_task.o ./Core/Src/Ethernet_task.su ./Core/Src/MQTT_task.cyclo ./Core/Src/MQTT_task.d ./Core/Src/MQTT_task.o ./Core/Src/MQTT_task.su ./Core/Src/enc28j60.cyclo ./Core/Src/enc28j60.d ./Core/Src/enc28j60.o ./Core/Src/enc28j60.su ./Core/Src/freertos.cyclo ./Core/Src/freertos.d ./Core/Src/freertos.o ./Core/Src/freertos.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/stm32f4xx_hal_msp.cyclo ./Core/Src/stm32f4xx_hal_msp.d ./Core/Src/stm32f4xx_hal_msp.o ./Core/Src/stm32f4xx_hal_msp.su ./Core/Src/stm32f4xx_hal_timebase_tim.cyclo ./Core/Src/stm32f4xx_hal_timebase_tim.d ./Core/Src/stm32f4xx_hal_timebase_tim.o ./Core/Src/stm32f4xx_hal_timebase_tim.su ./Core/Src/stm32f4xx_it.cyclo ./Core/Src/stm32f4xx_it.d ./Core/Src/stm32f4xx_it.o ./Core/Src/stm32f4xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32f4xx.cyclo ./Core/Src/system_stm32f4xx.d ./Core/Src/system_stm32f4xx.o ./Core/Src/system_stm32f4xx.su ./Core/Src/tcp_test.cyclo ./Core/Src/tcp_test.d ./Core/Src/tcp_test.o ./Core/Src/tcp_test.su ./Core/Src/thread_entry.cyclo ./Core/Src/thread_entry.d ./Core/Src/thread_entry.o ./Core/Src/thread_entry.su

.PHONY: clean-Core-2f-Src

