ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BoopBoopBoopPrefs

BoopBoopBoopPrefs_FILES = BOPRootListController.m BOPCustomSwitchCell.m
BoopBoopBoopPrefs_FRAMEWORKS = UIKit
BoopBoopBoopPrefs_PRIVATE_FRAMEWORKS = Preferences
BoopBoopBoopPrefs_INSTALL_PATH = /Library/PreferenceBundles
BoopBoopBoopPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
