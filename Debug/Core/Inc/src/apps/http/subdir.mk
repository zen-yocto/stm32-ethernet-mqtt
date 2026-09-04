################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/src/apps/http/altcp_proxyconnect.c \
../Core/Inc/src/apps/http/http_client.c \
../Core/Inc/src/apps/http/httpd.c 

OBJS += \
./Core/Inc/src/apps/http/altcp_proxyconnect.o \
./Core/Inc/src/apps/http/http_client.o \
./Core/Inc/src/apps/http/httpd.o 

C_DEPS += \
./Core/Inc/src/apps/http/altcp_proxyconnect.d \
./Core/Inc/src/apps/http/http_client.d \
./Core/Inc/src/apps/http/httpd.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/src/apps/http/%.o Core/Inc/src/apps/http/%.su Core/Inc/src/apps/http/%.cyclo: ../Core/Inc/src/apps/http/%.c Core/Inc/src/apps/http/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-src-2f-apps-2f-http

clean-Core-2f-Inc-2f-src-2f-apps-2f-http:
	-$(RM) ./Core/Inc/src/apps/http/altcp_proxyconnect.cyclo ./Core/Inc/src/apps/http/altcp_proxyconnect.d ./Core/Inc/src/apps/http/altcp_proxyconnect.o ./Core/Inc/src/apps/http/altcp_proxyconnect.su ./Core/Inc/src/apps/http/http_client.cyclo ./Core/Inc/src/apps/http/http_client.d ./Core/Inc/src/apps/http/http_client.o ./Core/Inc/src/apps/http/http_client.su ./Core/Inc/src/apps/http/httpd.cyclo ./Core/Inc/src/apps/http/httpd.d ./Core/Inc/src/apps/http/httpd.o ./Core/Inc/src/apps/http/httpd.su

.PHONY: clean-Core-2f-Inc-2f-src-2f-apps-2f-http

