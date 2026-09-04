################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/LWIP/target/enc28j60/enc28j60.c \
../Core/LWIP/target/enc28j60/enc28j60_io.c 

OBJS += \
./Core/LWIP/target/enc28j60/enc28j60.o \
./Core/LWIP/target/enc28j60/enc28j60_io.o 

C_DEPS += \
./Core/LWIP/target/enc28j60/enc28j60.d \
./Core/LWIP/target/enc28j60/enc28j60_io.d 


# Each subdirectory must supply rules for building sources it contributes
Core/LWIP/target/enc28j60/%.o Core/LWIP/target/enc28j60/%.su Core/LWIP/target/enc28j60/%.cyclo: ../Core/LWIP/target/enc28j60/%.c Core/LWIP/target/enc28j60/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/include" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/system" -I"D:/Documents/STM32/OLED_on_SPI/Core/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-LWIP-2f-target-2f-enc28j60

clean-Core-2f-LWIP-2f-target-2f-enc28j60:
	-$(RM) ./Core/LWIP/target/enc28j60/enc28j60.cyclo ./Core/LWIP/target/enc28j60/enc28j60.d ./Core/LWIP/target/enc28j60/enc28j60.o ./Core/LWIP/target/enc28j60/enc28j60.su ./Core/LWIP/target/enc28j60/enc28j60_io.cyclo ./Core/LWIP/target/enc28j60/enc28j60_io.d ./Core/LWIP/target/enc28j60/enc28j60_io.o ./Core/LWIP/target/enc28j60/enc28j60_io.su

.PHONY: clean-Core-2f-LWIP-2f-target-2f-enc28j60

