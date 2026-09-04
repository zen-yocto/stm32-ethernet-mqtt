################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/lwIP/apps/http/altcp_proxyconnect.c \
../Core/Src/lwIP/apps/http/fs.c \
../Core/Src/lwIP/apps/http/fsdata.c \
../Core/Src/lwIP/apps/http/http_client.c \
../Core/Src/lwIP/apps/http/httpd.c 

OBJS += \
./Core/Src/lwIP/apps/http/altcp_proxyconnect.o \
./Core/Src/lwIP/apps/http/fs.o \
./Core/Src/lwIP/apps/http/fsdata.o \
./Core/Src/lwIP/apps/http/http_client.o \
./Core/Src/lwIP/apps/http/httpd.o 

C_DEPS += \
./Core/Src/lwIP/apps/http/altcp_proxyconnect.d \
./Core/Src/lwIP/apps/http/fs.d \
./Core/Src/lwIP/apps/http/fsdata.d \
./Core/Src/lwIP/apps/http/http_client.d \
./Core/Src/lwIP/apps/http/httpd.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/lwIP/apps/http/%.o Core/Src/lwIP/apps/http/%.su Core/Src/lwIP/apps/http/%.cyclo: ../Core/Src/lwIP/apps/http/%.c Core/Src/lwIP/apps/http/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/enc28j60" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/lwIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-lwIP-2f-apps-2f-http

clean-Core-2f-Src-2f-lwIP-2f-apps-2f-http:
	-$(RM) ./Core/Src/lwIP/apps/http/altcp_proxyconnect.cyclo ./Core/Src/lwIP/apps/http/altcp_proxyconnect.d ./Core/Src/lwIP/apps/http/altcp_proxyconnect.o ./Core/Src/lwIP/apps/http/altcp_proxyconnect.su ./Core/Src/lwIP/apps/http/fs.cyclo ./Core/Src/lwIP/apps/http/fs.d ./Core/Src/lwIP/apps/http/fs.o ./Core/Src/lwIP/apps/http/fs.su ./Core/Src/lwIP/apps/http/fsdata.cyclo ./Core/Src/lwIP/apps/http/fsdata.d ./Core/Src/lwIP/apps/http/fsdata.o ./Core/Src/lwIP/apps/http/fsdata.su ./Core/Src/lwIP/apps/http/http_client.cyclo ./Core/Src/lwIP/apps/http/http_client.d ./Core/Src/lwIP/apps/http/http_client.o ./Core/Src/lwIP/apps/http/http_client.su ./Core/Src/lwIP/apps/http/httpd.cyclo ./Core/Src/lwIP/apps/http/httpd.d ./Core/Src/lwIP/apps/http/httpd.o ./Core/Src/lwIP/apps/http/httpd.su

.PHONY: clean-Core-2f-Src-2f-lwIP-2f-apps-2f-http

