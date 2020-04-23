include $(LOCAL_PATH)/ProjectConfig.mk

PRODUCT_COPY_FILES += $(LOCAL_PATH)/factory_init.project.rc:root/factory_init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.project.rc:root/init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/meta_init.project.rc:root/meta_init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.mt6735.rc:root/init.mt6735.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/ueventd.mt6735.rc:root/ueventd.mt6735.rc
# phantom input keylayout
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/usr/keylayout/phantom-input.kl:system/usr/keylayout/phantom-input.kl

DEVICE_RESOLUTION := 800x480
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.recovery.mt6735.rc:root/init.recovery.mt6735.rc


#ifeq ($(MTK_SMARTBOOK_SUPPORT),yes)
#PRODUCT_COPY_FILES += device/mediatek/mtk_6735/nb6735_65c_l1/sbk-kpd.kl:system/usr/keylayout/sbk-kpd.kl \
#                      device/mediatek/mtk_6735/nb6735_65c_l1/sbk-kpd.kcm:system/usr/keychars/sbk-kpd.kcm
#endif


# thermal policy
#ifeq ($(TARGET_BUILD_VARIANT),eng)
#    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal_eng.conf:system/etc/.tp/thermal.conf
#else
PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.conf:system/etc/.tp/thermal.conf
#endif

# alps/vendor/mediatek/proprietary/external/GeoCoding/Android.mk
#PRODUCT_COPY_FILES += device/mediatek/mtk_6735/nb6735_65c_l1/vendor/mediatek/proprietary/external/GeoCoding/geocoding.db:system/etc/geocoding.db

# alps/vendor/mediatek/proprietary/frameworks-ext/native/etc/Android.mk
# sensor related xml files for CTS

#Permissions
PRODUCT_COPY_FILES += $(LOCAL_PATH)/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml


PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml


ifneq ($(strip $(CUSTOM_KERNEL_BAROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml
endif

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
endif

#mgvoice
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/app/MGVoice/MGVoice.apk:system/app/MGVoice/MGVoice.apk

#mgstore
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/app/MGCarAppStore/MGCarAppStore.apk:system/app/MGCarAppStore/MGCarAppStore.apk

# GPS relative file
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:system/lib/open_nfc_driver.ko

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += device/cneeds/mgbox4_nissan/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Audio
PRODUCT_PACKAGES += \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \


# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp,adb
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.acm.enable=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mount.fs=EXT4
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.logd.size=256k
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.logd.size.main=8M
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.logd.size.radio=1M


# meta tool
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.chip_ver=S01
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.version.release=$(strip $(MTK_BUILD_VERNO))
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.platform=MT6735
PRODUCT_PROPERTY_OVERRIDES += ro.config.max_starting_bg=2
# set Telephony property - SIM count
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=1
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0

PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=ss


# Modem firmwares (Modem,DSP,etc..)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/modem_1_lwg_n.img:system/etc/firmware/modem_1_lwg_n.img
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/modem_1_ltg_n.img:system/etc/firmware/modem_1_ltg_n.img
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/dsp_1_lwg_n.bin:system/etc/firmware/dsp_1_lwg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/dsp_1_ltg_n.bin:system/etc/firmware/dsp_1_ltg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/em_filter_1_lwg_n.bin:system/etc/firmware/em_filter_1_lwg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/em_filter_1_ltg_n.bin:system/etc/firmware/em_filter_1_ltg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/catcher_filter_1_lwg_n.bin:system/etc/firmware/catcher_filter_1_lwg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/catcher_filter_1_ltg_n.bin:system/etc/firmware/catcher_filter_1_ltg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/ROMv2_lm_patch_1_0_hdr.bin:system/etc/firmware/ROMv2_lm_patch_1_0_hdr.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/ROMv2_lm_patch_1_1_hdr.bin:system/etc/firmware/ROMv2_lm_patch_1_1_hdr.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/S_ANDRO_SFL.ini:system/etc/firmware/S_ANDRO_SFL.ini
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/WIFI_RAM_CODE_6735:system/etc/firmware/WIFI_RAM_CODE_6735
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/WMT_SOC.cfg:system/etc/firmware/WMT_SOC.cfg

# ESP32 firmware
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/esp/app.bin:system/etc/firmware/esp/app.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/esp/bootloader.bin:system/etc/firmware/esp/bootloader.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/firmware/esp/nv.bin:system/etc/firmware/esp/nv.bin





PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf


#logo.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/logo.bin:logo.bin

#Keylayout
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/usr/keylayout/gpio-ignition.kl:system/usr/keylayout/gpio-ignition.kl

#Boot animation
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/media/bootaudio.mp3:system/media/bootaudio.mp3

#APNS
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Audio Related Resource
#PRODUCT_COPY_FILES += device/mediatek/mtk_6735/nb6735_65c_l1/vendor/mediatek/proprietary/custom/nb6735_65c_l1/factory/res/sound/testpattern1.wav:system/res/sound/testpattern1.wav
#PRODUCT_COPY_FILES += device/mediatek/mtk_6735/nb6735_65c_l1/vendor/mediatek/proprietary/custom/nb6735_65c_l1/factory/res/sound/ringtone.wav:system/res/sound/ringtone.wav

# Keyboard layout
#PRODUCT_COPY_FILES += device/mediatek/mt6735/ACCDET.kl:system/usr/keylayout/ACCDET.kl
#PRODUCT_COPY_FILES += device/mediatek/mtk_6735/nb6735_65c_l1/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Microphone
#PRODUCT_COPY_FILES += device/mediatek/mtk_6735/nb6735_65c_l1/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml

# Camera
#PRODUCT_COPY_FILES += device/mediatek/mtk_6735/nb6735_65c_l1/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += $(LOCAL_PATH)/files/audio_policy.conf:system/etc/audio_policy.conf


#MTK GPS SUPL Configuration
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

#Velvet application (prebuilt)
PRODUCT_COPY_FILES += vendor/mgroup/apps/Velvet/Velvet.apk:system/app/Velvet/Velvet.apk
PRODUCT_COPY_FILES += vendor/mgroup/apps/Velvet/lib/arm/libbrotli.so:system/app/Velvet/lib/arm/libbrotli.so
PRODUCT_COPY_FILES += vendor/mgroup/apps/Velvet/lib/arm/libcronet.so:system/app/Velvet/lib/arm/libcronet.so
PRODUCT_COPY_FILES += vendor/mgroup/apps/Velvet/lib/arm/libframesequence.so:system/app/Velvet/lib/arm/libframesequence.so
PRODUCT_COPY_FILES += vendor/mgroup/apps/Velvet/lib/arm/libgoogle_speech_jni.so:system/app/Velvet/lib/arm/libgoogle_speech_jni.so
PRODUCT_COPY_FILES += vendor/mgroup/apps/Velvet/lib/arm/libgoogle_speech_micro_jni.so:system/app/Velvet/lib/arm/libgoogle_speech_micro_jni.so
PRODUCT_COPY_FILES += vendor/mgroup/apps/Velvet/lib/arm/libnativecrashreporter.so:system/app/Velvet/lib/arm/libnativecrashreporter.so
PRODUCT_COPY_FILES += vendor/mgroup/apps/Velvet/lib/arm/liboffline_actions_jni.so:system/app/Velvet/lib/arm/liboffline_actions_jni.so

DEVICE_PACKAGE_OVERLAYS += device/cneeds/mgbox4_nissan/overlay


#DEVICE_PACKAGE_OVERLAYS += device/mediatek/mtk_6735/nb6735_65c_l1/overlay
#ifdef OPTR_SPEC_SEG_DEF
#  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
#    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
#    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
#    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
#    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
#  endif
#endif
#ifneq (yes,$(strip $(MTK_TABLET_PLATFORM)))
#  ifeq (480,$(strip $(LCM_WIDTH)))
#    ifeq (854,$(strip $(LCM_HEIGHT)))
#      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/FWVGA
#    endif
#  endif
#  ifeq (540,$(strip $(LCM_WIDTH)))
#    ifeq (960,$(strip $(LCM_HEIGHT)))
#      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/qHD
#    endif
#  endif
#endif
#ifeq (yes,$(strip $(MTK_GMO_ROM_OPTIMIZE)))
#  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_rom
#endif
#ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))
#  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
#endif
#DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/navbar

#ifeq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
#    PRODUCT_PACKAGES += DangerDash
#endif

PRODUCT_PACKAGES += OpenDashboardLauncher

PRODUCT_PACKAGES += MGFactoryKit

PRODUCT_PACKAGES += MGGPSTest
PRODUCT_PACKAGES += JeneService
PRODUCT_PACKAGES += SquireSettings
PRODUCT_PACKAGES += jenecli
#PRODUCT_PACKAGES += messaging
#PRODUCT_PACKAGES += Email
#PRODUCT_PACKAGES += Exchange2
PRODUCT_PACKAGES += Gallery2

PRODUCT_PACKAGES += MTKImeiWriter


#Needed for CTS
PRODUCT_PACKAGES += CallLogBackup

#codecs
PRODUCT_PACKAGES += libstagefrighthw
PRODUCT_PACKAGES += libMtkOmxCore
PRODUCT_PACKAGES += libvcodec_oal
PRODUCT_PACKAGES += libh264enc_sa.ca7
PRODUCT_PACKAGES += libh264enc_sb.ca7
PRODUCT_PACKAGES += libHEVCdec_sa.ca7.android
PRODUCT_PACKAGES += libmp4enc_sa.ca7
PRODUCT_PACKAGES += libmp4enc_xa.ca7
PRODUCT_PACKAGES += libvc1dec_sa.ca7
PRODUCT_PACKAGES += libvp8dec_sa.ca7
PRODUCT_PACKAGES += libvp8enc_sa.ca7
PRODUCT_PACKAGES += libvp9dec_sa.ca7

#Audio
PRODUCT_PACKAGES += libblisrc
PRODUCT_PACKAGES += libspeech_enh_lib
PRODUCT_PACKAGES += libaudiocustparam
PRODUCT_PACKAGES += audio.primary.mt6735m
PRODUCT_PACKAGES += libaudiocompensationfilter
PRODUCT_PACKAGES += libmsbc_mtk
PRODUCT_PACKAGES += libaudiocomponentengine
PRODUCT_PACKAGES += libblisrc32
PRODUCT_PACKAGES += libmtklimiter
PRODUCT_PACKAGES += libmtkshifter
PRODUCT_PACKAGES += libtinycompress
PRODUCT_PACKAGES += libaudiodcrflt
PRODUCT_PACKAGES += libtinyxml
PRODUCT_PACKAGES += libfft
PRODUCT_PACKAGES += libmp3dec_mtk
PRODUCT_PACKAGES += libaudiosetting
PRODUCT_PACKAGES += audio.a2dp.default
PRODUCT_PACKAGES += audio.phantom.default
PRODUCT_PACKAGES += audio_phantom.xml

#Camera
PRODUCT_PACKAGES += Camera2
#PRODUCT_PACKAGES += camera.mt6735m
PRODUCT_PACKAGES += libcam_utils
PRODUCT_PACKAGES += libcamera_client_mtk
#PRODUCT_PACKAGES += libcam.utils
#PRODUCT_PACKAGES += libcam.camshot.utils
PRODUCT_PACKAGES += libmtk_mmutils
#PRODUCT_PACKAGES += libmmsdkservice
PRODUCT_PACKAGES += libstlport
#PRODUCT_PACKAGES += libcam.sdkclient
#PRODUCT_PACKAGES += libcam1_utils
#PRODUCT_PACKAGES += libcam.client.camclient.common
#PRODUCT_PACKAGES += libcam3_utils
#PRODUCT_PACKAGES += libcam.camshot.simager
#PRODUCT_PACKAGES += camera.default.module
#PRODUCT_PACKAGES += camera.default.devicemgrbase
#PRODUCT_PACKAGES += libcam.metadata
#PRODUCT_PACKAGES += libcam.metadataprovider
#PRODUCT_PACKAGES += libcam.halsensor
#PRODUCT_PACKAGES += libcameracustom
#PRODUCT_PACKAGES += libcam.utils.common
#PRODUCT_PACKAGES += libcam.exif.common
#PRODUCT_PACKAGES += libcam.exif
#PRODUCT_PACKAGES += libcam_mmp
PRODUCT_PACKAGES += libmtkjpeg
#PRODUCT_PACKAGES += libcamalgo
#PRODUCT_PACKAGES += libcam.paramsmgr.common
#PRODUCT_PACKAGES += libcam.utils.platform
#PRODUCT_PACKAGES += libcam.paramsmgr.feature
PRODUCT_PACKAGES += libmpo
PRODUCT_PACKAGES += libmpoencoder
#PRODUCT_PACKAGES += libcam.client.displayclient
#PRODUCT_PACKAGES += libcam.extimgproc
#PRODUCT_PACKAGES += libcam.device1.common
#PRODUCT_PACKAGES += libcam.device1
#PRODUCT_PACKAGES += libcam3_app
PRODUCT_PACKAGES += libfeatureiodrv
#Algorithms for AE(Auto Exposure), AF(Auto Focus), AWB(Auto White Balance) ==> AAA or 3A
PRODUCT_PACKAGES += lib3a
PRODUCT_PACKAGES += liblsctrans
PRODUCT_PACKAGES += libcam.exif.v3
PRODUCT_PACKAGES += libcam.device3.common.default
PRODUCT_PACKAGES += libcam.device3.common
PRODUCT_PACKAGES += libcam3_hwnode
PRODUCT_PACKAGES += libcam3_pipeline
PRODUCT_PACKAGES += libcam3_pipeline_DefaultPipelineModel
PRODUCT_PACKAGES += libcam.utils.sensorlistener

#nvdata
PRODUCT_PACKAGES += libcustom_nvram
#mmsdk.default.so
PRODUCT_PACKAGES += mmsdk.default


#Prebuilt libs
PRODUCT_PACKAGES += libfdft
PRODUCT_PACKAGES += libutilitysw
PRODUCT_PACKAGES += libautoramasw
PRODUCT_PACKAGES += libmav
PRODUCT_PACKAGES += libmavsw
PRODUCT_PACKAGES += libwarpsw
PRODUCT_PACKAGES += libispfeature
PRODUCT_PACKAGES += libeis
PRODUCT_PACKAGES += libtsfsw
PRODUCT_PACKAGES += libhdr
PRODUCT_PACKAGES += libfacebeauty
PRODUCT_PACKAGES += libasdsw
PRODUCT_PACKAGES += libespboot
PRODUCT_PACKAGES += espinit
PRODUCT_PACKAGES += espboot
PRODUCT_PACKAGES += rild
PRODUCT_PACKAGES += libreference-ril-atcom

PRODUCT_PACKAGES += libwpa_client
#PRODUCT_PACKAGES += MTKLogger
PRODUCT_PACKAGES += rild-prop-md1
PRODUCT_PACKAGES += rild-prop-md2
PRODUCT_PACKAGES += mtkrild
PRODUCT_PACKAGES += libnvram_daemon_callback

#Needed for GPS
PRODUCT_PACKAGES += libepos
PRODUCT_PACKAGES += gps.mt6735
PRODUCT_PACKAGES += mnld
PRODUCT_PACKAGES += mtk_agpsd
PRODUCT_PACKAGES += libcurl

#Bluetoth
PRODUCT_PACKAGES += mtkbt
PRODUCT_PACKAGES += bluetooth.default
PRODUCT_PACKAGES += libcustom_prop
PRODUCT_PACKAGES += libadpcm
PRODUCT_PACKAGES += libbluetoothdrv
PRODUCT_PACKAGES += libpalsecurity
PRODUCT_PACKAGES += libpalwlan_mtk
PRODUCT_PACKAGES += libbluetooth_relayer
PRODUCT_PACKAGES += libbluetooth_mtk

#Sensors
PRODUCT_PACKAGES += sensors.mt6735
PRODUCT_PACKAGES += lights.mt6735

#keystore
PRODUCT_PACKAGES += keystore.mt6735

PRODUCT_PACKAGES += libvold
PRODUCT_PACKAGES += updater
PRODUCT_PACKAGES += curl
PRODUCT_PACKAGES += okhttp
#Wifi
PRODUCT_PACKAGES += \
	wpa_supplicant \
	wpa_supplicant.conf \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    dhcpcd.conf

#HOSTAPD
PRODUCT_PACKAGES += hostapd
PRODUCT_PACKAGES += hostapd_cli
PRODUCT_PACKAGES += nt_password_hash
PRODUCT_PACKAGES += hlr_auc_gw
PRODUCT_PACKAGES += test-milenage
PRODUCT_PACKAGES += hostapd.conf
PRODUCT_PACKAGES += hostapd_default.conf
PRODUCT_PACKAGES += hostapd.deny
PRODUCT_PACKAGES += hostapd.accept


#MGBOX Specific
PRODUCT_PACKAGES += usbswitchd
PRODUCT_PACKAGES += ignitiond
PRODUCT_PACKAGES += JeneService
PRODUCT_PACKAGES += jenelogd
PRODUCT_PACKAGES += GPSimulator
PRODUCT_PACKAGES += datepersistd
PRODUCT_PACKAGES += SquireSettings
PRODUCT_PACKAGES += MGNetworkLocation
PRODUCT_PACKAGES += MGAA
PRODUCT_PACKAGES += MGBox2Dialer CarrierConfig CallLogBackup
PRODUCT_PACKAGES += T9Dialer


#MGBOX Apps & Colmobil apps
PRODUCT_PACKAGES += 99FM
PRODUCT_PACKAGES += 100FM
PRODUCT_PACKAGES += ColmobilPack
PRODUCT_PACKAGES += MFKeyboard
PRODUCT_PACKAGES += MuPdf
PRODUCT_PACKAGES += Nobex
PRODUCT_PACKAGES += SendLocation
PRODUCT_PACKAGES += Waze
PRODUCT_PACKAGES += Whelper
#PRODUCT_PACKAGES += Traffilog
#PRODUCT_PACKAGES += MGCarAppStore
PRODUCT_PACKAGES += NotificationsApp
PRODUCT_PACKAGES += BootUpdater
#PRODUCT_PACKAGES += MGVoice
PRODUCT_PACKAGES += AllFm
PRODUCT_PACKAGES += libui_ext


#BTSTACK bluetooth
PRODUCT_PACKAGES += hfdaemon
PRODUCT_PACKAGES += hfcli

# st480d (magnetometer daemon)
#PRODUCT_PACKAGES += senodiad
# Fan GPIO controlling by cpu temp.
#PRODUCT_PACKAGES += coolingd

#PRODUCT_PACKAGES += DailyroadsDVR

#for testing rs232 (/dev/ttyMT2)
PRODUCT_PACKAGES += picocom

$(call inherit-product, device/cneeds/mgbox4_common/device.mk)
#$(call inherit-product-if-exists, vendor/partner_gms/products/gms-mandatory.mk)


# limit dex2oat threads to improve thermals
PRODUCT_PROPERTY_OVERRIDES += \
    	dalvik.vm.boot-dex2oat-threads=4 \
    	dalvik.vm.dex2oat-threads=3 \
    	dalvik.vm.image-dex2oat-threads=4
 	

#$(call inherit-product-if-exists, vendor/mtk_6735/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)
