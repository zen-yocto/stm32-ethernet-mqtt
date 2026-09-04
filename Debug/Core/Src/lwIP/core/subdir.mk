################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/lwIP/core/altcp.c \
../Core/Src/lwIP/core/altcp_alloc.c \
../Core/Src/lwIP/core/altcp_tcp.c \
../Core/Src/lwIP/core/def.c \
../Core/Src/lwIP/core/dns.c \
../Core/Src/lwIP/core/inet_chksum.c \
../Core/Src/lwIP/core/init.c \
../Core/Src/lwIP/core/ip.c \
../Core/Src/lwIP/core/mem.c \
../Core/Src/lwIP/core/memp.c \
../Core/Src/lwIP/core/netif.c \
../Core/Src/lwIP/core/pbuf.c \
../Core/Src/lwIP/core/raw.c \
../Core/Src/lwIP/core/stats.c \
../Core/Src/lwIP/core/sys.c \
../Core/Src/lwIP/core/tcp.c \
../Core/Src/lwIP/core/tcp_in.c \
../Core/Src/lwIP/core/tcp_out.c \
../Core/Src/lwIP/core/timeouts.c \
../Core/Src/lwIP/core/udp.c 

OBJS += \
./Core/Src/lwIP/core/altcp.o \
./Core/Src/lwIP/core/altcp_alloc.o \
./Core/Src/lwIP/core/altcp_tcp.o \
./Core/Src/lwIP/core/def.o \
./Core/Src/lwIP/core/dns.o \
./Core/Src/lwIP/core/inet_chksum.o \
./Core/Src/lwIP/core/init.o \
./Core/Src/lwIP/core/ip.o \
./Core/Src/lwIP/core/mem.o \
./Core/Src/lwIP/core/memp.o \
./Core/Src/lwIP/core/netif.o \
./Core/Src/lwIP/core/pbuf.o \
./Core/Src/lwIP/core/raw.o \
./Core/Src/lwIP/core/stats.o \
./Core/Src/lwIP/core/sys.o \
./Core/Src/lwIP/core/tcp.o \
./Core/Src/lwIP/core/tcp_in.o \
./Core/Src/lwIP/core/tcp_out.o \
./Core/Src/lwIP/core/timeouts.o \
./Core/Src/lwIP/core/udp.o 

C_DEPS += \
./Core/Src/lwIP/core/altcp.d \
./Core/Src/lwIP/core/altcp_alloc.d \
./Core/Src/lwIP/core/altcp_tcp.d \
./Core/Src/lwIP/core/def.d \
./Core/Src/lwIP/core/dns.d \
./Core/Src/lwIP/core/inet_chksum.d \
./Core/Src/lwIP/core/init.d \
./Core/Src/lwIP/core/ip.d \
./Core/Src/lwIP/core/mem.d \
./Core/Src/lwIP/core/memp.d \
./Core/Src/lwIP/core/netif.d \
./Core/Src/lwIP/core/pbuf.d \
./Core/Src/lwIP/core/raw.d \
./Core/Src/lwIP/core/stats.d \
./Core/Src/lwIP/core/sys.d \
./Core/Src/lwIP/core/tcp.d \
./Core/Src/lwIP/core/tcp_in.d \
./Core/Src/lwIP/core/tcp_out.d \
./Core/Src/lwIP/core/timeouts.d \
./Core/Src/lwIP/core/udp.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/lwIP/core/%.o Core/Src/lwIP/core/%.su Core/Src/lwIP/core/%.cyclo: ../Core/Src/lwIP/core/%.c Core/Src/lwIP/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/enc28j60" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/lwIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-lwIP-2f-core

clean-Core-2f-Src-2f-lwIP-2f-core:
	-$(RM) ./Core/Src/lwIP/core/altcp.cyclo ./Core/Src/lwIP/core/altcp.d ./Core/Src/lwIP/core/altcp.o ./Core/Src/lwIP/core/altcp.su ./Core/Src/lwIP/core/altcp_alloc.cyclo ./Core/Src/lwIP/core/altcp_alloc.d ./Core/Src/lwIP/core/altcp_alloc.o ./Core/Src/lwIP/core/altcp_alloc.su ./Core/Src/lwIP/core/altcp_tcp.cyclo ./Core/Src/lwIP/core/altcp_tcp.d ./Core/Src/lwIP/core/altcp_tcp.o ./Core/Src/lwIP/core/altcp_tcp.su ./Core/Src/lwIP/core/def.cyclo ./Core/Src/lwIP/core/def.d ./Core/Src/lwIP/core/def.o ./Core/Src/lwIP/core/def.su ./Core/Src/lwIP/core/dns.cyclo ./Core/Src/lwIP/core/dns.d ./Core/Src/lwIP/core/dns.o ./Core/Src/lwIP/core/dns.su ./Core/Src/lwIP/core/inet_chksum.cyclo ./Core/Src/lwIP/core/inet_chksum.d ./Core/Src/lwIP/core/inet_chksum.o ./Core/Src/lwIP/core/inet_chksum.su ./Core/Src/lwIP/core/init.cyclo ./Core/Src/lwIP/core/init.d ./Core/Src/lwIP/core/init.o ./Core/Src/lwIP/core/init.su ./Core/Src/lwIP/core/ip.cyclo ./Core/Src/lwIP/core/ip.d ./Core/Src/lwIP/core/ip.o ./Core/Src/lwIP/core/ip.su ./Core/Src/lwIP/core/mem.cyclo ./Core/Src/lwIP/core/mem.d ./Core/Src/lwIP/core/mem.o ./Core/Src/lwIP/core/mem.su ./Core/Src/lwIP/core/memp.cyclo ./Core/Src/lwIP/core/memp.d ./Core/Src/lwIP/core/memp.o ./Core/Src/lwIP/core/memp.su ./Core/Src/lwIP/core/netif.cyclo ./Core/Src/lwIP/core/netif.d ./Core/Src/lwIP/core/netif.o ./Core/Src/lwIP/core/netif.su ./Core/Src/lwIP/core/pbuf.cyclo ./Core/Src/lwIP/core/pbuf.d ./Core/Src/lwIP/core/pbuf.o ./Core/Src/lwIP/core/pbuf.su ./Core/Src/lwIP/core/raw.cyclo ./Core/Src/lwIP/core/raw.d ./Core/Src/lwIP/core/raw.o ./Core/Src/lwIP/core/raw.su ./Core/Src/lwIP/core/stats.cyclo ./Core/Src/lwIP/core/stats.d ./Core/Src/lwIP/core/stats.o ./Core/Src/lwIP/core/stats.su ./Core/Src/lwIP/core/sys.cyclo ./Core/Src/lwIP/core/sys.d ./Core/Src/lwIP/core/sys.o ./Core/Src/lwIP/core/sys.su ./Core/Src/lwIP/core/tcp.cyclo ./Core/Src/lwIP/core/tcp.d ./Core/Src/lwIP/core/tcp.o ./Core/Src/lwIP/core/tcp.su ./Core/Src/lwIP/core/tcp_in.cyclo ./Core/Src/lwIP/core/tcp_in.d ./Core/Src/lwIP/core/tcp_in.o ./Core/Src/lwIP/core/tcp_in.su ./Core/Src/lwIP/core/tcp_out.cyclo ./Core/Src/lwIP/core/tcp_out.d ./Core/Src/lwIP/core/tcp_out.o ./Core/Src/lwIP/core/tcp_out.su ./Core/Src/lwIP/core/timeouts.cyclo ./Core/Src/lwIP/core/timeouts.d ./Core/Src/lwIP/core/timeouts.o ./Core/Src/lwIP/core/timeouts.su ./Core/Src/lwIP/core/udp.cyclo ./Core/Src/lwIP/core/udp.d ./Core/Src/lwIP/core/udp.o ./Core/Src/lwIP/core/udp.su

.PHONY: clean-Core-2f-Src-2f-lwIP-2f-core

