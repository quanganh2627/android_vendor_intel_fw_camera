LOCAL_PATH:= $(call my-dir)

# ISP and FR
camera_libs := shisp_2400b0_v21.bin

# HDR v2 FW CSS2.1 ISP2400B0
hdr_v2_css21_2400b0_libs := isp_acc_multires_v2_css21_2400b0.bin isp_acc_warping_v2_css21_2400b0.bin isp_acc_deghosting_v2_css21_2400b0.bin \
isp_acc_lumaproc_css21_2400b0.bin isp_acc_chromaproc_css21_2400b0.bin

# function to copy firmware libraries to /etc/firmware
define camera-prebuilt-boilerplate
$(foreach t,$(1), \
  $(eval include $(CLEAR_VARS)) \
  $(eval tw := $(subst :, ,$(strip $(t)))) \
  $(eval LOCAL_MODULE := $(tw)) \
  $(eval LOCAL_MODULE_OWNER := intel) \
  $(eval LOCAL_MODULE_TAGS := optional) \
  $(eval LOCAL_MODULE_CLASS := ETC) \
  $(eval LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware) \
  $(eval LOCAL_SRC_FILES := $(tw)) \
  $(eval include $(BUILD_PREBUILT)) \
)
endef

# build ISP and FW
$(call camera-prebuilt-boilerplate, \
    $(camera_libs))

# build HDR v2 FW CSS2.1 ISP2400B0
include $(CLEAR_VARS)
LOCAL_MODULE := hdr_v2_fw_css21_2400b0
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(hdr_v2_css21_2400b0_libs)
include $(BUILD_PHONY_PACKAGE)

$(call camera-prebuilt-boilerplate, \
    $(hdr_v2_css21_2400b0_libs))

