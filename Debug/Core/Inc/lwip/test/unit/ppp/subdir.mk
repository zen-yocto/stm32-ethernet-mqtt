################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/lwip/test/unit/ppp/test_pppos.c 

OBJS += \
./Core/Inc/lwip/test/unit/ppp/test_pppos.o 

C_DEPS += \
./Core/Inc/lwip/test/unit/ppp/test_pppos.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/lwip/test/unit/ppp/%.o Core/Inc/lwip/test/unit/ppp/%.su Core/Inc/lwip/test/unit/ppp/%.cyclo: ../Core/Inc/lwip/test/unit/ppp/%.c Core/Inc/lwip/test/unit/ppp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-lwip-2f-test-2f-unit-2f-ppp

clean-Core-2f-Inc-2f-lwip-2f-test-2f-unit-2f-ppp:
	-$(RM) ./Core/Inc/lwip/test/unit/ppp/test_pppos.cyclo ./Core/Inc/lwip/test/unit/ppp/test_pppos.d ./Core/Inc/lwip/test/unit/ppp/test_pppos.o ./Core/Inc/lwip/test/unit/ppp/test_pppos.su

.PHONY: clean-Core-2f-Inc-2f-lwip-2f-test-2f-unit-2f-ppp

