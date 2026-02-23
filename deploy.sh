#!/usr/bin/env bash

set -euo pipefail

SRC="/home/kamiy2743/workspace/root-domain/public/"
DST="/var/www/root-domain/"

NGINX_SRC="/home/kamiy2743/workspace/root-domain/nginx/root-domain.conf"
NGINX_AVAIL="/etc/nginx/sites-available/root-domain.conf"
NGINX_ENABLED="/etc/nginx/sites-enabled/root-domain.conf"

mkdir -p $DST
rsync -av --delete $SRC $DST

install -m 644 $NGINX_SRC $NGINX_AVAIL
ln -sfn $NGINX_AVAIL $NGINX_ENABLED

nginx -t
systemctl restart nginx
