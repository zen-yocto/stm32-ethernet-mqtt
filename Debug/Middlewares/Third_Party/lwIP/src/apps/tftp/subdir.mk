################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lwIP/src/apps/tftp/tftp.c 

OBJS += \
./Middlewares/Third_Party/lwIP/src/apps/tftp/tftp.o 

C_DEPS += \
./Middlewares/Third_Party/lwIP/src/apps/tftp/tftp.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lwIP/src/apps/tftp/%.o Middlewares/Third_Party/lwIP/src/apps/tftp/%.su Middlewares/Third_Party/lwIP/src/apps/tftp/%.cyclo: ../Middlewares/Third_Party/lwIP/src/apps/tftp/%.c Middlewares/Third_Party/lwIP/src/apps/tftp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/src/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-src-2f-apps-2f-tftp

clean-Middlewares-2f-Third_Party-2f-lwIP-2f-src-2f-apps-2f-tftp:
	-$(RM) ./Middlewares/Third_Party/lwIP/src/apps/tftp/tftp.cyclo ./Middlewares/Third_Party/lwIP/src/apps/tftp/tftp.d ./Middlewares/Third_Party/lwIP/src/apps/tftp/tftp.o ./Middlewares/Third_Party/lwIP/src/apps/tftp/tftp.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-src-2f-apps-2f-tftp

