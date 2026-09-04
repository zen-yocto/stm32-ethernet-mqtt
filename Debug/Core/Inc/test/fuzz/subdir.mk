################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/test/fuzz/fuzz.c \
../Core/Inc/test/fuzz/fuzz2.c \
../Core/Inc/test/fuzz/fuzz3.c \
../Core/Inc/test/fuzz/fuzz_common.c 

OBJS += \
./Core/Inc/test/fuzz/fuzz.o \
./Core/Inc/test/fuzz/fuzz2.o \
./Core/Inc/test/fuzz/fuzz3.o \
./Core/Inc/test/fuzz/fuzz_common.o 

C_DEPS += \
./Core/Inc/test/fuzz/fuzz.d \
./Core/Inc/test/fuzz/fuzz2.d \
./Core/Inc/test/fuzz/fuzz3.d \
./Core/Inc/test/fuzz/fuzz_common.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/test/fuzz/%.o Core/Inc/test/fuzz/%.su Core/Inc/test/fuzz/%.cyclo: ../Core/Inc/test/fuzz/%.c Core/Inc/test/fuzz/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/test/unit" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-test-2f-fuzz

clean-Core-2f-Inc-2f-test-2f-fuzz:
	-$(RM) ./Core/Inc/test/fuzz/fuzz.cyclo ./Core/Inc/test/fuzz/fuzz.d ./Core/Inc/test/fuzz/fuzz.o ./Core/Inc/test/fuzz/fuzz.su ./Core/Inc/test/fuzz/fuzz2.cyclo ./Core/Inc/test/fuzz/fuzz2.d ./Core/Inc/test/fuzz/fuzz2.o ./Core/Inc/test/fuzz/fuzz2.su ./Core/Inc/test/fuzz/fuzz3.cyclo ./Core/Inc/test/fuzz/fuzz3.d ./Core/Inc/test/fuzz/fuzz3.o ./Core/Inc/test/fuzz/fuzz3.su ./Core/Inc/test/fuzz/fuzz_common.cyclo ./Core/Inc/test/fuzz/fuzz_common.d ./Core/Inc/test/fuzz/fuzz_common.o ./Core/Inc/test/fuzz/fuzz_common.su

.PHONY: clean-Core-2f-Inc-2f-test-2f-fuzz

