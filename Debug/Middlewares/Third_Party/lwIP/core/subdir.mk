################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lwIP/core/altcp.c \
../Middlewares/Third_Party/lwIP/core/altcp_alloc.c \
../Middlewares/Third_Party/lwIP/core/altcp_tcp.c \
../Middlewares/Third_Party/lwIP/core/def.c \
../Middlewares/Third_Party/lwIP/core/dns.c \
../Middlewares/Third_Party/lwIP/core/inet_chksum.c \
../Middlewares/Third_Party/lwIP/core/init.c \
../Middlewares/Third_Party/lwIP/core/ip.c \
../Middlewares/Third_Party/lwIP/core/mem.c \
../Middlewares/Third_Party/lwIP/core/memp.c \
../Middlewares/Third_Party/lwIP/core/netif.c \
../Middlewares/Third_Party/lwIP/core/pbuf.c \
../Middlewares/Third_Party/lwIP/core/raw.c \
../Middlewares/Third_Party/lwIP/core/stats.c \
../Middlewares/Third_Party/lwIP/core/sys.c \
../Middlewares/Third_Party/lwIP/core/tcp.c \
../Middlewares/Third_Party/lwIP/core/tcp_in.c \
../Middlewares/Third_Party/lwIP/core/tcp_out.c \
../Middlewares/Third_Party/lwIP/core/timeouts.c \
../Middlewares/Third_Party/lwIP/core/udp.c 

OBJS += \
./Middlewares/Third_Party/lwIP/core/altcp.o \
./Middlewares/Third_Party/lwIP/core/altcp_alloc.o \
./Middlewares/Third_Party/lwIP/core/altcp_tcp.o \
./Middlewares/Third_Party/lwIP/core/def.o \
./Middlewares/Third_Party/lwIP/core/dns.o \
./Middlewares/Third_Party/lwIP/core/inet_chksum.o \
./Middlewares/Third_Party/lwIP/core/init.o \
./Middlewares/Third_Party/lwIP/core/ip.o \
./Middlewares/Third_Party/lwIP/core/mem.o \
./Middlewares/Third_Party/lwIP/core/memp.o \
./Middlewares/Third_Party/lwIP/core/netif.o \
./Middlewares/Third_Party/lwIP/core/pbuf.o \
./Middlewares/Third_Party/lwIP/core/raw.o \
./Middlewares/Third_Party/lwIP/core/stats.o \
./Middlewares/Third_Party/lwIP/core/sys.o \
./Middlewares/Third_Party/lwIP/core/tcp.o \
./Middlewares/Third_Party/lwIP/core/tcp_in.o \
./Middlewares/Third_Party/lwIP/core/tcp_out.o \
./Middlewares/Third_Party/lwIP/core/timeouts.o \
./Middlewares/Third_Party/lwIP/core/udp.o 

C_DEPS += \
./Middlewares/Third_Party/lwIP/core/altcp.d \
./Middlewares/Third_Party/lwIP/core/altcp_alloc.d \
./Middlewares/Third_Party/lwIP/core/altcp_tcp.d \
./Middlewares/Third_Party/lwIP/core/def.d \
./Middlewares/Third_Party/lwIP/core/dns.d \
./Middlewares/Third_Party/lwIP/core/inet_chksum.d \
./Middlewares/Third_Party/lwIP/core/init.d \
./Middlewares/Third_Party/lwIP/core/ip.d \
./Middlewares/Third_Party/lwIP/core/mem.d \
./Middlewares/Third_Party/lwIP/core/memp.d \
./Middlewares/Third_Party/lwIP/core/netif.d \
./Middlewares/Third_Party/lwIP/core/pbuf.d \
./Middlewares/Third_Party/lwIP/core/raw.d \
./Middlewares/Third_Party/lwIP/core/stats.d \
./Middlewares/Third_Party/lwIP/core/sys.d \
./Middlewares/Third_Party/lwIP/core/tcp.d \
./Middlewares/Third_Party/lwIP/core/tcp_in.d \
./Middlewares/Third_Party/lwIP/core/tcp_out.d \
./Middlewares/Third_Party/lwIP/core/timeouts.d \
./Middlewares/Third_Party/lwIP/core/udp.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lwIP/core/%.o Middlewares/Third_Party/lwIP/core/%.su Middlewares/Third_Party/lwIP/core/%.cyclo: ../Middlewares/Third_Party/lwIP/core/%.c Middlewares/Third_Party/lwIP/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/include" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/system" -I"D:/Documents/STM32/OLED_on_SPI/Core/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-core

clean-Middlewares-2f-Third_Party-2f-lwIP-2f-core:
	-$(RM) ./Middlewares/Third_Party/lwIP/core/altcp.cyclo ./Middlewares/Third_Party/lwIP/core/altcp.d ./Middlewares/Third_Party/lwIP/core/altcp.o ./Middlewares/Third_Party/lwIP/core/altcp.su ./Middlewares/Third_Party/lwIP/core/altcp_alloc.cyclo ./Middlewares/Third_Party/lwIP/core/altcp_alloc.d ./Middlewares/Third_Party/lwIP/core/altcp_alloc.o ./Middlewares/Third_Party/lwIP/core/altcp_alloc.su ./Middlewares/Third_Party/lwIP/core/altcp_tcp.cyclo ./Middlewares/Third_Party/lwIP/core/altcp_tcp.d ./Middlewares/Third_Party/lwIP/core/altcp_tcp.o ./Middlewares/Third_Party/lwIP/core/altcp_tcp.su ./Middlewares/Third_Party/lwIP/core/def.cyclo ./Middlewares/Third_Party/lwIP/core/def.d ./Middlewares/Third_Party/lwIP/core/def.o ./Middlewares/Third_Party/lwIP/core/def.su ./Middlewares/Third_Party/lwIP/core/dns.cyclo ./Middlewares/Third_Party/lwIP/core/dns.d ./Middlewares/Third_Party/lwIP/core/dns.o ./Middlewares/Third_Party/lwIP/core/dns.su ./Middlewares/Third_Party/lwIP/core/inet_chksum.cyclo ./Middlewares/Third_Party/lwIP/core/inet_chksum.d ./Middlewares/Third_Party/lwIP/core/inet_chksum.o ./Middlewares/Third_Party/lwIP/core/inet_chksum.su ./Middlewares/Third_Party/lwIP/core/init.cyclo ./Middlewares/Third_Party/lwIP/core/init.d ./Middlewares/Third_Party/lwIP/core/init.o ./Middlewares/Third_Party/lwIP/core/init.su ./Middlewares/Third_Party/lwIP/core/ip.cyclo ./Middlewares/Third_Party/lwIP/core/ip.d ./Middlewares/Third_Party/lwIP/core/ip.o ./Middlewares/Third_Party/lwIP/core/ip.su ./Middlewares/Third_Party/lwIP/core/mem.cyclo ./Middlewares/Third_Party/lwIP/core/mem.d ./Middlewares/Third_Party/lwIP/core/mem.o ./Middlewares/Third_Party/lwIP/core/mem.su ./Middlewares/Third_Party/lwIP/core/memp.cyclo ./Middlewares/Third_Party/lwIP/core/memp.d ./Middlewares/Third_Party/lwIP/core/memp.o ./Middlewares/Third_Party/lwIP/core/memp.su ./Middlewares/Third_Party/lwIP/core/netif.cyclo ./Middlewares/Third_Party/lwIP/core/netif.d ./Middlewares/Third_Party/lwIP/core/netif.o ./Middlewares/Third_Party/lwIP/core/netif.su ./Middlewares/Third_Party/lwIP/core/pbuf.cyclo ./Middlewares/Third_Party/lwIP/core/pbuf.d ./Middlewares/Third_Party/lwIP/core/pbuf.o ./Middlewares/Third_Party/lwIP/core/pbuf.su ./Middlewares/Third_Party/lwIP/core/raw.cyclo ./Middlewares/Third_Party/lwIP/core/raw.d ./Middlewares/Third_Party/lwIP/core/raw.o ./Middlewares/Third_Party/lwIP/core/raw.su ./Middlewares/Third_Party/lwIP/core/stats.cyclo ./Middlewares/Third_Party/lwIP/core/stats.d ./Middlewares/Third_Party/lwIP/core/stats.o ./Middlewares/Third_Party/lwIP/core/stats.su ./Middlewares/Third_Party/lwIP/core/sys.cyclo ./Middlewares/Third_Party/lwIP/core/sys.d ./Middlewares/Third_Party/lwIP/core/sys.o ./Middlewares/Third_Party/lwIP/core/sys.su ./Middlewares/Third_Party/lwIP/core/tcp.cyclo ./Middlewares/Third_Party/lwIP/core/tcp.d ./Middlewares/Third_Party/lwIP/core/tcp.o ./Middlewares/Third_Party/lwIP/core/tcp.su ./Middlewares/Third_Party/lwIP/core/tcp_in.cyclo ./Middlewares/Third_Party/lwIP/core/tcp_in.d ./Middlewares/Third_Party/lwIP/core/tcp_in.o ./Middlewares/Third_Party/lwIP/core/tcp_in.su ./Middlewares/Third_Party/lwIP/core/tcp_out.cyclo ./Middlewares/Third_Party/lwIP/core/tcp_out.d ./Middlewares/Third_Party/lwIP/core/tcp_out.o ./Middlewares/Third_Party/lwIP/core/tcp_out.su ./Middlewares/Third_Party/lwIP/core/timeouts.cyclo ./Middlewares/Third_Party/lwIP/core/timeouts.d ./Middlewares/Third_Party/lwIP/core/timeouts.o ./Middlewares/Third_Party/lwIP/core/timeouts.su ./Middlewares/Third_Party/lwIP/core/udp.cyclo ./Middlewares/Third_Party/lwIP/core/udp.d ./Middlewares/Third_Party/lwIP/core/udp.o ./Middlewares/Third_Party/lwIP/core/udp.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-core

