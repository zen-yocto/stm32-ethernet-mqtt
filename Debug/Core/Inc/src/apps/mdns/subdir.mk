################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/src/apps/mdns/mdns.c \
../Core/Inc/src/apps/mdns/mdns_domain.c \
../Core/Inc/src/apps/mdns/mdns_out.c 

OBJS += \
./Core/Inc/src/apps/mdns/mdns.o \
./Core/Inc/src/apps/mdns/mdns_domain.o \
./Core/Inc/src/apps/mdns/mdns_out.o 

C_DEPS += \
./Core/Inc/src/apps/mdns/mdns.d \
./Core/Inc/src/apps/mdns/mdns_domain.d \
./Core/Inc/src/apps/mdns/mdns_out.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/src/apps/mdns/%.o Core/Inc/src/apps/mdns/%.su Core/Inc/src/apps/mdns/%.cyclo: ../Core/Inc/src/apps/mdns/%.c Core/Inc/src/apps/mdns/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-src-2f-apps-2f-mdns

clean-Core-2f-Inc-2f-src-2f-apps-2f-mdns:
	-$(RM) ./Core/Inc/src/apps/mdns/mdns.cyclo ./Core/Inc/src/apps/mdns/mdns.d ./Core/Inc/src/apps/mdns/mdns.o ./Core/Inc/src/apps/mdns/mdns.su ./Core/Inc/src/apps/mdns/mdns_domain.cyclo ./Core/Inc/src/apps/mdns/mdns_domain.d ./Core/Inc/src/apps/mdns/mdns_domain.o ./Core/Inc/src/apps/mdns/mdns_domain.su ./Core/Inc/src/apps/mdns/mdns_out.cyclo ./Core/Inc/src/apps/mdns/mdns_out.d ./Core/Inc/src/apps/mdns/mdns_out.o ./Core/Inc/src/apps/mdns/mdns_out.su

.PHONY: clean-Core-2f-Inc-2f-src-2f-apps-2f-mdns

