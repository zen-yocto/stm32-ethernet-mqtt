################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls.c \
../Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.c 

OBJS += \
./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls.o \
./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.o 

C_DEPS += \
./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls.d \
./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/lwip/src/apps/altcp_tls/%.o Core/Inc/lwip/src/apps/altcp_tls/%.su Core/Inc/lwip/src/apps/altcp_tls/%.cyclo: ../Core/Inc/lwip/src/apps/altcp_tls/%.c Core/Inc/lwip/src/apps/altcp_tls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Documents/STM32/OLED_on_SPI/Core/Src/ssd1306" -I"D:/Documents/STM32/OLED_on_SPI/Core/Inc/lwip" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-lwip-2f-src-2f-apps-2f-altcp_tls

clean-Core-2f-Inc-2f-lwip-2f-src-2f-apps-2f-altcp_tls:
	-$(RM) ./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls.cyclo ./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls.d ./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls.o ./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls.su ./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.cyclo ./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.d ./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.o ./Core/Inc/lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.su

.PHONY: clean-Core-2f-Inc-2f-lwip-2f-src-2f-apps-2f-altcp_tls

