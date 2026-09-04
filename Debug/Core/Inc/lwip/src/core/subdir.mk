################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/lwip/src/core/altcp.c \
../Core/Inc/lwip/src/core/altcp_alloc.c \
../Core/Inc/lwip/src/core/altcp_tcp.c \
../Core/Inc/lwip/src/core/def.c \
../Core/Inc/lwip/src/core/dns.c \
../Core/Inc/lwip/src/core/inet_chksum.c \
../Core/Inc/lwip/src/core/init.c \
../Core/Inc/lwip/src/core/ip.c \
../Core/Inc/lwip/src/core/mem.c \
../Core/Inc/lwip/src/core/memp.c \
../Core/Inc/lwip/src/core/netif.c \
../Core/Inc/lwip/src/core/pbuf.c \
../Core/Inc/lwip/src/core/raw.c \
../Core/Inc/lwip/src/core/stats.c \
../Core/Inc/lwip/src/core/sys.c \
../Core/Inc/lwip/src/core/tcp.c \
../Core/Inc/lwip/src/core/tcp_in.c \
../Core/Inc/lwip/src/core/tcp_out.c \
../Core/Inc/lwip/src/core/timeouts.c \
../Core/Inc/lwip/src/core/udp.c 

OBJS += \
./Core/Inc/lwip/src/core/altcp.o \
./Core/Inc/lwip/src/core/altcp_alloc.o \
./Core/Inc/lwip/src/core/altcp_tcp.o \
./Core/Inc/lwip/src/core/def.o \
./Core/Inc/lwip/src/core/dns.o \
./Core/Inc/lwip/src/core/inet_chksum.o \
./Core/Inc/lwip/src/core/init.o \
./Core/Inc/lwip/src/core/ip.o \
./Core/Inc/lwip/src/core/mem.o \
./Core/Inc/lwip/src/core/memp.o \
./Core/Inc/lwip/src/core/netif.o \
./Core/Inc/lwip/src/core/pbuf.o \
./Core/Inc/lwip/src/core/raw.o \
./Core/Inc/lwip/src/core/stats.o \
./Core/Inc/lwip/src/core/sys.o \
./Core/Inc/lwip/src/core/tcp.o \
./Core/Inc/lwip/src/core/tcp_in.o \
./Core/Inc/lwip/src/core/tcp_out.o \
./Core/Inc/lwip/src/core/timeouts.o \
./Core/Inc/lwip/src/core/udp.o 

C_DEPS += \
./Core/Inc/lwip/src/core/altcp.d \
./Core/Inc/lwip/src/core/altcp_alloc.d \
./Core/Inc/lwip/src/core/altcp_tcp.d \
./Core/Inc/lwip/src/core/def.d \
./Core/Inc/lwip/src/core/dns.d \
./Core/Inc/lwip/src/core/inet_chksum.d \
./Core/Inc/lwip/src/core/init.d \
./Core/Inc/lwip/src/core/ip.d \
./Core/Inc/lwip/src/core/mem.d \
./Core/Inc/lwip/src/core/memp.d \
./Core/Inc/lwip/src/core/netif.d \
./Core/Inc/lwip/src/core/pbuf.d \
./Core/Inc/lwip/src/core/raw.d \
./Core/Inc/lwip/src/core/stats.d \
./Core/Inc/lwip/src/core/sys.d \
./Core/Inc/lwip/src/core/tcp.d \
./Core/Inc/lwip/src/core/tcp_in.d \
./Core/Inc/lwip/src/core/tcp_out.d \
./Core/Inc/lwip/src/core/timeouts.d \
./Core/Inc/lwip/src/core/udp.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/lwip/src/core/%.o Core/Inc/lwip/src/core/%.su Core/Inc/lwip/src/core/%.cyclo: ../Core/Inc/lwip/src/core/%.c Core/Inc/lwip/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/lwip" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-lwip-2f-src-2f-core

clean-Core-2f-Inc-2f-lwip-2f-src-2f-core:
	-$(RM) ./Core/Inc/lwip/src/core/altcp.cyclo ./Core/Inc/lwip/src/core/altcp.d ./Core/Inc/lwip/src/core/altcp.o ./Core/Inc/lwip/src/core/altcp.su ./Core/Inc/lwip/src/core/altcp_alloc.cyclo ./Core/Inc/lwip/src/core/altcp_alloc.d ./Core/Inc/lwip/src/core/altcp_alloc.o ./Core/Inc/lwip/src/core/altcp_alloc.su ./Core/Inc/lwip/src/core/altcp_tcp.cyclo ./Core/Inc/lwip/src/core/altcp_tcp.d ./Core/Inc/lwip/src/core/altcp_tcp.o ./Core/Inc/lwip/src/core/altcp_tcp.su ./Core/Inc/lwip/src/core/def.cyclo ./Core/Inc/lwip/src/core/def.d ./Core/Inc/lwip/src/core/def.o ./Core/Inc/lwip/src/core/def.su ./Core/Inc/lwip/src/core/dns.cyclo ./Core/Inc/lwip/src/core/dns.d ./Core/Inc/lwip/src/core/dns.o ./Core/Inc/lwip/src/core/dns.su ./Core/Inc/lwip/src/core/inet_chksum.cyclo ./Core/Inc/lwip/src/core/inet_chksum.d ./Core/Inc/lwip/src/core/inet_chksum.o ./Core/Inc/lwip/src/core/inet_chksum.su ./Core/Inc/lwip/src/core/init.cyclo ./Core/Inc/lwip/src/core/init.d ./Core/Inc/lwip/src/core/init.o ./Core/Inc/lwip/src/core/init.su ./Core/Inc/lwip/src/core/ip.cyclo ./Core/Inc/lwip/src/core/ip.d ./Core/Inc/lwip/src/core/ip.o ./Core/Inc/lwip/src/core/ip.su ./Core/Inc/lwip/src/core/mem.cyclo ./Core/Inc/lwip/src/core/mem.d ./Core/Inc/lwip/src/core/mem.o ./Core/Inc/lwip/src/core/mem.su ./Core/Inc/lwip/src/core/memp.cyclo ./Core/Inc/lwip/src/core/memp.d ./Core/Inc/lwip/src/core/memp.o ./Core/Inc/lwip/src/core/memp.su ./Core/Inc/lwip/src/core/netif.cyclo ./Core/Inc/lwip/src/core/netif.d ./Core/Inc/lwip/src/core/netif.o ./Core/Inc/lwip/src/core/netif.su ./Core/Inc/lwip/src/core/pbuf.cyclo ./Core/Inc/lwip/src/core/pbuf.d ./Core/Inc/lwip/src/core/pbuf.o ./Core/Inc/lwip/src/core/pbuf.su ./Core/Inc/lwip/src/core/raw.cyclo ./Core/Inc/lwip/src/core/raw.d ./Core/Inc/lwip/src/core/raw.o ./Core/Inc/lwip/src/core/raw.su ./Core/Inc/lwip/src/core/stats.cyclo ./Core/Inc/lwip/src/core/stats.d ./Core/Inc/lwip/src/core/stats.o ./Core/Inc/lwip/src/core/stats.su ./Core/Inc/lwip/src/core/sys.cyclo ./Core/Inc/lwip/src/core/sys.d ./Core/Inc/lwip/src/core/sys.o ./Core/Inc/lwip/src/core/sys.su ./Core/Inc/lwip/src/core/tcp.cyclo ./Core/Inc/lwip/src/core/tcp.d ./Core/Inc/lwip/src/core/tcp.o ./Core/Inc/lwip/src/core/tcp.su ./Core/Inc/lwip/src/core/tcp_in.cyclo ./Core/Inc/lwip/src/core/tcp_in.d ./Core/Inc/lwip/src/core/tcp_in.o ./Core/Inc/lwip/src/core/tcp_in.su ./Core/Inc/lwip/src/core/tcp_out.cyclo ./Core/Inc/lwip/src/core/tcp_out.d ./Core/Inc/lwip/src/core/tcp_out.o ./Core/Inc/lwip/src/core/tcp_out.su ./Core/Inc/lwip/src/core/timeouts.cyclo ./Core/Inc/lwip/src/core/timeouts.d ./Core/Inc/lwip/src/core/timeouts.o ./Core/Inc/lwip/src/core/timeouts.su ./Core/Inc/lwip/src/core/udp.cyclo ./Core/Inc/lwip/src/core/udp.d ./Core/Inc/lwip/src/core/udp.o ./Core/Inc/lwip/src/core/udp.su

.PHONY: clean-Core-2f-Inc-2f-lwip-2f-src-2f-core

