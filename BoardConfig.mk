# Use the non-open-source part, if present
#-include vendor/mtk_6735/nb6735_65c_l1/BoardConfigVendor.mk


# Use the 6735M common part
include device/cneeds/mgbox4_common/BoardConfig.mk


BOARD_PROTECT_FIMAGE_PARTITION_SIZE:=10485760
BOARD_PROTECT_SIMAGE_PARTITION_SIZE:=10485760
BOARD_SECROIMAGE_PARTITION_SIZE:=6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=1887436800
BOARD_CACHEIMAGE_PARTITION_SIZE:=419430400
BOARD_USERDATAIMAGE_PARTITION_SIZE:=1240465408
BOARD_INTSDIMAGE_PARTITION_SIZE:=0

TARGET_USES_CUSTOM_RIL := false


#Config partition size
#-include $(MTK_PTGEN_OUT)/partition_size.mk
#-include device/mediatek/mtk_6735/$(MTK_TARGET_PROJECT)/partition_size.mk
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

include device/cneeds/mgbox4_nissan/ProjectConfig.mk

MTK_INTERNAL_CDEFS := $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),$(foreach v,$(shell echo $($(t)) | tr '[a-z]' '[A-Z]'),-D$(v))))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)=\"$($(t))\"))

COMMON_GLOBAL_CFLAGS += $(MTK_INTERNAL_CDEFS)
COMMON_GLOBAL_CPPFLAGS += $(MTK_INTERNAL_CDEFS)

BOARD_KERNEL_CMDLINE = bootopt=64S3,32N2,32N2
# We would like DEXOPT as it will boot much much faster
WITH_DEXPREOPT := true
