LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/shisp.bin:system/etc/firmware/shisp.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/dis_cam14mp.bin:system/etc/firmware/dis_cam14mp.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fa_extension.bin:system/etc/firmware/fa_extension.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/isp_acc_multires.bin:system/etc/firmware/isp_acc_multires.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/isp_acc_warp_deghost.bin:system/etc/firmware/isp_acc_warp_deghost.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/isp_acc_fusion.bin:system/etc/firmware/isp_acc_fusion.bin
