################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lwIP/netif/bridgeif.c \
../Middlewares/Third_Party/lwIP/netif/bridgeif_fdb.c \
../Middlewares/Third_Party/lwIP/netif/ethernet.c \
../Middlewares/Third_Party/lwIP/netif/lowpan6.c \
../Middlewares/Third_Party/lwIP/netif/lowpan6_ble.c \
../Middlewares/Third_Party/lwIP/netif/lowpan6_common.c \
../Middlewares/Third_Party/lwIP/netif/slipif.c \
../Middlewares/Third_Party/lwIP/netif/zepif.c 

OBJS += \
./Middlewares/Third_Party/lwIP/netif/bridgeif.o \
./Middlewares/Third_Party/lwIP/netif/bridgeif_fdb.o \
./Middlewares/Third_Party/lwIP/netif/ethernet.o \
./Middlewares/Third_Party/lwIP/netif/lowpan6.o \
./Middlewares/Third_Party/lwIP/netif/lowpan6_ble.o \
./Middlewares/Third_Party/lwIP/netif/lowpan6_common.o \
./Middlewares/Third_Party/lwIP/netif/slipif.o \
./Middlewares/Third_Party/lwIP/netif/zepif.o 

C_DEPS += \
./Middlewares/Third_Party/lwIP/netif/bridgeif.d \
./Middlewares/Third_Party/lwIP/netif/bridgeif_fdb.d \
./Middlewares/Third_Party/lwIP/netif/ethernet.d \
./Middlewares/Third_Party/lwIP/netif/lowpan6.d \
./Middlewares/Third_Party/lwIP/netif/lowpan6_ble.d \
./Middlewares/Third_Party/lwIP/netif/lowpan6_common.d \
./Middlewares/Third_Party/lwIP/netif/slipif.d \
./Middlewares/Third_Party/lwIP/netif/zepif.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lwIP/netif/%.o Middlewares/Third_Party/lwIP/netif/%.su Middlewares/Third_Party/lwIP/netif/%.cyclo: ../Middlewares/Third_Party/lwIP/netif/%.c Middlewares/Third_Party/lwIP/netif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/include" -I"D:/Documents/STM32/OLED_on_SPI/Middlewares/Third_Party/lwIP/system" -I"D:/Documents/STM32/OLED_on_SPI/Core/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-netif

clean-Middlewares-2f-Third_Party-2f-lwIP-2f-netif:
	-$(RM) ./Middlewares/Third_Party/lwIP/netif/bridgeif.cyclo ./Middlewares/Third_Party/lwIP/netif/bridgeif.d ./Middlewares/Third_Party/lwIP/netif/bridgeif.o ./Middlewares/Third_Party/lwIP/netif/bridgeif.su ./Middlewares/Third_Party/lwIP/netif/bridgeif_fdb.cyclo ./Middlewares/Third_Party/lwIP/netif/bridgeif_fdb.d ./Middlewares/Third_Party/lwIP/netif/bridgeif_fdb.o ./Middlewares/Third_Party/lwIP/netif/bridgeif_fdb.su ./Middlewares/Third_Party/lwIP/netif/ethernet.cyclo ./Middlewares/Third_Party/lwIP/netif/ethernet.d ./Middlewares/Third_Party/lwIP/netif/ethernet.o ./Middlewares/Third_Party/lwIP/netif/ethernet.su ./Middlewares/Third_Party/lwIP/netif/lowpan6.cyclo ./Middlewares/Third_Party/lwIP/netif/lowpan6.d ./Middlewares/Third_Party/lwIP/netif/lowpan6.o ./Middlewares/Third_Party/lwIP/netif/lowpan6.su ./Middlewares/Third_Party/lwIP/netif/lowpan6_ble.cyclo ./Middlewares/Third_Party/lwIP/netif/lowpan6_ble.d ./Middlewares/Third_Party/lwIP/netif/lowpan6_ble.o ./Middlewares/Third_Party/lwIP/netif/lowpan6_ble.su ./Middlewares/Third_Party/lwIP/netif/lowpan6_common.cyclo ./Middlewares/Third_Party/lwIP/netif/lowpan6_common.d ./Middlewares/Third_Party/lwIP/netif/lowpan6_common.o ./Middlewares/Third_Party/lwIP/netif/lowpan6_common.su ./Middlewares/Third_Party/lwIP/netif/slipif.cyclo ./Middlewares/Third_Party/lwIP/netif/slipif.d ./Middlewares/Third_Party/lwIP/netif/slipif.o ./Middlewares/Third_Party/lwIP/netif/slipif.su ./Middlewares/Third_Party/lwIP/netif/zepif.cyclo ./Middlewares/Third_Party/lwIP/netif/zepif.d ./Middlewares/Third_Party/lwIP/netif/zepif.o ./Middlewares/Third_Party/lwIP/netif/zepif.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lwIP-2f-netif

