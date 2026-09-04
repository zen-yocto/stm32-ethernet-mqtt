################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/test/unit/core/test_def.c \
../Core/Inc/test/unit/core/test_dns.c \
../Core/Inc/test/unit/core/test_mem.c \
../Core/Inc/test/unit/core/test_netif.c \
../Core/Inc/test/unit/core/test_pbuf.c \
../Core/Inc/test/unit/core/test_timers.c 

OBJS += \
./Core/Inc/test/unit/core/test_def.o \
./Core/Inc/test/unit/core/test_dns.o \
./Core/Inc/test/unit/core/test_mem.o \
./Core/Inc/test/unit/core/test_netif.o \
./Core/Inc/test/unit/core/test_pbuf.o \
./Core/Inc/test/unit/core/test_timers.o 

C_DEPS += \
./Core/Inc/test/unit/core/test_def.d \
./Core/Inc/test/unit/core/test_dns.d \
./Core/Inc/test/unit/core/test_mem.d \
./Core/Inc/test/unit/core/test_netif.d \
./Core/Inc/test/unit/core/test_pbuf.d \
./Core/Inc/test/unit/core/test_timers.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/test/unit/core/%.o Core/Inc/test/unit/core/%.su Core/Inc/test/unit/core/%.cyclo: ../Core/Inc/test/unit/core/%.c Core/Inc/test/unit/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/test/unit" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-test-2f-unit-2f-core

clean-Core-2f-Inc-2f-test-2f-unit-2f-core:
	-$(RM) ./Core/Inc/test/unit/core/test_def.cyclo ./Core/Inc/test/unit/core/test_def.d ./Core/Inc/test/unit/core/test_def.o ./Core/Inc/test/unit/core/test_def.su ./Core/Inc/test/unit/core/test_dns.cyclo ./Core/Inc/test/unit/core/test_dns.d ./Core/Inc/test/unit/core/test_dns.o ./Core/Inc/test/unit/core/test_dns.su ./Core/Inc/test/unit/core/test_mem.cyclo ./Core/Inc/test/unit/core/test_mem.d ./Core/Inc/test/unit/core/test_mem.o ./Core/Inc/test/unit/core/test_mem.su ./Core/Inc/test/unit/core/test_netif.cyclo ./Core/Inc/test/unit/core/test_netif.d ./Core/Inc/test/unit/core/test_netif.o ./Core/Inc/test/unit/core/test_netif.su ./Core/Inc/test/unit/core/test_pbuf.cyclo ./Core/Inc/test/unit/core/test_pbuf.d ./Core/Inc/test/unit/core/test_pbuf.o ./Core/Inc/test/unit/core/test_pbuf.su ./Core/Inc/test/unit/core/test_timers.cyclo ./Core/Inc/test/unit/core/test_timers.d ./Core/Inc/test/unit/core/test_timers.o ./Core/Inc/test/unit/core/test_timers.su

.PHONY: clean-Core-2f-Inc-2f-test-2f-unit-2f-core

