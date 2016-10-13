PRODUCT_BRAND ?= androidx

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/androidx/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/androidx/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Latin IME lib
PRODUCT_COPY_FILES += \
    vendor/androidx/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# DU Utils Library
#PRODUCT_PACKAGES += \
#    org.dirtyunicorns.utils

#PRODUCT_BOOT_JARS += \
#    org.dirtyunicorns.utils

# Additional packages
PRODUCT_PACKAGES += \
    audio_effects.conf \
    Basic \
    Camera \
    Development \
    LatinIME \
    masquerade

# Emoji
PRODUCT_PACKAGES += \
    libemoji

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/androidx/overlay/common

-include vendor/androidx/sepolicy/sepolicy.mk

# Backuptool Support
PRODUCT_COPY_FILES += \
    vendor/androidx/prebuilt/common/addon.d/50-icarus.sh:system/addon.d/50-icarus.sh \
    vendor/androidx/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/androidx/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
