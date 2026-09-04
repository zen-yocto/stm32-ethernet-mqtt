################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lwIP/test/unit/tcp/tcp_helper.c \
../Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp.c \
../Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_oos.c \
../Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_state.c 

OBJS += \
./Middlewares/Third_Party/lwIP/test/unit/tcp/tcp_helper.o \
./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp.o \
./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_oos.o \
./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_state.o 

C_DEPS += \
./Middlewares/Third_Party/lwIP/test/unit/tcp/tcp_helper.d \
./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp.d \
./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_oos.d \
./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_state.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lwIP/test/unit/tcp/%.o Middlewares/Third_Party/lwIP/test/unit/tcp/%.su Middlewares/Third_Party/lwIP/test/unit/tcp/%.cyclo: ../Middlewares/Third_Party/lwIP/test/unit/tcp/%.c Middlewares/Third_Party/lwIP/test/unit/tcp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-test-2f-unit-2f-tcp

clean-Middlewares-2f-Third_Party-2f-lwIP-2f-test-2f-unit-2f-tcp:
	-$(RM) ./Middlewares/Third_Party/lwIP/test/unit/tcp/tcp_helper.cyclo ./Middlewares/Third_Party/lwIP/test/unit/tcp/tcp_helper.d ./Middlewares/Third_Party/lwIP/test/unit/tcp/tcp_helper.o ./Middlewares/Third_Party/lwIP/test/unit/tcp/tcp_helper.su ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp.cyclo ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp.d ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp.o ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp.su ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_oos.cyclo ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_oos.d ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_oos.o ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_oos.su ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_state.cyclo ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_state.d ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_state.o ./Middlewares/Third_Party/lwIP/test/unit/tcp/test_tcp_state.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-test-2f-unit-2f-tcp

