################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/test/unit/ip4/test_ip4.c 

OBJS += \
./Core/Inc/test/unit/ip4/test_ip4.o 

C_DEPS += \
./Core/Inc/test/unit/ip4/test_ip4.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/test/unit/ip4/%.o Core/Inc/test/unit/ip4/%.su Core/Inc/test/unit/ip4/%.cyclo: ../Core/Inc/test/unit/ip4/%.c Core/Inc/test/unit/ip4/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/test/unit" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-test-2f-unit-2f-ip4

clean-Core-2f-Inc-2f-test-2f-unit-2f-ip4:
	-$(RM) ./Core/Inc/test/unit/ip4/test_ip4.cyclo ./Core/Inc/test/unit/ip4/test_ip4.d ./Core/Inc/test/unit/ip4/test_ip4.o ./Core/Inc/test/unit/ip4/test_ip4.su

.PHONY: clean-Core-2f-Inc-2f-test-2f-unit-2f-ip4

