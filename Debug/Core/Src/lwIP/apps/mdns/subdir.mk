################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/lwIP/apps/mdns/mdns.c \
../Core/Src/lwIP/apps/mdns/mdns_domain.c \
../Core/Src/lwIP/apps/mdns/mdns_out.c 

OBJS += \
./Core/Src/lwIP/apps/mdns/mdns.o \
./Core/Src/lwIP/apps/mdns/mdns_domain.o \
./Core/Src/lwIP/apps/mdns/mdns_out.o 

C_DEPS += \
./Core/Src/lwIP/apps/mdns/mdns.d \
./Core/Src/lwIP/apps/mdns/mdns_domain.d \
./Core/Src/lwIP/apps/mdns/mdns_out.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/lwIP/apps/mdns/%.o Core/Src/lwIP/apps/mdns/%.su Core/Src/lwIP/apps/mdns/%.cyclo: ../Core/Src/lwIP/apps/mdns/%.c Core/Src/lwIP/apps/mdns/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/enc28j60" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/lwIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-lwIP-2f-apps-2f-mdns

clean-Core-2f-Src-2f-lwIP-2f-apps-2f-mdns:
	-$(RM) ./Core/Src/lwIP/apps/mdns/mdns.cyclo ./Core/Src/lwIP/apps/mdns/mdns.d ./Core/Src/lwIP/apps/mdns/mdns.o ./Core/Src/lwIP/apps/mdns/mdns.su ./Core/Src/lwIP/apps/mdns/mdns_domain.cyclo ./Core/Src/lwIP/apps/mdns/mdns_domain.d ./Core/Src/lwIP/apps/mdns/mdns_domain.o ./Core/Src/lwIP/apps/mdns/mdns_domain.su ./Core/Src/lwIP/apps/mdns/mdns_out.cyclo ./Core/Src/lwIP/apps/mdns/mdns_out.d ./Core/Src/lwIP/apps/mdns/mdns_out.o ./Core/Src/lwIP/apps/mdns/mdns_out.su

.PHONY: clean-Core-2f-Src-2f-lwIP-2f-apps-2f-mdns

