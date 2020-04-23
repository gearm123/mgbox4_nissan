

#----------------------------------------------------------------------
# Compile LK bootloader for cneed's MGBOX4
#----------------------------------------------------------------------

LK_DIR := bootable/bootloader/lk_mgbox4
LK_OUT := $(PRODUCT_OUT)/lk.bin
LK_DEFCONFIG := odroidc2_config
LK_PROJECT := joya6735_35gc

TARGET_LK_OUT := $(TARGET_OUT_INTERMEDIATES)/BOOTLOADER_OBJ

TARGET_BOOTLOADER := $(PRODUCT_OUT)/lk.bin
.PHONY: $(TARGET_BOOTLOADER)

$(TARGET_BOOTLOADER): $(LK_OUT)

$(LK_OUT):
	@echo "Starting to build LK bootloader for MGBOX4 from Bootloader.mk"
	$(MAKE) -C $(LK_DIR) BOOTLOADER_OUT=../../../$(TARGET_LK_OUT) $(LK_PROJECT) 
	cp $(TARGET_LK_OUT)/build-$(LK_PROJECT)/lk.bin $(LK_OUT)
