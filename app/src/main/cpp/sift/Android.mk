LOCAL_PATH:= $(call my-dir)
SRC_DIR:=src
INCLUDE_DIR:=include

include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(SRC_DIR) $(INCLUDE_DIR)
LOCAL_MODULE    := ezsift
LOCAL_CFLAGS := -O3 -ffast-math -fPIE
LOCAL_SRC_FILES := $(SRC_DIR)/img_io.cpp \
		 $(SRC_DIR)/ezsift.cpp
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= sift
LOCAL_SRC_FILES:=runsift.cpp
LOCAL_C_INCLUDES += $(SRC_DIR) $(INCLUDE_DIR)
LOCAL_CFLAGS := -O3 -ffast-math -fPIE
LOCAL_STATIC_LIBRARIES := ezsift
LOCAL_LDLIBS += -llog -landroid
include $(BUILD_SHARED_LIBRARY)

#LOCAL_PATH := $(call my-dir)

## prebuilt the static libs
#include $(CLEAR_VARS)

#LOCAL_MODULE := presift
#LOCAL_SRC_FILES := libeeezsift.a

#include $(PREBUILT_STATIC_LIBRARY)


## to call the static libs
#include $(CLEAR_VARS)

#LOCAL_MODULE    := sift
#LOCAL_SRC_FILES := runsift.cpp

#LOCAL_STATIC_LIBRARIES += presift
#LOCAL_LDLIBS +=  -llog -ldl

#include $(BUILD_SHARED_LIBRARY)
