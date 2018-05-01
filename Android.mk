#ifeq ($(call my-dir),$(call project-path-for,qcom-audio))

#ifneq ($(filter mpq8092 msm8960 msm8226 msm8x26 msm8610 msm8974 msm8x74 apq8084 msm8916 msm8994 msm8992 msm8909 msm8996 msm8952 msm8937 thorium msm8953 msmgold msm8998 sdm660 sdm845 apq8098_latv,$(TARGET_BOARD_PLATFORM)),)

QCOM_AUDIO_ROOT := $(call my-dir)

ifeq ($(BOARD_USES_LEGACY_ALSA_AUDIO),true)
include $(QCOM_AUDIO_ROOT)/legacy/Android.mk
else
ifneq ($(filter mpq8092,$(TARGET_BOARD_PLATFORM)),)
include $(QCOM_AUDIO_ROOT)/hal_mpq/Android.mk
else
include $(QCOM_AUDIO_ROOT)/hal/Android.mk
endif
include $(QCOM_AUDIO_ROOT)/voice_processing/Android.mk
include $(QCOM_AUDIO_ROOT)/mm-audio/Android.mk
include $(QCOM_AUDIO_ROOT)/policy_hal/Android.mk
include $(QCOM_AUDIO_ROOT)/visualizer/Android.mk
include $(QCOM_AUDIO_ROOT)/post_proc/Android.mk
include $(QCOM_AUDIO_ROOT)/qahw_api/Android.mk
endif

ifeq ($(USE_LEGACY_AUDIO_DAEMON), true)
include $(QCOM_AUDIO_ROOT)/audiod/Android.mk
endif

#endif

#endif
