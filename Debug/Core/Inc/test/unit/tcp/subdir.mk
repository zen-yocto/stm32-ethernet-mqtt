################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/test/unit/tcp/tcp_helper.c \
../Core/Inc/test/unit/tcp/test_tcp.c \
../Core/Inc/test/unit/tcp/test_tcp_oos.c \
../Core/Inc/test/unit/tcp/test_tcp_state.c 

OBJS += \
./Core/Inc/test/unit/tcp/tcp_helper.o \
./Core/Inc/test/unit/tcp/test_tcp.o \
./Core/Inc/test/unit/tcp/test_tcp_oos.o \
./Core/Inc/test/unit/tcp/test_tcp_state.o 

C_DEPS += \
./Core/Inc/test/unit/tcp/tcp_helper.d \
./Core/Inc/test/unit/tcp/test_tcp.d \
./Core/Inc/test/unit/tcp/test_tcp_oos.d \
./Core/Inc/test/unit/tcp/test_tcp_state.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/test/unit/tcp/%.o Core/Inc/test/unit/tcp/%.su Core/Inc/test/unit/tcp/%.cyclo: ../Core/Inc/test/unit/tcp/%.c Core/Inc/test/unit/tcp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/test/unit" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-test-2f-unit-2f-tcp

clean-Core-2f-Inc-2f-test-2f-unit-2f-tcp:
	-$(RM) ./Core/Inc/test/unit/tcp/tcp_helper.cyclo ./Core/Inc/test/unit/tcp/tcp_helper.d ./Core/Inc/test/unit/tcp/tcp_helper.o ./Core/Inc/test/unit/tcp/tcp_helper.su ./Core/Inc/test/unit/tcp/test_tcp.cyclo ./Core/Inc/test/unit/tcp/test_tcp.d ./Core/Inc/test/unit/tcp/test_tcp.o ./Core/Inc/test/unit/tcp/test_tcp.su ./Core/Inc/test/unit/tcp/test_tcp_oos.cyclo ./Core/Inc/test/unit/tcp/test_tcp_oos.d ./Core/Inc/test/unit/tcp/test_tcp_oos.o ./Core/Inc/test/unit/tcp/test_tcp_oos.su ./Core/Inc/test/unit/tcp/test_tcp_state.cyclo ./Core/Inc/test/unit/tcp/test_tcp_state.d ./Core/Inc/test/unit/tcp/test_tcp_state.o ./Core/Inc/test/unit/tcp/test_tcp_state.su

.PHONY: clean-Core-2f-Inc-2f-test-2f-unit-2f-tcp

