#!/usr/bin/with-contenv sh

#
# Take ownership of files and directories under /config.
#

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

log() {
    echo "[cont-init.d] $(basename $0): $*"
}
# Zur Sicherheit das Directory anlegen
mkdir -p /config/xdg/data/kvibes/MediaElch/

# Von home wird immer kopiert!
cp /home/mediaelch/advancedsettings.xml /config/xdg/data/kvibes/MediaElch/advancedsettings.xml
chown $USER_ID:$GROUP_ID /config/xdg/data/kvibes/MediaElch/advancedsettings.xml
# vim:ft=sh:ts=4:sw=4:et:sts=4
