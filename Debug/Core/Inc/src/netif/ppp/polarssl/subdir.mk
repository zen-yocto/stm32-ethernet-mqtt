################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/src/netif/ppp/polarssl/arc4.c \
../Core/Inc/src/netif/ppp/polarssl/des.c \
../Core/Inc/src/netif/ppp/polarssl/md4.c \
../Core/Inc/src/netif/ppp/polarssl/md5.c \
../Core/Inc/src/netif/ppp/polarssl/sha1.c 

OBJS += \
./Core/Inc/src/netif/ppp/polarssl/arc4.o \
./Core/Inc/src/netif/ppp/polarssl/des.o \
./Core/Inc/src/netif/ppp/polarssl/md4.o \
./Core/Inc/src/netif/ppp/polarssl/md5.o \
./Core/Inc/src/netif/ppp/polarssl/sha1.o 

C_DEPS += \
./Core/Inc/src/netif/ppp/polarssl/arc4.d \
./Core/Inc/src/netif/ppp/polarssl/des.d \
./Core/Inc/src/netif/ppp/polarssl/md4.d \
./Core/Inc/src/netif/ppp/polarssl/md5.d \
./Core/Inc/src/netif/ppp/polarssl/sha1.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/src/netif/ppp/polarssl/%.o Core/Inc/src/netif/ppp/polarssl/%.su Core/Inc/src/netif/ppp/polarssl/%.cyclo: ../Core/Inc/src/netif/ppp/polarssl/%.c Core/Inc/src/netif/ppp/polarssl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/src/include" -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/STM32/OLED_on_SPI/LWIP/target" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-src-2f-netif-2f-ppp-2f-polarssl

clean-Core-2f-Inc-2f-src-2f-netif-2f-ppp-2f-polarssl:
	-$(RM) ./Core/Inc/src/netif/ppp/polarssl/arc4.cyclo ./Core/Inc/src/netif/ppp/polarssl/arc4.d ./Core/Inc/src/netif/ppp/polarssl/arc4.o ./Core/Inc/src/netif/ppp/polarssl/arc4.su ./Core/Inc/src/netif/ppp/polarssl/des.cyclo ./Core/Inc/src/netif/ppp/polarssl/des.d ./Core/Inc/src/netif/ppp/polarssl/des.o ./Core/Inc/src/netif/ppp/polarssl/des.su ./Core/Inc/src/netif/ppp/polarssl/md4.cyclo ./Core/Inc/src/netif/ppp/polarssl/md4.d ./Core/Inc/src/netif/ppp/polarssl/md4.o ./Core/Inc/src/netif/ppp/polarssl/md4.su ./Core/Inc/src/netif/ppp/polarssl/md5.cyclo ./Core/Inc/src/netif/ppp/polarssl/md5.d ./Core/Inc/src/netif/ppp/polarssl/md5.o ./Core/Inc/src/netif/ppp/polarssl/md5.su ./Core/Inc/src/netif/ppp/polarssl/sha1.cyclo ./Core/Inc/src/netif/ppp/polarssl/sha1.d ./Core/Inc/src/netif/ppp/polarssl/sha1.o ./Core/Inc/src/netif/ppp/polarssl/sha1.su

.PHONY: clean-Core-2f-Inc-2f-src-2f-netif-2f-ppp-2f-polarssl

