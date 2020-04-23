# Inherit for devices that support 64-bit primary and 32-bit secondary zygote startup script
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Set target and base project for flavor build
MTK_TARGET_PROJECT := mgbox4_nissan
MTK_BASE_PROJECT := $(MTK_TARGET_PROJECT)
MTK_PROJECT_FOLDER := $(shell find device/* -maxdepth 3 -name $(MTK_BASE_PROJECT))
MTK_TARGET_PROJECT_FOLDER := $(shell find device/* -maxdepth 3 -name $(MTK_TARGET_PROJECT))
#$(info MTK_PROJECT_FOLDER is $(MTK_TARGET_PROJECT_FOLDER))
#$(info MTK_TARGET_PROJECT_FOLDER is $(MTK_TARGET_PROJECT_FOLDER))
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
# Inherit from maguro device
$(call inherit-product, device/cneeds/mgbox4_nissan/device.mk)

# set locales & aapt config.
PRODUCT_LOCALES := iw_IL en_US  ar_EG ru_RU fr_FR it_IT es_ES es_CL et_EE de_DE nl_NL cs_CZ pl_PL ja_JP sv_SE zh_CN zh_TW

# Set those variables here to overwrite the inherited values.
PRODUCT_MANUFACTURER := mgroup
PRODUCT_NAME := mgbox4_nissan
PRODUCT_DEVICE := mgbox4_nissan
PRODUCT_MODEL := mgbox4_nissan
PRODUCT_POLICY := android.policy_phone
PRODUCT_BRAND := mgroup


KERNEL_DEFCONFIG ?= joya6735_35gc_defconfig

#PRELOADER_TARGET_PRODUCT ?= lentk6735m_65c_l1
#LK_PROJECT ?= lentk6735m_65c_l1


$(call inherit-product-if-exists, device/hardkernel/proprietary/proprietary.mk)

DEPLOY_TARGET_SCRIPT := $(LOCAL_PATH)/deploy_updater_script
DEPLOY_TARGET_BINARY := $(ANDROID_PRODUCT_OUT)/system/bin/updater
DEPLOY_TARGET_OUTPUT := $(ANDROID_PRODUCT_OUT)/mgbox4_deploy.zip
DEPLOY_TARGET_FILES := $(ANDROID_PRODUCT_OUT)/boot.img
DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/logo.bin
DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/recovery.img
DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/system_raw.img
DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/lk.bin
DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/preloader.bin
DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/system/build.prop
#DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/protect1.img
#DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/protect2.img
#DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/tz1.bin
#DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/tz2.bin
#DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/secro.img
DEPLOY_TARGET_FILES += $(ANDROID_PRODUCT_OUT)/MT6735_Android_scatter.txt
