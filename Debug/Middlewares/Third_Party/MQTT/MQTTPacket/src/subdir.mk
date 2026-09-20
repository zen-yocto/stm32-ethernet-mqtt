################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectClient.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectServer.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTDeserializePublish.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTFormat.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTPacket.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSerializePublish.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeClient.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeServer.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.c \
../Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.c 

OBJS += \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectClient.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectServer.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTDeserializePublish.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTFormat.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTPacket.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSerializePublish.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeClient.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeServer.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.o \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.o 

C_DEPS += \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectClient.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectServer.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTDeserializePublish.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTFormat.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTPacket.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSerializePublish.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeClient.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeServer.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.d \
./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/MQTT/MQTTPacket/src/%.o Middlewares/Third_Party/MQTT/MQTTPacket/src/%.su Middlewares/Third_Party/MQTT/MQTTPacket/src/%.cyclo: ../Middlewares/Third_Party/MQTT/MQTTPacket/src/%.c Middlewares/Third_Party/MQTT/MQTTPacket/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE '-DMBEDTLS_CONFIG_FILE=<mbedtls_config.h>' -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/MQTT/MQTTClient-C/src" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/MQTT/MQTTPacket/src" -I../MBEDTLS/App -I../Middlewares/Third_Party/mbedTLS/include/mbedtls -I../Middlewares/Third_Party/mbedTLS/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-MQTT-2f-MQTTPacket-2f-src

clean-Middlewares-2f-Third_Party-2f-MQTT-2f-MQTTPacket-2f-src:
	-$(RM) ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectClient.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectClient.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectClient.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectClient.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectServer.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectServer.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectServer.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTConnectServer.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTDeserializePublish.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTDeserializePublish.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTDeserializePublish.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTDeserializePublish.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTFormat.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTFormat.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTFormat.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTFormat.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTPacket.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTPacket.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTPacket.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTPacket.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSerializePublish.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSerializePublish.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSerializePublish.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSerializePublish.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeClient.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeClient.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeClient.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeClient.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeServer.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeServer.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeServer.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTSubscribeServer.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.su ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.cyclo ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.d ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.o ./Middlewares/Third_Party/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-MQTT-2f-MQTTPacket-2f-src

