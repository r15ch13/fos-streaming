#!/usr/bin/env bash
exec /sbin/setuser root /usr/sbin/nginx -g 'daemon off;' 2>&1
