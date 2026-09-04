################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/lwIP/core/ipv6/dhcp6.c \
../Core/Src/lwIP/core/ipv6/ethip6.c \
../Core/Src/lwIP/core/ipv6/icmp6.c \
../Core/Src/lwIP/core/ipv6/inet6.c \
../Core/Src/lwIP/core/ipv6/ip6.c \
../Core/Src/lwIP/core/ipv6/ip6_addr.c \
../Core/Src/lwIP/core/ipv6/ip6_frag.c \
../Core/Src/lwIP/core/ipv6/mld6.c \
../Core/Src/lwIP/core/ipv6/nd6.c 

OBJS += \
./Core/Src/lwIP/core/ipv6/dhcp6.o \
./Core/Src/lwIP/core/ipv6/ethip6.o \
./Core/Src/lwIP/core/ipv6/icmp6.o \
./Core/Src/lwIP/core/ipv6/inet6.o \
./Core/Src/lwIP/core/ipv6/ip6.o \
./Core/Src/lwIP/core/ipv6/ip6_addr.o \
./Core/Src/lwIP/core/ipv6/ip6_frag.o \
./Core/Src/lwIP/core/ipv6/mld6.o \
./Core/Src/lwIP/core/ipv6/nd6.o 

C_DEPS += \
./Core/Src/lwIP/core/ipv6/dhcp6.d \
./Core/Src/lwIP/core/ipv6/ethip6.d \
./Core/Src/lwIP/core/ipv6/icmp6.d \
./Core/Src/lwIP/core/ipv6/inet6.d \
./Core/Src/lwIP/core/ipv6/ip6.d \
./Core/Src/lwIP/core/ipv6/ip6_addr.d \
./Core/Src/lwIP/core/ipv6/ip6_frag.d \
./Core/Src/lwIP/core/ipv6/mld6.d \
./Core/Src/lwIP/core/ipv6/nd6.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/lwIP/core/ipv6/%.o Core/Src/lwIP/core/ipv6/%.su Core/Src/lwIP/core/ipv6/%.cyclo: ../Core/Src/lwIP/core/ipv6/%.c Core/Src/lwIP/core/ipv6/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/enc28j60" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/lwIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-lwIP-2f-core-2f-ipv6

clean-Core-2f-Src-2f-lwIP-2f-core-2f-ipv6:
	-$(RM) ./Core/Src/lwIP/core/ipv6/dhcp6.cyclo ./Core/Src/lwIP/core/ipv6/dhcp6.d ./Core/Src/lwIP/core/ipv6/dhcp6.o ./Core/Src/lwIP/core/ipv6/dhcp6.su ./Core/Src/lwIP/core/ipv6/ethip6.cyclo ./Core/Src/lwIP/core/ipv6/ethip6.d ./Core/Src/lwIP/core/ipv6/ethip6.o ./Core/Src/lwIP/core/ipv6/ethip6.su ./Core/Src/lwIP/core/ipv6/icmp6.cyclo ./Core/Src/lwIP/core/ipv6/icmp6.d ./Core/Src/lwIP/core/ipv6/icmp6.o ./Core/Src/lwIP/core/ipv6/icmp6.su ./Core/Src/lwIP/core/ipv6/inet6.cyclo ./Core/Src/lwIP/core/ipv6/inet6.d ./Core/Src/lwIP/core/ipv6/inet6.o ./Core/Src/lwIP/core/ipv6/inet6.su ./Core/Src/lwIP/core/ipv6/ip6.cyclo ./Core/Src/lwIP/core/ipv6/ip6.d ./Core/Src/lwIP/core/ipv6/ip6.o ./Core/Src/lwIP/core/ipv6/ip6.su ./Core/Src/lwIP/core/ipv6/ip6_addr.cyclo ./Core/Src/lwIP/core/ipv6/ip6_addr.d ./Core/Src/lwIP/core/ipv6/ip6_addr.o ./Core/Src/lwIP/core/ipv6/ip6_addr.su ./Core/Src/lwIP/core/ipv6/ip6_frag.cyclo ./Core/Src/lwIP/core/ipv6/ip6_frag.d ./Core/Src/lwIP/core/ipv6/ip6_frag.o ./Core/Src/lwIP/core/ipv6/ip6_frag.su ./Core/Src/lwIP/core/ipv6/mld6.cyclo ./Core/Src/lwIP/core/ipv6/mld6.d ./Core/Src/lwIP/core/ipv6/mld6.o ./Core/Src/lwIP/core/ipv6/mld6.su ./Core/Src/lwIP/core/ipv6/nd6.cyclo ./Core/Src/lwIP/core/ipv6/nd6.d ./Core/Src/lwIP/core/ipv6/nd6.o ./Core/Src/lwIP/core/ipv6/nd6.su

.PHONY: clean-Core-2f-Src-2f-lwIP-2f-core-2f-ipv6

