################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lwIP/src/apps/http/fs.c \
../Middlewares/Third_Party/lwIP/src/apps/http/httpd.c 

OBJS += \
./Middlewares/Third_Party/lwIP/src/apps/http/fs.o \
./Middlewares/Third_Party/lwIP/src/apps/http/httpd.o 

C_DEPS += \
./Middlewares/Third_Party/lwIP/src/apps/http/fs.d \
./Middlewares/Third_Party/lwIP/src/apps/http/httpd.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lwIP/src/apps/http/%.o Middlewares/Third_Party/lwIP/src/apps/http/%.su Middlewares/Third_Party/lwIP/src/apps/http/%.cyclo: ../Middlewares/Third_Party/lwIP/src/apps/http/%.c Middlewares/Third_Party/lwIP/src/apps/http/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE '-DMBEDTLS_CONFIG_FILE=<mbedtls_config.h>' -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/MQTT/MQTTClient-C/src" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/MQTT/MQTTPacket/src" -I../MBEDTLS/App -I../Middlewares/Third_Party/mbedTLS/include/mbedtls -I../Middlewares/Third_Party/mbedTLS/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-src-2f-apps-2f-http

clean-Middlewares-2f-Third_Party-2f-lwIP-2f-src-2f-apps-2f-http:
	-$(RM) ./Middlewares/Third_Party/lwIP/src/apps/http/fs.cyclo ./Middlewares/Third_Party/lwIP/src/apps/http/fs.d ./Middlewares/Third_Party/lwIP/src/apps/http/fs.o ./Middlewares/Third_Party/lwIP/src/apps/http/fs.su ./Middlewares/Third_Party/lwIP/src/apps/http/httpd.cyclo ./Middlewares/Third_Party/lwIP/src/apps/http/httpd.d ./Middlewares/Third_Party/lwIP/src/apps/http/httpd.o ./Middlewares/Third_Party/lwIP/src/apps/http/httpd.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-src-2f-apps-2f-http

