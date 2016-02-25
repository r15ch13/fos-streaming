#!/usr/bin/env bash
exec /sbin/setuser root /usr/sbin/php5-fpm -F 2>&1
