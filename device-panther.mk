#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := pantah
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

# Inherit from gs201
include device/google/gs201/common.mk

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResOverlayProductPantah \
    FrameworkResOverlayVendorPantah \
    ONSOverlayVendorPantah \
    PixelNfcOverlayPantah \
    SafetyRegulatoryInfoOverlayProductPantah \
    SystemUIGoogleOverlayVendorPantah

PRODUCT_PACKAGES += \
    DMServiceOverlayProductGs201 \
    DMServiceOverlayVendorPanther \
    FrameworkResOverlayProductPanther \
    FrameworkResOverlayVendorPanther \
    HbmSVManagerOverlayProductPanther \
    PixelNfcOverlayPanther \
    PixelWifiOverlay2023_midyear_F10 \
    SettingsGooglePantherOverlay \
    SettingsOverlayG03Z5 \
    SettingsOverlayGQML3 \
    SettingsOverlayGVU6C \
    SettingsOverlayGVU6C_VN \
    SystemUIGoogleOverlayVendorPanther

PRODUCT_PACKAGES += \
    ApertureOverlayPanther

# PowerShare
include hardware/google/pixel/powershare/device.mk

# Preinstalled packages
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/sysconfig/preinstalled-packages-prebuilt-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-prebuilt-product.xml \
    $(DEVICE_PATH)/sysconfig/preinstalled-packages-prebuilt-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/preinstalled-packages-prebuilt-system_ext.xml

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.panther.rc

PRODUCT_PACKAGES += \
    init.recovery.panther.touch.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml
