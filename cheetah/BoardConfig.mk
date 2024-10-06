#
# Copyright (C) 2020 The Android Open-Source Project
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

# Enable load module in parallel
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

RELEASE_GOOGLE_PRODUCT_RADIO_DIR := $(RELEASE_GOOGLE_CHEETAH_RADIO_DIR)
RELEASE_GOOGLE_BOOTLOADER_CHEETAH_DIR ?= pdk# Keep this for pdk TODO: b/327119000
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/$(RELEASE_GOOGLE_BOOTLOADER_CHEETAH_DIR)
$(call soong_config_set,pantah_bootloader,prebuilt_dir,$(RELEASE_GOOGLE_BOOTLOADER_CHEETAH_DIR))
ifneq ($(filter trunk%, $(RELEASE_GOOGLE_BOOTLOADER_CHEETAH_DIR)),)
$(call soong_config_set,pantah_fingerprint,prebuilt_dir,trunk)
else
$(call soong_config_set,pantah_fingerprint,prebuilt_dir,$(RELEASE_GOOGLE_BOOTLOADER_CHEETAH_DIR))
endif

# The modules which need to be loaded in sequential
BOARD_KERNEL_CMDLINE += fips140.load_sequential=1
BOARD_KERNEL_CMDLINE += exynos_drm.load_sequential=1

TARGET_BOARD_INFO_FILE := device/google/pantah/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := cheetah
TARGET_SCREEN_DENSITY := 560
BOARD_USES_GENERIC_AUDIO := true
USES_DEVICE_GOOGLE_CLOUDRIPPER := true
BOARD_KERNEL_CMDLINE += swiotlb=noforce

include device/google/gs201/BoardConfig-common.mk
-include vendor/google_devices/gs201/prebuilts/BoardConfigVendor.mk
-include vendor/google_devices/cheetah/proprietary/BoardConfigVendor.mk
include device/google/pantah/sepolicy/cheetah-sepolicy.mk
include device/google/pantah/wifi/BoardConfig-wifi.mk

DEVICE_PATH := device/google/pantah
include $(DEVICE_PATH)/$(TARGET_BOOTLOADER_BOARD_NAME)/BoardConfigLineage.mk
