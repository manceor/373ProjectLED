################################################################################
# Automatically-generated file. Do not edit!
################################################################################

O_SRCS := 
C_SRCS := 
S_UPPER_SRCS := 
S_SRCS := 
OBJ_SRCS := 
MEMORYMAP := 
OBJS := 
C_DEPS := 
SRECFILES := 
IHEXFILES := 
LISTINGS := 
EXECUTABLE := 

# Every subdirectory with source files must be described here
SUBDIRS := \
. \

################################################################################
# Microsemi SoftConsole IDE Variables
################################################################################

BUILDCMD = arm-none-eabi-gcc -mthumb -mcpu=cortex-m3  -L"C:\Users\mmanceor\Downloads\LED\LED\SoftConsole\MSS01_MSS_CM3_0\MSS01_MSS_CM3_0_hw_platform\Debug" -TC:\Users\mmanceor\Downloads\LED\LED\SoftConsole\MSS01_MSS_CM3_0\MSS01_MSS_CM3_0_hw_platform\CMSIS\startup_gcc\debug-in-actel-smartfusion-esram.ld -Wl,-Map=$(EXECUTABLE).map -Xlinker -gc-sections 
SHELL := cmd.exe
EXECUTABLE := MSS01_MSS_CM3_0_app

# Target-specific items to be cleaned up in the top directory.
clean::
	-$(RM) $(wildcard ./*.map) 
