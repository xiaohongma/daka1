LOCAL_PATH := $(call my-dir)
export MAINDIR:= $(LOCAL_PATH)
include $(CLEAR_VARS)


#include $(MAINDIR)/bundler/Android.mk
#export MAINDIR:= $(LOCAL_PATH)
#include $(CLEAR_VARS)
include $(MAINDIR)/bundler/Android.mk \
         $(MAINDIR)/sift/Android.mk \
         $(MAINDIR)/jhead/Android.mk
#include $(call all-subdir-makefiles)
