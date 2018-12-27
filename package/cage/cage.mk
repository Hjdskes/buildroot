#############################################################
#
# Cage
#
#############################################################
CAGE_VERSION = f680ee02db5dccebeaa7037ead04d308be9dc412
CAGE_SITE = $(call github,Hjdskes,cage,$(CAGE_VERSION))
CAGE_LICENSE = MIT
CAGE_LICENSE_FILE = LICENSE-MIT

CAGE_DEPENDENCIES = host-pkgconf wlroots wayland-protocols
CAGE_OPTS += --buildtype=release

$(eval $(meson-package))
