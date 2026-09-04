################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/lwIP/netif/bridgeif.c \
../Core/Src/lwIP/netif/bridgeif_fdb.c \
../Core/Src/lwIP/netif/ethernet.c \
../Core/Src/lwIP/netif/lowpan6.c \
../Core/Src/lwIP/netif/lowpan6_ble.c \
../Core/Src/lwIP/netif/lowpan6_common.c \
../Core/Src/lwIP/netif/slipif.c \
../Core/Src/lwIP/netif/zepif.c 

OBJS += \
./Core/Src/lwIP/netif/bridgeif.o \
./Core/Src/lwIP/netif/bridgeif_fdb.o \
./Core/Src/lwIP/netif/ethernet.o \
./Core/Src/lwIP/netif/lowpan6.o \
./Core/Src/lwIP/netif/lowpan6_ble.o \
./Core/Src/lwIP/netif/lowpan6_common.o \
./Core/Src/lwIP/netif/slipif.o \
./Core/Src/lwIP/netif/zepif.o 

C_DEPS += \
./Core/Src/lwIP/netif/bridgeif.d \
./Core/Src/lwIP/netif/bridgeif_fdb.d \
./Core/Src/lwIP/netif/ethernet.d \
./Core/Src/lwIP/netif/lowpan6.d \
./Core/Src/lwIP/netif/lowpan6_ble.d \
./Core/Src/lwIP/netif/lowpan6_common.d \
./Core/Src/lwIP/netif/slipif.d \
./Core/Src/lwIP/netif/zepif.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/lwIP/netif/%.o Core/Src/lwIP/netif/%.su Core/Src/lwIP/netif/%.cyclo: ../Core/Src/lwIP/netif/%.c Core/Src/lwIP/netif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/enc28j60" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/lwIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-lwIP-2f-netif

clean-Core-2f-Src-2f-lwIP-2f-netif:
	-$(RM) ./Core/Src/lwIP/netif/bridgeif.cyclo ./Core/Src/lwIP/netif/bridgeif.d ./Core/Src/lwIP/netif/bridgeif.o ./Core/Src/lwIP/netif/bridgeif.su ./Core/Src/lwIP/netif/bridgeif_fdb.cyclo ./Core/Src/lwIP/netif/bridgeif_fdb.d ./Core/Src/lwIP/netif/bridgeif_fdb.o ./Core/Src/lwIP/netif/bridgeif_fdb.su ./Core/Src/lwIP/netif/ethernet.cyclo ./Core/Src/lwIP/netif/ethernet.d ./Core/Src/lwIP/netif/ethernet.o ./Core/Src/lwIP/netif/ethernet.su ./Core/Src/lwIP/netif/lowpan6.cyclo ./Core/Src/lwIP/netif/lowpan6.d ./Core/Src/lwIP/netif/lowpan6.o ./Core/Src/lwIP/netif/lowpan6.su ./Core/Src/lwIP/netif/lowpan6_ble.cyclo ./Core/Src/lwIP/netif/lowpan6_ble.d ./Core/Src/lwIP/netif/lowpan6_ble.o ./Core/Src/lwIP/netif/lowpan6_ble.su ./Core/Src/lwIP/netif/lowpan6_common.cyclo ./Core/Src/lwIP/netif/lowpan6_common.d ./Core/Src/lwIP/netif/lowpan6_common.o ./Core/Src/lwIP/netif/lowpan6_common.su ./Core/Src/lwIP/netif/slipif.cyclo ./Core/Src/lwIP/netif/slipif.d ./Core/Src/lwIP/netif/slipif.o ./Core/Src/lwIP/netif/slipif.su ./Core/Src/lwIP/netif/zepif.cyclo ./Core/Src/lwIP/netif/zepif.d ./Core/Src/lwIP/netif/zepif.o ./Core/Src/lwIP/netif/zepif.su

.PHONY: clean-Core-2f-Src-2f-lwIP-2f-netif

