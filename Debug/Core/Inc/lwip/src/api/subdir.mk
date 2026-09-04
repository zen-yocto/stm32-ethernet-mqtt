################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/lwip/src/api/api_lib.c \
../Core/Inc/lwip/src/api/api_msg.c \
../Core/Inc/lwip/src/api/err.c \
../Core/Inc/lwip/src/api/if_api.c \
../Core/Inc/lwip/src/api/netbuf.c \
../Core/Inc/lwip/src/api/netdb.c \
../Core/Inc/lwip/src/api/netifapi.c \
../Core/Inc/lwip/src/api/sockets.c \
../Core/Inc/lwip/src/api/tcpip.c 

OBJS += \
./Core/Inc/lwip/src/api/api_lib.o \
./Core/Inc/lwip/src/api/api_msg.o \
./Core/Inc/lwip/src/api/err.o \
./Core/Inc/lwip/src/api/if_api.o \
./Core/Inc/lwip/src/api/netbuf.o \
./Core/Inc/lwip/src/api/netdb.o \
./Core/Inc/lwip/src/api/netifapi.o \
./Core/Inc/lwip/src/api/sockets.o \
./Core/Inc/lwip/src/api/tcpip.o 

C_DEPS += \
./Core/Inc/lwip/src/api/api_lib.d \
./Core/Inc/lwip/src/api/api_msg.d \
./Core/Inc/lwip/src/api/err.d \
./Core/Inc/lwip/src/api/if_api.d \
./Core/Inc/lwip/src/api/netbuf.d \
./Core/Inc/lwip/src/api/netdb.d \
./Core/Inc/lwip/src/api/netifapi.d \
./Core/Inc/lwip/src/api/sockets.d \
./Core/Inc/lwip/src/api/tcpip.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/lwip/src/api/%.o Core/Inc/lwip/src/api/%.su Core/Inc/lwip/src/api/%.cyclo: ../Core/Inc/lwip/src/api/%.c Core/Inc/lwip/src/api/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/lwip" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-lwip-2f-src-2f-api

clean-Core-2f-Inc-2f-lwip-2f-src-2f-api:
	-$(RM) ./Core/Inc/lwip/src/api/api_lib.cyclo ./Core/Inc/lwip/src/api/api_lib.d ./Core/Inc/lwip/src/api/api_lib.o ./Core/Inc/lwip/src/api/api_lib.su ./Core/Inc/lwip/src/api/api_msg.cyclo ./Core/Inc/lwip/src/api/api_msg.d ./Core/Inc/lwip/src/api/api_msg.o ./Core/Inc/lwip/src/api/api_msg.su ./Core/Inc/lwip/src/api/err.cyclo ./Core/Inc/lwip/src/api/err.d ./Core/Inc/lwip/src/api/err.o ./Core/Inc/lwip/src/api/err.su ./Core/Inc/lwip/src/api/if_api.cyclo ./Core/Inc/lwip/src/api/if_api.d ./Core/Inc/lwip/src/api/if_api.o ./Core/Inc/lwip/src/api/if_api.su ./Core/Inc/lwip/src/api/netbuf.cyclo ./Core/Inc/lwip/src/api/netbuf.d ./Core/Inc/lwip/src/api/netbuf.o ./Core/Inc/lwip/src/api/netbuf.su ./Core/Inc/lwip/src/api/netdb.cyclo ./Core/Inc/lwip/src/api/netdb.d ./Core/Inc/lwip/src/api/netdb.o ./Core/Inc/lwip/src/api/netdb.su ./Core/Inc/lwip/src/api/netifapi.cyclo ./Core/Inc/lwip/src/api/netifapi.d ./Core/Inc/lwip/src/api/netifapi.o ./Core/Inc/lwip/src/api/netifapi.su ./Core/Inc/lwip/src/api/sockets.cyclo ./Core/Inc/lwip/src/api/sockets.d ./Core/Inc/lwip/src/api/sockets.o ./Core/Inc/lwip/src/api/sockets.su ./Core/Inc/lwip/src/api/tcpip.cyclo ./Core/Inc/lwip/src/api/tcpip.d ./Core/Inc/lwip/src/api/tcpip.o ./Core/Inc/lwip/src/api/tcpip.su

.PHONY: clean-Core-2f-Inc-2f-lwip-2f-src-2f-api

