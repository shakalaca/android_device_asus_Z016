#
# Copyright (C) 2016 The CyanogenMod Project
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

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),Z016)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR_APPS)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

MDTP_FIRMWARE_SYMLINKS := $(TARGET_OUT)/etc/firmware
$(MDTP_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Linking MDTP firmware"
	@mkdir -p $@
	@rm -f $@/mdtp.*
	$(hide) ln -sf /firmware/image/mdtp.b00 $@/mdtp.b00
	$(hide) ln -sf /firmware/image/mdtp.b01 $@/mdtp.b01
	$(hide) ln -sf /firmware/image/mdtp.b02 $@/mdtp.b02
	$(hide) ln -sf /firmware/image/mdtp.b03 $@/mdtp.b03
	$(hide) ln -sf /firmware/image/mdtp.b04 $@/mdtp.b04
	$(hide) ln -sf /firmware/image/mdtp.b05 $@/mdtp.b05
	$(hide) ln -sf /firmware/image/mdtp.b06 $@/mdtp.b06
	$(hide) ln -sf /firmware/image/mdtp.mdt $@/mdtp.mdt

ALL_DEFAULT_INSTALLED_MODULES += $(MDTP_FIRMWARE_SYMLINKS)

RFS_APQ_GNSS_SYMLINKS := $(TARGET_OUT)/rfs/apq/gnss/
$(RFS_APQ_GNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS APQ GNSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/apq/gnss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_APQ_GNSS_SYMLINKS)

RFS_MDM_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/mdm/adsp/
$(RFS_MDM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MDM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/mdm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MDM_ADSP_SYMLINKS)

RFS_MDM_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/mdm/mpss/
$(RFS_MDM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MDM MPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/mdm/mpss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MDM_MPSS_SYMLINKS)

RFS_MDM_SPARROW_SYMLINKS := $(TARGET_OUT)/rfs/mdm/sparrow/
$(RFS_MDM_SPARROW_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MDM SPARROW folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /data/tombstones/sparrow $@/ramdumps
	$(hide) ln -sf /persist/rfs/mdm/sparrow $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MDM_SPARROW_SYMLINKS)

RFS_MSM_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/msm/adsp/
$(RFS_MSM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware

RFS_MSM_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/msm/mpss/
$(RFS_MSM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM MPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MSM_ADSP_SYMLINKS) $(RFS_MSM_MPSS_SYMLINKS)

WCD9320_SYMLINKS := $(TARGET_OUT)/etc/firmware/wcd9320/
$(WCD9320_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating WCD9320 folder: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)
	$(hide) ln -sf /data/misc/audio/wcd9320_anc.bin $@/wcd9320_anc.bin 
	$(hide) ln -sf /data/misc/audio/wcd9320_mad_audio.bin $@/wcd9320_mad_audio.bin
	$(hide) ln -sf /data/misc/audio/mbhc.bin $@/wcd9320_mbhc.bin

ALL_DEFAULT_INSTALLED_MODULES += $(WCD9320_SYMLINKS)

endif
