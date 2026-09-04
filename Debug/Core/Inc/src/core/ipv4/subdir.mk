################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/src/core/ipv4/acd.c \
../Core/Inc/src/core/ipv4/autoip.c \
../Core/Inc/src/core/ipv4/dhcp.c \
../Core/Inc/src/core/ipv4/etharp.c \
../Core/Inc/src/core/ipv4/icmp.c \
../Core/Inc/src/core/ipv4/igmp.c \
../Core/Inc/src/core/ipv4/ip4.c \
../Core/Inc/src/core/ipv4/ip4_addr.c \
../Core/Inc/src/core/ipv4/ip4_frag.c 

OBJS += \
./Core/Inc/src/core/ipv4/acd.o \
./Core/Inc/src/core/ipv4/autoip.o \
./Core/Inc/src/core/ipv4/dhcp.o \
./Core/Inc/src/core/ipv4/etharp.o \
./Core/Inc/src/core/ipv4/icmp.o \
./Core/Inc/src/core/ipv4/igmp.o \
./Core/Inc/src/core/ipv4/ip4.o \
./Core/Inc/src/core/ipv4/ip4_addr.o \
./Core/Inc/src/core/ipv4/ip4_frag.o 

C_DEPS += \
./Core/Inc/src/core/ipv4/acd.d \
./Core/Inc/src/core/ipv4/autoip.d \
./Core/Inc/src/core/ipv4/dhcp.d \
./Core/Inc/src/core/ipv4/etharp.d \
./Core/Inc/src/core/ipv4/icmp.d \
./Core/Inc/src/core/ipv4/igmp.d \
./Core/Inc/src/core/ipv4/ip4.d \
./Core/Inc/src/core/ipv4/ip4_addr.d \
./Core/Inc/src/core/ipv4/ip4_frag.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/src/core/ipv4/%.o Core/Inc/src/core/ipv4/%.su Core/Inc/src/core/ipv4/%.cyclo: ../Core/Inc/src/core/ipv4/%.c Core/Inc/src/core/ipv4/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-src-2f-core-2f-ipv4

clean-Core-2f-Inc-2f-src-2f-core-2f-ipv4:
	-$(RM) ./Core/Inc/src/core/ipv4/acd.cyclo ./Core/Inc/src/core/ipv4/acd.d ./Core/Inc/src/core/ipv4/acd.o ./Core/Inc/src/core/ipv4/acd.su ./Core/Inc/src/core/ipv4/autoip.cyclo ./Core/Inc/src/core/ipv4/autoip.d ./Core/Inc/src/core/ipv4/autoip.o ./Core/Inc/src/core/ipv4/autoip.su ./Core/Inc/src/core/ipv4/dhcp.cyclo ./Core/Inc/src/core/ipv4/dhcp.d ./Core/Inc/src/core/ipv4/dhcp.o ./Core/Inc/src/core/ipv4/dhcp.su ./Core/Inc/src/core/ipv4/etharp.cyclo ./Core/Inc/src/core/ipv4/etharp.d ./Core/Inc/src/core/ipv4/etharp.o ./Core/Inc/src/core/ipv4/etharp.su ./Core/Inc/src/core/ipv4/icmp.cyclo ./Core/Inc/src/core/ipv4/icmp.d ./Core/Inc/src/core/ipv4/icmp.o ./Core/Inc/src/core/ipv4/icmp.su ./Core/Inc/src/core/ipv4/igmp.cyclo ./Core/Inc/src/core/ipv4/igmp.d ./Core/Inc/src/core/ipv4/igmp.o ./Core/Inc/src/core/ipv4/igmp.su ./Core/Inc/src/core/ipv4/ip4.cyclo ./Core/Inc/src/core/ipv4/ip4.d ./Core/Inc/src/core/ipv4/ip4.o ./Core/Inc/src/core/ipv4/ip4.su ./Core/Inc/src/core/ipv4/ip4_addr.cyclo ./Core/Inc/src/core/ipv4/ip4_addr.d ./Core/Inc/src/core/ipv4/ip4_addr.o ./Core/Inc/src/core/ipv4/ip4_addr.su ./Core/Inc/src/core/ipv4/ip4_frag.cyclo ./Core/Inc/src/core/ipv4/ip4_frag.d ./Core/Inc/src/core/ipv4/ip4_frag.o ./Core/Inc/src/core/ipv4/ip4_frag.su

.PHONY: clean-Core-2f-Inc-2f-src-2f-core-2f-ipv4

