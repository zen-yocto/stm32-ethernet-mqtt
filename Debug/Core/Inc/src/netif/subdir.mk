################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/src/netif/bridgeif.c \
../Core/Inc/src/netif/bridgeif_fdb.c \
../Core/Inc/src/netif/ethernet.c \
../Core/Inc/src/netif/lowpan6.c \
../Core/Inc/src/netif/lowpan6_ble.c \
../Core/Inc/src/netif/lowpan6_common.c \
../Core/Inc/src/netif/slipif.c \
../Core/Inc/src/netif/zepif.c 

OBJS += \
./Core/Inc/src/netif/bridgeif.o \
./Core/Inc/src/netif/bridgeif_fdb.o \
./Core/Inc/src/netif/ethernet.o \
./Core/Inc/src/netif/lowpan6.o \
./Core/Inc/src/netif/lowpan6_ble.o \
./Core/Inc/src/netif/lowpan6_common.o \
./Core/Inc/src/netif/slipif.o \
./Core/Inc/src/netif/zepif.o 

C_DEPS += \
./Core/Inc/src/netif/bridgeif.d \
./Core/Inc/src/netif/bridgeif_fdb.d \
./Core/Inc/src/netif/ethernet.d \
./Core/Inc/src/netif/lowpan6.d \
./Core/Inc/src/netif/lowpan6_ble.d \
./Core/Inc/src/netif/lowpan6_common.d \
./Core/Inc/src/netif/slipif.d \
./Core/Inc/src/netif/zepif.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/src/netif/%.o Core/Inc/src/netif/%.su Core/Inc/src/netif/%.cyclo: ../Core/Inc/src/netif/%.c Core/Inc/src/netif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-src-2f-netif

clean-Core-2f-Inc-2f-src-2f-netif:
	-$(RM) ./Core/Inc/src/netif/bridgeif.cyclo ./Core/Inc/src/netif/bridgeif.d ./Core/Inc/src/netif/bridgeif.o ./Core/Inc/src/netif/bridgeif.su ./Core/Inc/src/netif/bridgeif_fdb.cyclo ./Core/Inc/src/netif/bridgeif_fdb.d ./Core/Inc/src/netif/bridgeif_fdb.o ./Core/Inc/src/netif/bridgeif_fdb.su ./Core/Inc/src/netif/ethernet.cyclo ./Core/Inc/src/netif/ethernet.d ./Core/Inc/src/netif/ethernet.o ./Core/Inc/src/netif/ethernet.su ./Core/Inc/src/netif/lowpan6.cyclo ./Core/Inc/src/netif/lowpan6.d ./Core/Inc/src/netif/lowpan6.o ./Core/Inc/src/netif/lowpan6.su ./Core/Inc/src/netif/lowpan6_ble.cyclo ./Core/Inc/src/netif/lowpan6_ble.d ./Core/Inc/src/netif/lowpan6_ble.o ./Core/Inc/src/netif/lowpan6_ble.su ./Core/Inc/src/netif/lowpan6_common.cyclo ./Core/Inc/src/netif/lowpan6_common.d ./Core/Inc/src/netif/lowpan6_common.o ./Core/Inc/src/netif/lowpan6_common.su ./Core/Inc/src/netif/slipif.cyclo ./Core/Inc/src/netif/slipif.d ./Core/Inc/src/netif/slipif.o ./Core/Inc/src/netif/slipif.su ./Core/Inc/src/netif/zepif.cyclo ./Core/Inc/src/netif/zepif.d ./Core/Inc/src/netif/zepif.o ./Core/Inc/src/netif/zepif.su

.PHONY: clean-Core-2f-Inc-2f-src-2f-netif

