# Copyright 2010, The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0

ifneq ($(strip $(BOARD_GPU_DRIVERS)),)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES :=			\
	xf86drm.c			\
	xf86drmHash.c			\
	xf86drmMode.c			\
	xf86drmRandom.c			\
	xf86drmSL.c

LOCAL_C_INCLUDES +=			\
	$(LOCAL_PATH)/include/drm

LOCAL_MODULE := libdrm
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES :=			\
	intel/intel_bufmgr.c		\
	intel/intel_bufmgr_fake.c	\
	intel/intel_bufmgr_gem.c	\
	intel/mm.c

LOCAL_C_INCLUDES +=			\
	$(LOCAL_PATH)/include/drm

LOCAL_CFLAGS += -DHAVE_LIBDRM_ATOMIC_PRIMITIVES=1

LOCAL_MODULE := libdrm_intel
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := libdrm

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES :=			\
	radeon/radeon_bo_gem.c		\
	radeon/radeon_cs_gem.c		\
	radeon/radeon_cs_space.c	\
	radeon/radeon_bo.c		\
	radeon/radeon_cs.c		\
	radeon/bof.c

LOCAL_C_INCLUDES +=			\
	$(LOCAL_PATH)/radeon		\
	$(LOCAL_PATH)/include/drm

LOCAL_CFLAGS += -DHAVE_LIBDRM_ATOMIC_PRIMITIVES=1

LOCAL_MODULE := libdrm_radeon
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := libdrm

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES :=			\
	nouveau/nouveau_device.c	\
	nouveau/nouveau_channel.c	\
	nouveau/nouveau_pushbuf.c	\
	nouveau/nouveau_grobj.c		\
	nouveau/nouveau_notifier.c	\
	nouveau/nouveau_bo.c		\
	nouveau/nouveau_resource.c	\
	nouveau/nouveau_private.h	\
	nouveau/nouveau_reloc.c

LOCAL_C_INCLUDES +=			\
	$(LOCAL_PATH)/include/drm

LOCAL_CFLAGS += -DHAVE_LIBDRM_ATOMIC_PRIMITIVES=1

LOCAL_MODULE := libdrm_nouveau

LOCAL_SHARED_LIBRARIES := libdrm
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

endif
