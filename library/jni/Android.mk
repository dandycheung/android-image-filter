LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := AndroidImageFilter
LOCAL_SRC_FILES := cn_Ragnarok_NativeFilterFunc.cpp \
					AverageSmoothFilter.cpp \
					GaussianBlurFilter.cpp \
					HDRFilter.cpp \
					SoftGlowFilter.cpp \
					LightFilter.cpp \
					LomoAddBlackRound.cpp \
					NeonFilter.cpp \
					OilFilter.cpp \
					SketchFilter.cpp \
					TvFilter.cpp \
					SharpenFilter.cpp \
					ReliefFilter.cpp \
					PixelateFilter.cpp \
					BlockFilter.cpp \
					GammaCorrectionFilter.cpp \
					MotionBlurFilter.cpp \
					BrightContrastFilter.cpp \
					ColorTranslator.cpp \
					HueSaturationFilter.cpp \
					GothamFilter.cpp

# 添加头文件搜索路径
LOCAL_C_INCLUDES := $(LOCAL_PATH)

# 添加编译标志
LOCAL_CFLAGS := -O2 -DNDEBUG
LOCAL_CPPFLAGS := -std=c++11 -fexceptions -frtti

# 添加必要的库
LOCAL_LDLIBS := -lm -llog -landroid

# 启用 NEON 优化
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon
    LOCAL_ARM_NEON := true
endif

include $(BUILD_SHARED_LIBRARY)
