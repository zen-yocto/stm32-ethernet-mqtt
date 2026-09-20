################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/Third_Party/mbedTLS/library/subdir.mk
-include Middlewares/Third_Party/lwIP/src/netif/ppp/polarssl/subdir.mk
-include Middlewares/Third_Party/lwIP/src/netif/ppp/subdir.mk
-include Middlewares/Third_Party/lwIP/src/netif/subdir.mk
-include Middlewares/Third_Party/lwIP/src/include/arch/subdir.mk
-include Middlewares/Third_Party/lwIP/src/core/ipv6/subdir.mk
-include Middlewares/Third_Party/lwIP/src/core/ipv4/subdir.mk
-include Middlewares/Third_Party/lwIP/src/core/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/tftp/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/sntp/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/snmp/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/smtp/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/netbiosns/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/mqtt/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/mdns/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/lwiperf/subdir.mk
-include Middlewares/Third_Party/lwIP/src/apps/altcp_tls/subdir.mk
-include Middlewares/Third_Party/lwIP/src/api/subdir.mk
-include Middlewares/Third_Party/MQTT/MQTTPacket/src/subdir.mk
-include Middlewares/Third_Party/MQTT/MQTTClient-C/src/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
-include MBEDTLS/App/subdir.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/ssd1306/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := OLED_on_SPI
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
OLED_on_SPI.elf \

MAP_FILES += \
OLED_on_SPI.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
OLED_on_SPI.list \


# All Target
all: main-build

# Main-build Target
main-build: OLED_on_SPI.elf secondary-outputs

# Tool invocations
OLED_on_SPI.elf OLED_on_SPI.map: $(OBJS) $(USER_OBJS) D:\Documents\STM32\OLED_on_SPI\STM32F411RETX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "OLED_on_SPI.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"D:\Documents\STM32\OLED_on_SPI\STM32F411RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="OLED_on_SPI.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -u _printf_float -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

OLED_on_SPI.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "OLED_on_SPI.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) OLED_on_SPI.elf OLED_on_SPI.list OLED_on_SPI.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
