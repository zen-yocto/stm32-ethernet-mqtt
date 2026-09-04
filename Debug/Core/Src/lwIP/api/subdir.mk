################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/lwIP/api/api_lib.c \
../Core/Src/lwIP/api/api_msg.c \
../Core/Src/lwIP/api/err.c \
../Core/Src/lwIP/api/if_api.c \
../Core/Src/lwIP/api/netbuf.c \
../Core/Src/lwIP/api/netdb.c \
../Core/Src/lwIP/api/netifapi.c \
../Core/Src/lwIP/api/sockets.c \
../Core/Src/lwIP/api/tcpip.c 

OBJS += \
./Core/Src/lwIP/api/api_lib.o \
./Core/Src/lwIP/api/api_msg.o \
./Core/Src/lwIP/api/err.o \
./Core/Src/lwIP/api/if_api.o \
./Core/Src/lwIP/api/netbuf.o \
./Core/Src/lwIP/api/netdb.o \
./Core/Src/lwIP/api/netifapi.o \
./Core/Src/lwIP/api/sockets.o \
./Core/Src/lwIP/api/tcpip.o 

C_DEPS += \
./Core/Src/lwIP/api/api_lib.d \
./Core/Src/lwIP/api/api_msg.d \
./Core/Src/lwIP/api/err.d \
./Core/Src/lwIP/api/if_api.d \
./Core/Src/lwIP/api/netbuf.d \
./Core/Src/lwIP/api/netdb.d \
./Core/Src/lwIP/api/netifapi.d \
./Core/Src/lwIP/api/sockets.d \
./Core/Src/lwIP/api/tcpip.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/lwIP/api/%.o Core/Src/lwIP/api/%.su Core/Src/lwIP/api/%.cyclo: ../Core/Src/lwIP/api/%.c Core/Src/lwIP/api/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/enc28j60" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/lwIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-lwIP-2f-api

clean-Core-2f-Src-2f-lwIP-2f-api:
	-$(RM) ./Core/Src/lwIP/api/api_lib.cyclo ./Core/Src/lwIP/api/api_lib.d ./Core/Src/lwIP/api/api_lib.o ./Core/Src/lwIP/api/api_lib.su ./Core/Src/lwIP/api/api_msg.cyclo ./Core/Src/lwIP/api/api_msg.d ./Core/Src/lwIP/api/api_msg.o ./Core/Src/lwIP/api/api_msg.su ./Core/Src/lwIP/api/err.cyclo ./Core/Src/lwIP/api/err.d ./Core/Src/lwIP/api/err.o ./Core/Src/lwIP/api/err.su ./Core/Src/lwIP/api/if_api.cyclo ./Core/Src/lwIP/api/if_api.d ./Core/Src/lwIP/api/if_api.o ./Core/Src/lwIP/api/if_api.su ./Core/Src/lwIP/api/netbuf.cyclo ./Core/Src/lwIP/api/netbuf.d ./Core/Src/lwIP/api/netbuf.o ./Core/Src/lwIP/api/netbuf.su ./Core/Src/lwIP/api/netdb.cyclo ./Core/Src/lwIP/api/netdb.d ./Core/Src/lwIP/api/netdb.o ./Core/Src/lwIP/api/netdb.su ./Core/Src/lwIP/api/netifapi.cyclo ./Core/Src/lwIP/api/netifapi.d ./Core/Src/lwIP/api/netifapi.o ./Core/Src/lwIP/api/netifapi.su ./Core/Src/lwIP/api/sockets.cyclo ./Core/Src/lwIP/api/sockets.d ./Core/Src/lwIP/api/sockets.o ./Core/Src/lwIP/api/sockets.su ./Core/Src/lwIP/api/tcpip.cyclo ./Core/Src/lwIP/api/tcpip.d ./Core/Src/lwIP/api/tcpip.o ./Core/Src/lwIP/api/tcpip.su

.PHONY: clean-Core-2f-Src-2f-lwIP-2f-api

