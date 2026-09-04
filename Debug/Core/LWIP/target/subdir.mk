################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/LWIP/target/ethernetif.c 

OBJS += \
./Core/LWIP/target/ethernetif.o 

C_DEPS += \
./Core/LWIP/target/ethernetif.d 


# Each subdirectory must supply rules for building sources it contributes
Core/LWIP/target/%.o Core/LWIP/target/%.su Core/LWIP/target/%.cyclo: ../Core/LWIP/target/%.c Core/LWIP/target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/include" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/system" -I"D:/Documents/STM32/OLED_on_SPI/Core/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-LWIP-2f-target

clean-Core-2f-LWIP-2f-target:
	-$(RM) ./Core/LWIP/target/ethernetif.cyclo ./Core/LWIP/target/ethernetif.d ./Core/LWIP/target/ethernetif.o ./Core/LWIP/target/ethernetif.su

.PHONY: clean-Core-2f-LWIP-2f-target

