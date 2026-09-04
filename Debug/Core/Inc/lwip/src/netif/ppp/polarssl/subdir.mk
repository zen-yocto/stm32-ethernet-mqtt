################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/lwip/src/netif/ppp/polarssl/arc4.c \
../Core/Inc/lwip/src/netif/ppp/polarssl/des.c \
../Core/Inc/lwip/src/netif/ppp/polarssl/md4.c \
../Core/Inc/lwip/src/netif/ppp/polarssl/md5.c \
../Core/Inc/lwip/src/netif/ppp/polarssl/sha1.c 

OBJS += \
./Core/Inc/lwip/src/netif/ppp/polarssl/arc4.o \
./Core/Inc/lwip/src/netif/ppp/polarssl/des.o \
./Core/Inc/lwip/src/netif/ppp/polarssl/md4.o \
./Core/Inc/lwip/src/netif/ppp/polarssl/md5.o \
./Core/Inc/lwip/src/netif/ppp/polarssl/sha1.o 

C_DEPS += \
./Core/Inc/lwip/src/netif/ppp/polarssl/arc4.d \
./Core/Inc/lwip/src/netif/ppp/polarssl/des.d \
./Core/Inc/lwip/src/netif/ppp/polarssl/md4.d \
./Core/Inc/lwip/src/netif/ppp/polarssl/md5.d \
./Core/Inc/lwip/src/netif/ppp/polarssl/sha1.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/lwip/src/netif/ppp/polarssl/%.o Core/Inc/lwip/src/netif/ppp/polarssl/%.su Core/Inc/lwip/src/netif/ppp/polarssl/%.cyclo: ../Core/Inc/lwip/src/netif/ppp/polarssl/%.c Core/Inc/lwip/src/netif/ppp/polarssl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/lwip" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-lwip-2f-src-2f-netif-2f-ppp-2f-polarssl

clean-Core-2f-Inc-2f-lwip-2f-src-2f-netif-2f-ppp-2f-polarssl:
	-$(RM) ./Core/Inc/lwip/src/netif/ppp/polarssl/arc4.cyclo ./Core/Inc/lwip/src/netif/ppp/polarssl/arc4.d ./Core/Inc/lwip/src/netif/ppp/polarssl/arc4.o ./Core/Inc/lwip/src/netif/ppp/polarssl/arc4.su ./Core/Inc/lwip/src/netif/ppp/polarssl/des.cyclo ./Core/Inc/lwip/src/netif/ppp/polarssl/des.d ./Core/Inc/lwip/src/netif/ppp/polarssl/des.o ./Core/Inc/lwip/src/netif/ppp/polarssl/des.su ./Core/Inc/lwip/src/netif/ppp/polarssl/md4.cyclo ./Core/Inc/lwip/src/netif/ppp/polarssl/md4.d ./Core/Inc/lwip/src/netif/ppp/polarssl/md4.o ./Core/Inc/lwip/src/netif/ppp/polarssl/md4.su ./Core/Inc/lwip/src/netif/ppp/polarssl/md5.cyclo ./Core/Inc/lwip/src/netif/ppp/polarssl/md5.d ./Core/Inc/lwip/src/netif/ppp/polarssl/md5.o ./Core/Inc/lwip/src/netif/ppp/polarssl/md5.su ./Core/Inc/lwip/src/netif/ppp/polarssl/sha1.cyclo ./Core/Inc/lwip/src/netif/ppp/polarssl/sha1.d ./Core/Inc/lwip/src/netif/ppp/polarssl/sha1.o ./Core/Inc/lwip/src/netif/ppp/polarssl/sha1.su

.PHONY: clean-Core-2f-Inc-2f-lwip-2f-src-2f-netif-2f-ppp-2f-polarssl

