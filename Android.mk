LOCAL_PATH:= $(call my-dir)

# ISP and FR
camera_libs := shisp_css15.bin shisp_2400b0_cssv2.bin shisp_2400_cssv2.bin shisp_2400_cssv2_isp_2_2.bin shisp_2400a0_v21.bin shisp_2400b0_v21.bin \
shisp_2401a0_legacy_v21.bin shisp_2401a0_v21.bin \
isp_fr.bin isp_fr_2400.bin
# HDR FW CSS1.5 ISP2300
hdr_css15_2300_libs := isp_acc_multires_css15.bin isp_acc_warping_css15.bin isp_acc_deghosting_css15.bin \
isp_acc_fusion_css15.bin isp_acc_postproc_css15.bin
# HDR FW CSS2.0 ISP2400A0
hdr_css20_2400_libs := isp_acc_multires_css20_2400.bin isp_acc_warping_css20_2400.bin isp_acc_deghosting_css20_2400.bin \
isp_acc_fusion_css20_2400.bin isp_acc_postproc_css20_2400.bin
# HDR FW CSS2.0 ISP2400B0
hdr_css20_2400b0_libs := isp_acc_multires_css20_2400b0.bin isp_acc_warping_css20_2400b0.bin isp_acc_deghosting_css20_2400b0.bin \
isp_acc_fusion_css20_2400b0.bin isp_acc_postproc_css20_2400b0.bin
# HDR v2 FW CSS2.0 ISP2400B0
hdr_v2_css20_2400b0_libs := isp_acc_multires_v2_css20_2400b0.bin isp_acc_warping_v2_css20_2400b0.bin isp_acc_deghosting_v2_css20_2400b0.bin \
isp_acc_lumaproc_css20_2400b0.bin isp_acc_chromaproc_css20_2400b0.bin
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

# build HDR

include $(CLEAR_VARS)
LOCAL_MODULE := hdr_fw_css15_2300
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(hdr_css15_2300_libs)
include $(BUILD_PHONY_PACKAGE)

$(call camera-prebuilt-boilerplate, \
    $(hdr_css15_2300_libs))

include $(CLEAR_VARS)
LOCAL_MODULE := hdr_fw_css20_2400
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(hdr_css20_2400_libs)
include $(BUILD_PHONY_PACKAGE)

$(call camera-prebuilt-boilerplate, \
    $(hdr_css20_2400_libs))

include $(CLEAR_VARS)
LOCAL_MODULE := hdr_fw_css20_2400b0
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(hdr_css20_2400b0_libs)
include $(BUILD_PHONY_PACKAGE)

$(call camera-prebuilt-boilerplate, \
    $(hdr_css20_2400b0_libs))

include $(CLEAR_VARS)
LOCAL_MODULE := hdr_v2_fw_css20_2400b0
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(hdr_v2_css20_2400b0_libs)
include $(BUILD_PHONY_PACKAGE)

$(call camera-prebuilt-boilerplate, \
    $(hdr_v2_css20_2400b0_libs))

include $(CLEAR_VARS)
LOCAL_MODULE := hdr_v2_fw_css21_2400b0
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(hdr_v2_css21_2400b0_libs)
include $(BUILD_PHONY_PACKAGE)

$(call camera-prebuilt-boilerplate, \
    $(hdr_v2_css21_2400b0_libs))

