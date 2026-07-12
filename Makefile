
PWD=$(shell pwd)
AAP_JUCE_DIR=$(PWD)/external/aap-juce

# Specify the app name. It will show up as the Main Launcher.
APP_NAME=ZLEqualizer

APP_BUILD_DIR=$(PWD)
# Specify the app repo as a submodule
APP_SRC_DIR=$(PWD)/external/ZLEqualizer
# Typical JUCE app submodules JUCE, but the location is up to the project.
JUCE_DIR=$(APP_SRC_DIR)/JUCE

#APP_ICON=$(APP_SRC_DIR)/assets/logo.svg

APP_SHARED_CODE_LIBS="$(APP_NAME)_artefacts/lib$(APP_NAME)_SharedCode.a"

# It can be any name, just make sure you generate the diff for AAP support,
# otherwise it will only build for Android without AAP.
# Make sure to include submodule changes (by e.g. git diff --submodule=diff)
PATCH_FILE=$(PWD)/aap-juce-support.patch
PATCH_DEPTH=1

# JUCE patches if any
AAP_JUCE_CMAKE_SKIP_DEFAULT_PATCHES=1
JUCE_PATCHES= \
        $(AAP_JUCE_DIR)/juce-patches/8.0.12/export-jni-symbols.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/support-plugin-ui.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/juce-component-peer-view-touch.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/embedded-peer-window-guard.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/popup-menu-android.patch \
        $(AAP_JUCE_DIR)/juce-patches/8.0.12/standalone-aap-factory-weak-fallback.patch


JUCE_PATCH_DEPTH=1

include $(AAP_JUCE_DIR)/Makefile.cmake-common
