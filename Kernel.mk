
	
#INSTALLED_KERNEL_TARGET := $(PRODUCT_OUT)/kernel

KERNEL_ARCH := arm
KERNEL_DEFCONFIG := joya6735_35gc_defconfig
KERNEL_ROOTDIR := kernel/mgbox4
KERNEL_OUT := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ
KERNEL_CONFIG := $(KERNEL_OUT)/.config
KERNEL_IMAGE := $(KERNEL_OUT)/arch/$(KERNEL_ARCH)/boot/zImage-dtb
KERNEL_MODULES_INSTALL := system
KERNEL_MODULES_OUT := $(TARGET_OUT)/lib/modules

#TARGET_TOOLCHAIN_ROOT := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.9
#TARGET_TOOLS_PREFIX := $(TARGET_TOOLCHAIN_ROOT)/bin/arm-linux-androideabi-

XXXYY := $(PWD)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
#XXXYY := /home/mgroup/mmallow/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
#KERNEL_CROSS_COMPILE := $(KERNEL_ROOT_DIR)/$(TARGET_TOOLS_PREFIX)
#BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)









#BOARD_MKBOOTIMG_ARGS := --second $(PRODUCT_OUT)/$(KERNEL_DEVICETREE).dtb --ramdisk_offset 0xfff88000 --tags_offset 0xfef88100



define cp-modules
	mkdir -p $(PRODUCT_OUT)/root/boot

	cp $(MALI_OUT)/mali.ko $(PRODUCT_OUT)/root/boot
	cp $(KERNEL_OUT)/arch/$(KERNEL_ARCH)/boot/dts/$(KERNEL_DEVICETREE).dtb $(PRODUCT_OUT)/
endef

define mv-modules
mdpath=`find $(KERNEL_MODULES_OUT) -type f -name modules.dep`;\
	if [ "$$mdpath" != "" ]; then \
	mpath=`dirname $$mdpath`;\
	ko=`find $$mpath/kernel $$mpath/hardware -type f -name *.ko`;\
	for i in $$ko; do echo $$i; mv $$i $(KERNEL_MODULES_OUT)/; done;\
	fi;\
	ko=`find hardware/odroidc2/backports -type f -name *.ko`;\
	mkdir -p $(KERNEL_MODULES_OUT)/backports; \
	for i in $$ko; do echo $$i; mv $$i $(KERNEL_MODULES_OUT)/backports/; done;
endef

define clean-module-folder
mdpath=`find $(KERNEL_MODULES_OUT) -type f -name modules.dep`;\
       if [ "$$mdpath" != "" ];then\
       mpath=`dirname $$mdpath`; rm -rf $$mpath;\
       fi
endef

$(KERNEL_OUT):
	mkdir -p $(KERNEL_OUT)
	#mkdir -p $(I2CKERNEL_OUT)

$(KERNEL_CONFIG): $(KERNEL_OUT)
	pwd
	$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(XXXYY) $(KERNEL_DEFCONFIG)
	#$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(I2CKERNEL_OUT) ARCH=$(KERNEL_ARCH) \
	#	CROSS_COMPILE=$(PREFIX_CROSS_COMPILE) $(I2CKERNEL_DEFCONFIG)

$(KERNEL_IMAGE): $(KERNEL_OUT) $(KERNEL_CONFIG)
	pwd
	$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(XXXYY)
#	$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(XXXYY) \
#		INSTALL_MOD_PATH=../../$(KERNEL_MODULES_INSTALL) INSTALL_MOD_STRIP=1 \
#		modules_install
		
	#$(MAKE) -C hardware/odroidc2/backports O=../../$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) \
	#	CROSS_COMPILE=$(PREFIX_CROSS_COMPILE) KLIB_BUILD=../../$(KERNEL_OUT) \
	#	defconfig-odroidc
	#$(MAKE) -C hardware/odroidc2/backports O=../../$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) \
	#	CROSS_COMPILE=$(PREFIX_CROSS_COMPILE) KLIB_BUILD=../../$(KERNEL_OUT)
#	$(gpu-modules)
#	$(cp-modules)
#	$(mv-modules)
	#$(btusb-modules)
#	$(clean-module-folder)
	#$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(I2CKERNEL_OUT) ARCH=$(KERNEL_ARCH) \
	#	CROSS_COMPILE=$(PREFIX_CROSS_COMPILE)
	#cp $(I2CKERNEL_IMAGE) $(INSTALLED_I2CKERNEL_TARGET)

.PHONY: kernelconfig
kernelconfig: $(KERNEL_OUT) $(KERNEL_CONFIG)
	env KCONFIG_NOTIMESTAMP=true \
		$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) \
		CROSS_COMPILE=$(PREFIX_CROSS_COMPILE) menuconfig
	#env KCONFIG_NOTIMESTAMP=true \
	#	$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(I2CKERNEL_OUT) ARCH=$(KERNEL_ARCH) \
	#	CROSS_COMPILE=$(PREFIX_CROSS_COMPILE) menuconfig

.PHONY: savekernelconfig
savekernelconfig: $(KERNEL_OUT) $(KERNEL_CONFIG)
	env KCONFIG_NOTIMESTAMP=true \
		$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) \
		CROSS_COMPILE=$(PREFIX_CROSS_COMPILE) savedefconfig
	@echo
	@echo Saved to $(KERNEL_OUT)/defconfig
	@echo
	@echo handly merge to "$(KERNEL_ROOTDIR)/arch/$(KERNEL_ARCH)/configs/$(KERNEL_DEFCONFIG)" if need
	@echo
	#env KCONFIG_NOTIMESTAMP=true \
	#	$(MAKE) -C $(KERNEL_ROOTDIR) O=../../$(I2CKERNEL_OUT) ARCH=$(KERNEL_ARCH) \
	#	CROSS_COMPILE=$(PREFIX_CROSS_COMPILE) savedefconfig

$(PRODUCT_OUT)/kernel: $(KERNEL_IMAGE)
	@echo "Kernel installed"
	$(transform-prebuilt-to-target)

