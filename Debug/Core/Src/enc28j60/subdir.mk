################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/enc28j60/enc28j60.c \
../Core/Src/enc28j60/enc28j60_io.c \
../Core/Src/enc28j60/ethernetif.c 

OBJS += \
./Core/Src/enc28j60/enc28j60.o \
./Core/Src/enc28j60/enc28j60_io.o \
./Core/Src/enc28j60/ethernetif.o 

C_DEPS += \
./Core/Src/enc28j60/enc28j60.d \
./Core/Src/enc28j60/enc28j60_io.d \
./Core/Src/enc28j60/ethernetif.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/enc28j60/%.o Core/Src/enc28j60/%.su Core/Src/enc28j60/%.cyclo: ../Core/Src/enc28j60/%.c Core/Src/enc28j60/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/test/unit" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/enc28j60" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-enc28j60

clean-Core-2f-Src-2f-enc28j60:
	-$(RM) ./Core/Src/enc28j60/enc28j60.cyclo ./Core/Src/enc28j60/enc28j60.d ./Core/Src/enc28j60/enc28j60.o ./Core/Src/enc28j60/enc28j60.su ./Core/Src/enc28j60/enc28j60_io.cyclo ./Core/Src/enc28j60/enc28j60_io.d ./Core/Src/enc28j60/enc28j60_io.o ./Core/Src/enc28j60/enc28j60_io.su ./Core/Src/enc28j60/ethernetif.cyclo ./Core/Src/enc28j60/ethernetif.d ./Core/Src/enc28j60/ethernetif.o ./Core/Src/enc28j60/ethernetif.su

.PHONY: clean-Core-2f-Src-2f-enc28j60

