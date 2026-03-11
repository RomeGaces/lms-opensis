#!/bin/sh
set -e

# remove conflicting MPM modules
rm -f /etc/apache2/mods-enabled/mpm_event.*
rm -f /etc/apache2/mods-enabled/mpm_worker.*

# ensure prefork exists
a2enmod mpm_prefork || true

# start apache
exec apache2-foreground