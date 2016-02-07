#!/bin/bash

set -m
CONFIG_TEMPLATE="/config/telegraf.conf.template"
CONFIG_FILE="/config/telegraf.conf"

if [ -n "$USERNAME" ]; then
	export USERLINE="username = \"$USERNAME\""
else
	export USERLINE="# username = \"root\""
fi
if [ -n "$PASSWORD" ]; then
	export PASSLINE="password = \"$PASSWORD\""
else
	export PASSLINE="# password = \"root\""
fi

sed -e "s/\${NODE_NAME}/$NODE_NAME/" \
 -e "s/\${INTERVAL}/$INTERVAL/" \
 -e "s!\${HOST}!$HOST!" \
 -e "s/\${PORT}/$PORT/" \
 -e "s/\${DB}/$DB/" \
 -e "s/\# username = \"\"/$USERLINE/" \
 -e "s/\# password = \"\"/$PASSLINE/" \
 $CONFIG_TEMPLATE > $CONFIG_FILE

echo "=> Starting Telegraf ..."

exec /usr/bin/telegraf -config $CONFIG_FILE
