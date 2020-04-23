# Copyright (C) 2010 Amlogic Inc
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

LOCAL_PATH := $(call my-dir)


#----------------------------------------------------------------------
# Compile (L)ittle (K)ernel bootloader and the nandwrite utility
#----------------------------------------------------------------------
#ifneq ($(strip $(TARGET_NO_BOOTLOADER)),true)


include $(LOCAL_PATH)/Bootloader.mk
include $(LOCAL_PATH)/Kernel.mk
#include $(LOCAL_PATH)/rootsystem.mk
#include $(LOCAL_PATH)/selfinstall.mk
#include $(LOCAL_PATH)/updatepackage.mk
