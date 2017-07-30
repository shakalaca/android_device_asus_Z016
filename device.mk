# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

$(call inherit-product-if-exists, vendor/asus/Z016/Z016-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:system/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:system/etc/permissions/android.software.picture_in_picture.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:system/etc/permissions/android.hardware.vr.high_performance.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/asus.software.azs.xml:system/etc/permissions/asus.software.azs.xml \
    $(LOCAL_PATH)/configs/permissions/asus.software.zenui.xml:system/etc/permissions/asus.software.zenui.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Device was launched with M
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

PRODUCT_PACKAGES += libGLES_android

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8996 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

AUDIO_CAF_DIR := $(TOPDIR)hardware/qcom/audio-caf/msm8996/configs/msm8996

PRODUCT_COPY_FILES += \
    $(AUDIO_CAF_DIR)/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    $(AUDIO_CAF_DIR)/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_tasha.xml:system/etc/mixer_paths_tasha.xml

PRODUCT_COPY_FILES += \
    $(AUDIO_CAF_DIR)/sound_trigger_mixer_paths_wcd9330.xml:system/etc/sound_trigger_mixer_paths_wcd9330.xml \
    $(AUDIO_CAF_DIR)/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(AUDIO_CAF_DIR)/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml

PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    $(AUDIO_CAF_DIR)/listen_platform_info.xml:system/etc/listen_platform_info.xml

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libfmjni \
    libqcomfm_jni \
    libfm-hci \
    fm_helium \
    qcom.fmradio \
    fmhal_service

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    antradio_app \
    libvolumelistener \
    libantradio

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

# Camera
PRODUCT_PACKAGES += \
    camera.msm8996 \
    bspcapability \
    Snap

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/s5k2l7_8953_chromatix.xml:system/etc/camera/s5k2l7_8953_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3m2xm_chromatix_bear.xml:system/etc/camera/s5k3m2xm_chromatix_bear.xml \
    $(LOCAL_PATH)/configs/camera/imx230_qc2002_chromatix.xml:system/etc/camera/imx230_qc2002_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx298_gt24c64_chromatix.xml:system/etc/camera/imx298_gt24c64_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov5670_f5670bq_chromatix.xml:system/etc/camera/ov5670_f5670bq_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov13850_q13v06k_chromatix.xml:system/etc/camera/ov13850_q13v06k_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov5670_chromatix.xml:system/etc/camera/ov5670_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx258_chromatix.xml:system/etc/camera/imx258_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx362_chromatix.xml:system/etc/camera/imx362_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx378_chromatix.xml:system/etc/camera/imx378_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/camera_config.xml:system/etc/camera/camera_config.xml \
    $(LOCAL_PATH)/configs/camera/imx230_qc2002_with_gyro_chromatix.xml:system/etc/camera/imx230_qc2002_with_gyro_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov8858_chromatix.xml:system/etc/camera/ov8858_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx318_chromatix.xml:system/etc/camera/imx318_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx230_chromatix.xml:system/etc/camera/imx230_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3m2xx_chromatix.xml:system/etc/camera/s5k3m2xx_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/csidtg_camera.xml:system/etc/camera/csidtg_camera.xml \
    $(LOCAL_PATH)/configs/camera/s5k3l8_mono_chromatix.xml:system/etc/camera/s5k3l8_mono_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov13850_chromatix.xml:system/etc/camera/ov13850_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx298_chromatix.xml:system/etc/camera/imx298_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k2l7_chromatix.xml:system/etc/camera/s5k2l7_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov8856_chromatix.xml:system/etc/camera/ov8856_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx258_mono_chromatix.xml:system/etc/camera/imx258_mono_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/csidtg_chromatix.xml:system/etc/camera/csidtg_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3l8_f3l8yam_chromatix.xml:system/etc/camera/s5k3l8_f3l8yam_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx362_chromatix_bear.xml:system/etc/camera/imx362_chromatix_bear.xml \
    $(LOCAL_PATH)/configs/camera/imx214_chromatix.xml:system/etc/camera/imx214_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx258_bear_chromatix.xml:system/etc/camera/imx258_bear_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov2281_chromatix.xml:system/etc/camera/ov2281_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov4688_chromatix.xml:system/etc/camera/ov4688_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov8865_chromatix.xml:system/etc/camera/ov8865_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3p3sm_chromatix.xml:system/etc/camera/s5k3p3sm_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3l8_chromatix.xml:system/etc/camera/s5k3l8_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov5695_chromatix.xml:system/etc/camera/ov5695_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3m2xm_chromatix.xml:system/etc/camera/s5k3m2xm_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov2680_chromatix.xml:system/etc/camera/ov2680_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx258_mono_bear_chromatix.xml:system/etc/camera/imx258_mono_bear_chromatix.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bspcapability.xml:system/etc/bspcapability.xml

# Display
PRODUCT_PACKAGES += \
    copybit.msm8996 \
    gralloc.msm8996 \
    hwcomposer.msm8996 \
    memtrack.msm8996 \
    liboverlay \
    libtinyxml

# Connectivity Engine support (CNE)
PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    cneapiclient \
    com.quicinc.cne \
    services-ext

# LiveDisplay native
PRODUCT_PACKAGES += \
    libjni_livedisplay

# Fingerprint sensor
PRODUCT_PACKAGES += \
    fingerprintd

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# Gello
PRODUCT_PACKAGES += \
    Gello

# GPS
PRODUCT_PACKAGES += \
    gps.msm8996 \
    libcurl \
    libgnsspps

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/etc/lowi.conf:system/etc/lowi.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/gps/etc/xtwifi.conf:system/etc/xtwifi.conf

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    $(LOCAL_PATH)/configs/keylayout/Vendor_0b05_Product_17fc.kl:system/usr/keylayout/Vendor_0b05_Product_17fc.kl \
    $(LOCAL_PATH)/configs/keylayout/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl \
    $(LOCAL_PATH)/configs/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl
#    $(LOCAL_PATH)/keylayout/Validity_Navigation_Sensor.kl:system/usr/keylayout/Validity_Navigation_Sensor.kl \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/ASUS_TransKeyboard.idc:system/usr/idc/ASUS_TransKeyboard.idc \
    $(LOCAL_PATH)/configs/idc/Vendor_0b05_Product_17fc.idc:system/usr/idc/Vendor_0b05_Product_17fc.idc

# Lights
PRODUCT_PACKAGES += \
    lights.msm8996

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# NFC
PRODUCT_PACKAGES += \
    NQNfcNci \
    libnqnfc-nci \
    libnqnfc_nci_jni \
    nfc_nci.nqx.default \
    com.nxp.nfc.nq \
    com.nxp.nfc.nq.xml \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw \
    libmm-omxcore

# Power
PRODUCT_PACKAGES += \
    power.msm8996

# QMI
PRODUCT_PACKAGES += \
    libjson

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.early_boot.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.qcom.sensors.sh \
    init.mdm.sh \
    init.msm.usb.configfs.rc \
    init.class_main.sh \
    init.target.rc \
    ueventd.qcom.rc

PRODUCT_PACKAGES += \
    init.asus.rc \
    init.asus.laser.rc \
    init.asus.target.rc

# RIL
PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2 \
    libprotobuf-cpp-full

# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8996

# Sensor HAL conf file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:system/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf

# Wifi
PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/bcmdhd/p2p_supplicant.conf:system/etc/wifi/bcmdhd/p2p_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/bcmdhd/wpa_supplicant_overlay.conf:system/etc/wifi/bcmdhd/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/bcmdhd/hostapd.conf:system/etc/wifi/bcmdhd/hostapd.conf \
    $(LOCAL_PATH)/configs/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/wifi/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/wifi/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

PRODUCT_PACKAGES += \
    fstman \
    fstman.ini

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:system/etc/thermal-engine.conf \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:system/etc/thermal-engine.conf.balance \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:system/etc/thermal-engine.conf.charger \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:system/etc/thermal-engine.conf.normal \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:system/etc/thermal-engine.conf.ultra 

# e2fsck
PRODUCT_PACKAGES += \
    e2fsck \
    resize2fs \
    tune2fs \
    blkid \
    mke2fs

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# ASUS Splendid
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/LUT_RdWeak.txt:/system/etc/firmware/phone_ct/LUT_RdWeak.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW03.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC03.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W07.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC08.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMGC.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMGC.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW04.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW07.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C01.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW01.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC05.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW01.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW06.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC06.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC10.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW07.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW10.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC03.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW09.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C03.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW08.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW10.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMDEF.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMDEF.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W02.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW02.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W10.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C05.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC05.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C04.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC02.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W06.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC04.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC01.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_RdWeak.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_RdWeak.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC02.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_Rd02.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_Rd02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W09.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW09.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_DEF.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_DEF.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBDEF.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBDEF.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC09.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW06.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C02.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W04.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_Rd03.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_Rd03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C07.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C06.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_Rd01.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_Rd01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC01.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW04.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W01.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC06.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W05.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW08.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC08.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C08.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC09.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC07.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W08.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC07.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC10.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMC10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_W03.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_W03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_RdStrong.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_RdStrong.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC04.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBC04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C09.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW02.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW05.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMSRGBW05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW05.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW03.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_GMW03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/SS1080P_ZS570KL/LUT_C10.txt:/system/etc/firmware/phone_ct/SS1080P_ZS570KL/LUT_C10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/phone_ct/LUT_RdStrong.txt:/system/etc/firmware/phone_ct/LUT_RdStrong.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/asussplendid_config.xml:/system/etc/firmware/Splendid/asussplendid_config.xml \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W07.txt:/system/etc/firmware/Splendid/LUT/LUT_W07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC08.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMGC.txt:/system/etc/firmware/Splendid/LUT/LUT_GMGC.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW04.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C01.txt:/system/etc/firmware/Splendid/LUT/LUT_C01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW01.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW06.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC06.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW07.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC03.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C03.txt:/system/etc/firmware/Splendid/LUT/LUT_C03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW08.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW10.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMDEF.txt:/system/etc/firmware/Splendid/LUT/LUT_GMDEF.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W02.txt:/system/etc/firmware/Splendid/LUT/LUT_W02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW02.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W10.txt:/system/etc/firmware/Splendid/LUT/LUT_W10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C05.txt:/system/etc/firmware/Splendid/LUT/LUT_C05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC05.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C04.txt:/system/etc/firmware/Splendid/LUT/LUT_C04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W06.txt:/system/etc/firmware/Splendid/LUT/LUT_W06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC04.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_RdWeak.txt:/system/etc/firmware/Splendid/LUT/LUT_RdWeak.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC02.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_Rd02.txt:/system/etc/firmware/Splendid/LUT/LUT_Rd02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W09.txt:/system/etc/firmware/Splendid/LUT/LUT_W09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW09.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_DEF.txt:/system/etc/firmware/Splendid/LUT/LUT_DEF.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC09.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C02.txt:/system/etc/firmware/Splendid/LUT/LUT_C02.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W04.txt:/system/etc/firmware/Splendid/LUT/LUT_W04.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_Rd03.txt:/system/etc/firmware/Splendid/LUT/LUT_Rd03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C07.txt:/system/etc/firmware/Splendid/LUT/LUT_C07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C06.txt:/system/etc/firmware/Splendid/LUT/LUT_C06.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_Rd01.txt:/system/etc/firmware/Splendid/LUT/LUT_Rd01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC01.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W01.txt:/system/etc/firmware/Splendid/LUT/LUT_W01.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W05.txt:/system/etc/firmware/Splendid/LUT/LUT_W05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C08.txt:/system/etc/firmware/Splendid/LUT/LUT_C08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W08.txt:/system/etc/firmware/Splendid/LUT/LUT_W08.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC07.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC07.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMC10.txt:/system/etc/firmware/Splendid/LUT/LUT_GMC10.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_W03.txt:/system/etc/firmware/Splendid/LUT/LUT_W03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_RdStrong.txt:/system/etc/firmware/Splendid/LUT/LUT_RdStrong.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C09.txt:/system/etc/firmware/Splendid/LUT/LUT_C09.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW05.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW05.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_GMW03.txt:/system/etc/firmware/Splendid/LUT/LUT_GMW03.txt \
    $(LOCAL_PATH)/configs/splendid/firmware/Splendid/LUT/LUT_C10.txt:/system/etc/firmware/Splendid/LUT/LUT_C10.txt

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/asus.hardware.display.splendid.reading_mode.xml:system/etc/permissions/asus.hardware.display.splendid.reading_mode.xml \
    $(LOCAL_PATH)/configs/permissions/asus.hardware.display.splendid.xml:system/etc/permissions/asus.hardware.display.splendid.xml

PRODUCT_PACKAGES += \
    AsusSplendidCommandAgent

# FlipCover
PRODUCT_PACKAGES += \
    FlipCoverWrapper

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/asus.software.cover3_feature_1.xml:/system/etc/permissions/asus.software.cover3_feature_1.xml \
    $(LOCAL_PATH)/configs/permissions/asus.hardware.transcover_version3.xml:/system/etc/permissions/asus.hardware.transcover_version3.xml \
    $(LOCAL_PATH)/configs/permissions/asus.hardware.transcover.xml:/system/etc/permissions/asus.hardware.transcover.xml \
    $(LOCAL_PATH)/configs/permissions/asus.hardware.transcover_info.xml:/system/etc/permissions/asus.hardware.transcover_info.xml

# Doze
PRODUCT_PACKAGES += \
   ZenfoneDoze

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_msm8996

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
