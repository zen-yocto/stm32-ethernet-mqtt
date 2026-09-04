################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lwIP/apps/mdns/mdns.c \
../Middlewares/Third_Party/lwIP/apps/mdns/mdns_domain.c \
../Middlewares/Third_Party/lwIP/apps/mdns/mdns_out.c 

OBJS += \
./Middlewares/Third_Party/lwIP/apps/mdns/mdns.o \
./Middlewares/Third_Party/lwIP/apps/mdns/mdns_domain.o \
./Middlewares/Third_Party/lwIP/apps/mdns/mdns_out.o 

C_DEPS += \
./Middlewares/Third_Party/lwIP/apps/mdns/mdns.d \
./Middlewares/Third_Party/lwIP/apps/mdns/mdns_domain.d \
./Middlewares/Third_Party/lwIP/apps/mdns/mdns_out.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lwIP/apps/mdns/%.o Middlewares/Third_Party/lwIP/apps/mdns/%.su Middlewares/Third_Party/lwIP/apps/mdns/%.cyclo: ../Middlewares/Third_Party/lwIP/apps/mdns/%.c Middlewares/Third_Party/lwIP/apps/mdns/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/include" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/system" -I"D:/Documents/STM32/OLED_on_SPI/Core/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-apps-2f-mdns

clean-Middlewares-2f-Third_Party-2f-lwIP-2f-apps-2f-mdns:
	-$(RM) ./Middlewares/Third_Party/lwIP/apps/mdns/mdns.cyclo ./Middlewares/Third_Party/lwIP/apps/mdns/mdns.d ./Middlewares/Third_Party/lwIP/apps/mdns/mdns.o ./Middlewares/Third_Party/lwIP/apps/mdns/mdns.su ./Middlewares/Third_Party/lwIP/apps/mdns/mdns_domain.cyclo ./Middlewares/Third_Party/lwIP/apps/mdns/mdns_domain.d ./Middlewares/Third_Party/lwIP/apps/mdns/mdns_domain.o ./Middlewares/Third_Party/lwIP/apps/mdns/mdns_domain.su ./Middlewares/Third_Party/lwIP/apps/mdns/mdns_out.cyclo ./Middlewares/Third_Party/lwIP/apps/mdns/mdns_out.d ./Middlewares/Third_Party/lwIP/apps/mdns/mdns_out.o ./Middlewares/Third_Party/lwIP/apps/mdns/mdns_out.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-apps-2f-mdns

