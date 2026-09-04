################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/src/core/altcp.c \
../Core/Inc/src/core/altcp_alloc.c \
../Core/Inc/src/core/altcp_tcp.c \
../Core/Inc/src/core/def.c \
../Core/Inc/src/core/dns.c \
../Core/Inc/src/core/inet_chksum.c \
../Core/Inc/src/core/init.c \
../Core/Inc/src/core/ip.c \
../Core/Inc/src/core/mem.c \
../Core/Inc/src/core/memp.c \
../Core/Inc/src/core/netif.c \
../Core/Inc/src/core/pbuf.c \
../Core/Inc/src/core/raw.c \
../Core/Inc/src/core/stats.c \
../Core/Inc/src/core/sys.c \
../Core/Inc/src/core/tcp.c \
../Core/Inc/src/core/tcp_in.c \
../Core/Inc/src/core/tcp_out.c \
../Core/Inc/src/core/timeouts.c \
../Core/Inc/src/core/udp.c 

OBJS += \
./Core/Inc/src/core/altcp.o \
./Core/Inc/src/core/altcp_alloc.o \
./Core/Inc/src/core/altcp_tcp.o \
./Core/Inc/src/core/def.o \
./Core/Inc/src/core/dns.o \
./Core/Inc/src/core/inet_chksum.o \
./Core/Inc/src/core/init.o \
./Core/Inc/src/core/ip.o \
./Core/Inc/src/core/mem.o \
./Core/Inc/src/core/memp.o \
./Core/Inc/src/core/netif.o \
./Core/Inc/src/core/pbuf.o \
./Core/Inc/src/core/raw.o \
./Core/Inc/src/core/stats.o \
./Core/Inc/src/core/sys.o \
./Core/Inc/src/core/tcp.o \
./Core/Inc/src/core/tcp_in.o \
./Core/Inc/src/core/tcp_out.o \
./Core/Inc/src/core/timeouts.o \
./Core/Inc/src/core/udp.o 

C_DEPS += \
./Core/Inc/src/core/altcp.d \
./Core/Inc/src/core/altcp_alloc.d \
./Core/Inc/src/core/altcp_tcp.d \
./Core/Inc/src/core/def.d \
./Core/Inc/src/core/dns.d \
./Core/Inc/src/core/inet_chksum.d \
./Core/Inc/src/core/init.d \
./Core/Inc/src/core/ip.d \
./Core/Inc/src/core/mem.d \
./Core/Inc/src/core/memp.d \
./Core/Inc/src/core/netif.d \
./Core/Inc/src/core/pbuf.d \
./Core/Inc/src/core/raw.d \
./Core/Inc/src/core/stats.d \
./Core/Inc/src/core/sys.d \
./Core/Inc/src/core/tcp.d \
./Core/Inc/src/core/tcp_in.d \
./Core/Inc/src/core/tcp_out.d \
./Core/Inc/src/core/timeouts.d \
./Core/Inc/src/core/udp.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/src/core/%.o Core/Inc/src/core/%.su Core/Inc/src/core/%.cyclo: ../Core/Inc/src/core/%.c Core/Inc/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-src-2f-core

clean-Core-2f-Inc-2f-src-2f-core:
	-$(RM) ./Core/Inc/src/core/altcp.cyclo ./Core/Inc/src/core/altcp.d ./Core/Inc/src/core/altcp.o ./Core/Inc/src/core/altcp.su ./Core/Inc/src/core/altcp_alloc.cyclo ./Core/Inc/src/core/altcp_alloc.d ./Core/Inc/src/core/altcp_alloc.o ./Core/Inc/src/core/altcp_alloc.su ./Core/Inc/src/core/altcp_tcp.cyclo ./Core/Inc/src/core/altcp_tcp.d ./Core/Inc/src/core/altcp_tcp.o ./Core/Inc/src/core/altcp_tcp.su ./Core/Inc/src/core/def.cyclo ./Core/Inc/src/core/def.d ./Core/Inc/src/core/def.o ./Core/Inc/src/core/def.su ./Core/Inc/src/core/dns.cyclo ./Core/Inc/src/core/dns.d ./Core/Inc/src/core/dns.o ./Core/Inc/src/core/dns.su ./Core/Inc/src/core/inet_chksum.cyclo ./Core/Inc/src/core/inet_chksum.d ./Core/Inc/src/core/inet_chksum.o ./Core/Inc/src/core/inet_chksum.su ./Core/Inc/src/core/init.cyclo ./Core/Inc/src/core/init.d ./Core/Inc/src/core/init.o ./Core/Inc/src/core/init.su ./Core/Inc/src/core/ip.cyclo ./Core/Inc/src/core/ip.d ./Core/Inc/src/core/ip.o ./Core/Inc/src/core/ip.su ./Core/Inc/src/core/mem.cyclo ./Core/Inc/src/core/mem.d ./Core/Inc/src/core/mem.o ./Core/Inc/src/core/mem.su ./Core/Inc/src/core/memp.cyclo ./Core/Inc/src/core/memp.d ./Core/Inc/src/core/memp.o ./Core/Inc/src/core/memp.su ./Core/Inc/src/core/netif.cyclo ./Core/Inc/src/core/netif.d ./Core/Inc/src/core/netif.o ./Core/Inc/src/core/netif.su ./Core/Inc/src/core/pbuf.cyclo ./Core/Inc/src/core/pbuf.d ./Core/Inc/src/core/pbuf.o ./Core/Inc/src/core/pbuf.su ./Core/Inc/src/core/raw.cyclo ./Core/Inc/src/core/raw.d ./Core/Inc/src/core/raw.o ./Core/Inc/src/core/raw.su ./Core/Inc/src/core/stats.cyclo ./Core/Inc/src/core/stats.d ./Core/Inc/src/core/stats.o ./Core/Inc/src/core/stats.su ./Core/Inc/src/core/sys.cyclo ./Core/Inc/src/core/sys.d ./Core/Inc/src/core/sys.o ./Core/Inc/src/core/sys.su ./Core/Inc/src/core/tcp.cyclo ./Core/Inc/src/core/tcp.d ./Core/Inc/src/core/tcp.o ./Core/Inc/src/core/tcp.su ./Core/Inc/src/core/tcp_in.cyclo ./Core/Inc/src/core/tcp_in.d ./Core/Inc/src/core/tcp_in.o ./Core/Inc/src/core/tcp_in.su ./Core/Inc/src/core/tcp_out.cyclo ./Core/Inc/src/core/tcp_out.d ./Core/Inc/src/core/tcp_out.o ./Core/Inc/src/core/tcp_out.su ./Core/Inc/src/core/timeouts.cyclo ./Core/Inc/src/core/timeouts.d ./Core/Inc/src/core/timeouts.o ./Core/Inc/src/core/timeouts.su ./Core/Inc/src/core/udp.cyclo ./Core/Inc/src/core/udp.d ./Core/Inc/src/core/udp.o ./Core/Inc/src/core/udp.su

.PHONY: clean-Core-2f-Inc-2f-src-2f-core

