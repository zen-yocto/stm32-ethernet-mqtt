################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lwIP/test/fuzz/fuzz.c \
../Middlewares/Third_Party/lwIP/test/fuzz/fuzz2.c \
../Middlewares/Third_Party/lwIP/test/fuzz/fuzz3.c \
../Middlewares/Third_Party/lwIP/test/fuzz/fuzz_common.c 

OBJS += \
./Middlewares/Third_Party/lwIP/test/fuzz/fuzz.o \
./Middlewares/Third_Party/lwIP/test/fuzz/fuzz2.o \
./Middlewares/Third_Party/lwIP/test/fuzz/fuzz3.o \
./Middlewares/Third_Party/lwIP/test/fuzz/fuzz_common.o 

C_DEPS += \
./Middlewares/Third_Party/lwIP/test/fuzz/fuzz.d \
./Middlewares/Third_Party/lwIP/test/fuzz/fuzz2.d \
./Middlewares/Third_Party/lwIP/test/fuzz/fuzz3.d \
./Middlewares/Third_Party/lwIP/test/fuzz/fuzz_common.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lwIP/test/fuzz/%.o Middlewares/Third_Party/lwIP/test/fuzz/%.su Middlewares/Third_Party/lwIP/test/fuzz/%.cyclo: ../Middlewares/Third_Party/lwIP/test/fuzz/%.c Middlewares/Third_Party/lwIP/test/fuzz/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-test-2f-fuzz

clean-Middlewares-2f-Third_Party-2f-lwIP-2f-test-2f-fuzz:
	-$(RM) ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz.cyclo ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz.d ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz.o ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz.su ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz2.cyclo ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz2.d ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz2.o ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz2.su ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz3.cyclo ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz3.d ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz3.o ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz3.su ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz_common.cyclo ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz_common.d ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz_common.o ./Middlewares/Third_Party/lwIP/test/fuzz/fuzz_common.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-test-2f-fuzz

