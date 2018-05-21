GLUON_SITE_PACKAGES := \
        gluon-alfred \
        gluon-respondd \
        gluon-autoupdater \
        gluon-config-mode-autoupdater \
        gluon-config-mode-contact-info \
        gluon-config-mode-core \
        gluon-config-mode-geo-location \
        gluon-config-mode-hostname \
        gluon-config-mode-mesh-vpn \
        gluon-ebtables-filter-multicast \
        gluon-ebtables-filter-ra-dhcp \
        gluon-web-admin \
        gluon-web-autoupdater \
        gluon-web-network \
        gluon-web-wifi-config \
        gluon-setup-mode \
        gluon-mesh-batman-adv-15 \
        gluon-mesh-vpn-fastd \
        gluon-radvd \
        gluon_setup_mode \
        gluon_status_page \
        haveged \
        iwinfo

#        gluon-next-node \
        iptables \
        gluon-luci-portconfig \
        gluon-luci-private-wifi \
        gluon-luci-wifi-config \

##  DEFAULT_GLUON_RELEASE
#   version string to use for images
#   gluon relies on
#     opkg compare-versions "$1" '>>' "$2"
#   to decide if a version is newer or not.
DEFAULT_GLUON_RELEASE := $(shell date '+%y.%m').1

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= 0

GLUON_TARGET ?= ar71xx-generic

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= de en
