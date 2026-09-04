################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/lwip/test/unit/dhcp/test_dhcp.c 

OBJS += \
./Core/Inc/lwip/test/unit/dhcp/test_dhcp.o 

C_DEPS += \
./Core/Inc/lwip/test/unit/dhcp/test_dhcp.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/lwip/test/unit/dhcp/%.o Core/Inc/lwip/test/unit/dhcp/%.su Core/Inc/lwip/test/unit/dhcp/%.cyclo: ../Core/Inc/lwip/test/unit/dhcp/%.c Core/Inc/lwip/test/unit/dhcp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-lwip-2f-test-2f-unit-2f-dhcp

clean-Core-2f-Inc-2f-lwip-2f-test-2f-unit-2f-dhcp:
	-$(RM) ./Core/Inc/lwip/test/unit/dhcp/test_dhcp.cyclo ./Core/Inc/lwip/test/unit/dhcp/test_dhcp.d ./Core/Inc/lwip/test/unit/dhcp/test_dhcp.o ./Core/Inc/lwip/test/unit/dhcp/test_dhcp.su

.PHONY: clean-Core-2f-Inc-2f-lwip-2f-test-2f-unit-2f-dhcp

