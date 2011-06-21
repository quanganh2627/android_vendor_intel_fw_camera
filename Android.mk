LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)


PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/shisp.bin:system/etc/firmware/shisp.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/dis_cam14mp.bin:system/etc/firmware/dis_cam14mp.bin

