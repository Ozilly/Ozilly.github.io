LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_FULL_LIBS_MANIFEST_FILES := $(LOCAL_PATH)/AndroidManifest.xml
LOCAL_MODULE := qti-telephony-common
LOCAL_JAVA_LIBRARIES := telephony-common telephony-ext
LOCAL_SRC_FILES := $(call all-java-files-under,src)
LOCAL_MODULE_TAGS := optional
LOCAL_DEX_PREOPT := false
include $(BUILD_JAVA_LIBRARY) 
