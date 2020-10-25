#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := device/motorola/channel

# Platform
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53
ARCH_ARM_HAVE_TLS_REGISTER := true

BOARD_USES_QCOM_HARDWARE := true
TARGET_BOOTLOADER_BOARD_NAME := SDM632
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506
TARGET_HAS_NO_SELECT_BUTTON := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom ehci-hcd.park=3 lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci androidboot.usbconfigfs=true
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.veritymode=eio
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE :=  2048
#BOARD_KERNEL_TAGS_OFFSET := 0x00000100
#BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_SEPARATED_DTBO := true
#BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/motorola/sdm632
TARGET_KERNEL_CONFIG := channel_defconfig
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 2048
#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/Image.gz-dtb

# Prebuilt DTBO.img
#BOARD_KERNEL_TAGS_OFFSET := 0x00000100
#BOARD_RAMDISK_OFFSET     := 0x01000000
#BOARD_PREBUILT_DTBOIMAGE := $(LOCAL_PATH)/prebuilt/dtbo.img
#BOARD_INCLUDE_RECOVERY_DTBO := true
#BOARD_BOOTIMG_HEADER_VERSION := 1
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Declare boot header
#BOARD_BOOT_HEADER_VERSION := 1
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        #    32768 * 1024 mmcblk0p41-42
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_DTBOIMG_PARTITION_SIZE := 8388608           #     8192 * 1024 mmcblk0p43-44
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2466250752    #  2408448 * 1024 mmcblk0p62-63
BOARD_USERDATAIMAGE_PARTITION_SIZE := 24540855808 # 23965679 * 1024 mmcblk0p64
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

#TARGET_NO_KERNEL := false
#TARGET_NO_RECOVERY := false

# Partitions (listed in the file) to be wiped under recovery.
# TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    vbmeta \
    dtbo

# Encryption
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true

# TWRP specific build flags
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
AB_OTA_UPDATER := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_MAX_BRIGHTNESS := 255
TW_THEME := portrait_hdpi
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_NO_SCREEN_BLANK := true
TW_USE_TOOLBOX := true
BOARD_PROVIDES_GPTUTILS := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_EXCLUDE_TWRPAPP := true
TW_HAS_EDL_MODE := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_NO_USB_STORAGE := true
PLATFORM_VERSION := 16.1.0

ALLOW_MISSING_DEPENDENCIES := true
