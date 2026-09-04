################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/lwip/src/netif/bridgeif.c \
../Core/Inc/lwip/src/netif/bridgeif_fdb.c \
../Core/Inc/lwip/src/netif/ethernet.c \
../Core/Inc/lwip/src/netif/lowpan6.c \
../Core/Inc/lwip/src/netif/lowpan6_ble.c \
../Core/Inc/lwip/src/netif/lowpan6_common.c \
../Core/Inc/lwip/src/netif/slipif.c \
../Core/Inc/lwip/src/netif/zepif.c 

OBJS += \
./Core/Inc/lwip/src/netif/bridgeif.o \
./Core/Inc/lwip/src/netif/bridgeif_fdb.o \
./Core/Inc/lwip/src/netif/ethernet.o \
./Core/Inc/lwip/src/netif/lowpan6.o \
./Core/Inc/lwip/src/netif/lowpan6_ble.o \
./Core/Inc/lwip/src/netif/lowpan6_common.o \
./Core/Inc/lwip/src/netif/slipif.o \
./Core/Inc/lwip/src/netif/zepif.o 

C_DEPS += \
./Core/Inc/lwip/src/netif/bridgeif.d \
./Core/Inc/lwip/src/netif/bridgeif_fdb.d \
./Core/Inc/lwip/src/netif/ethernet.d \
./Core/Inc/lwip/src/netif/lowpan6.d \
./Core/Inc/lwip/src/netif/lowpan6_ble.d \
./Core/Inc/lwip/src/netif/lowpan6_common.d \
./Core/Inc/lwip/src/netif/slipif.d \
./Core/Inc/lwip/src/netif/zepif.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/lwip/src/netif/%.o Core/Inc/lwip/src/netif/%.su Core/Inc/lwip/src/netif/%.cyclo: ../Core/Inc/lwip/src/netif/%.c Core/Inc/lwip/src/netif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/lwip" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-lwip-2f-src-2f-netif

clean-Core-2f-Inc-2f-lwip-2f-src-2f-netif:
	-$(RM) ./Core/Inc/lwip/src/netif/bridgeif.cyclo ./Core/Inc/lwip/src/netif/bridgeif.d ./Core/Inc/lwip/src/netif/bridgeif.o ./Core/Inc/lwip/src/netif/bridgeif.su ./Core/Inc/lwip/src/netif/bridgeif_fdb.cyclo ./Core/Inc/lwip/src/netif/bridgeif_fdb.d ./Core/Inc/lwip/src/netif/bridgeif_fdb.o ./Core/Inc/lwip/src/netif/bridgeif_fdb.su ./Core/Inc/lwip/src/netif/ethernet.cyclo ./Core/Inc/lwip/src/netif/ethernet.d ./Core/Inc/lwip/src/netif/ethernet.o ./Core/Inc/lwip/src/netif/ethernet.su ./Core/Inc/lwip/src/netif/lowpan6.cyclo ./Core/Inc/lwip/src/netif/lowpan6.d ./Core/Inc/lwip/src/netif/lowpan6.o ./Core/Inc/lwip/src/netif/lowpan6.su ./Core/Inc/lwip/src/netif/lowpan6_ble.cyclo ./Core/Inc/lwip/src/netif/lowpan6_ble.d ./Core/Inc/lwip/src/netif/lowpan6_ble.o ./Core/Inc/lwip/src/netif/lowpan6_ble.su ./Core/Inc/lwip/src/netif/lowpan6_common.cyclo ./Core/Inc/lwip/src/netif/lowpan6_common.d ./Core/Inc/lwip/src/netif/lowpan6_common.o ./Core/Inc/lwip/src/netif/lowpan6_common.su ./Core/Inc/lwip/src/netif/slipif.cyclo ./Core/Inc/lwip/src/netif/slipif.d ./Core/Inc/lwip/src/netif/slipif.o ./Core/Inc/lwip/src/netif/slipif.su ./Core/Inc/lwip/src/netif/zepif.cyclo ./Core/Inc/lwip/src/netif/zepif.d ./Core/Inc/lwip/src/netif/zepif.o ./Core/Inc/lwip/src/netif/zepif.su

.PHONY: clean-Core-2f-Inc-2f-lwip-2f-src-2f-netif

