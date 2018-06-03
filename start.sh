#!/usr/bin/env bash
set -e
htpasswd -bc /etc/squid/passwords spotifyuser "$SQUID_PASSWORD" > /dev/null
/usr/libexec/squid/cache_swap.sh
ln -sf /dev/stdout /var/log/squid/access.log
exec /usr/sbin/squid -N -f /etc/squid/squid.conf
