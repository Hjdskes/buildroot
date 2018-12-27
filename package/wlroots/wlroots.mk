#############################################################
#
# wlroots
#
#############################################################

WLROOTS_VERSION = 0.2
WLROOTS_SOURCE = $(WLROOTS_VERSION).tar.gz
WLROOTS_SITE = https://github.com/swaywm/wlroots/archive
WLROOTS_LICENSE = MIT
WLROOTS_LICENSE_FILES = LICENSE
WLROOTS_DEPENDENCIES = \
	host-pkgconf \
	wayland \
	wayland-protocols \
	libdrm \
	libinput \
	libxkbcommon \
	udev \
	pixman
WLROOTS_INSTALL_STAGING=YES

WLROOTS_CONF_OPTS += -Drootston=false \
		     -Dexamples=false \
		     -Dxcb-errors=disabled \
		     -Dxcb-icccm=disabled \
		     -Dxwayland=disabled \
		     -Dx11-backend=disabled

ifeq ($(BR2_PACKAGE_WLROOTS_LIBCAP),y)
WLROOTS_CONF_OPTS += -Dlibcap=enabled
WLROOTS_DEPENDENCIES += libcap
else
WLROOTS_CONF_OPTS += -Dlibcap=disabled
endif

ifeq ($(BR2_PACKAGE_WLROOTS_LOGIND),y)
WLROOTS_CONF_OPTS += -Dlogind=enabled \
		     -Dlogind-provider=systemd
WLROOTS_DEPENDENCIES += systemd
else
WLROOTS_CONF_OPTS += -Dlogind=disabled
endif

$(eval $(meson-package))
