#!bin/bash

if [ -d "/home/frappe/frappe-bench/apps/frappe" ]; then
echo "Bench already exists, skipping init"
cd frappe-bench
bench start
else
echo "Creating new bench..."
fi

bench init --skip-redis-config-generation frappe-bench --version version-15

cd frappe-bench

# Use containers instead of localhost
bench set-mariadb-host 34.93.2.23
bench set-redis-cache-host redis:6379
bench set-redis-queue-host redis:6379
bench set-redis-socketio-host redis:6379

# Remove redis, watch from Procfile
sed -i '/redis/d' ./Procfile
sed -i '/watch/d' ./Procfile

bench get-app https://github.com/frappe/helpdesk --branch main

#bench new-site 34.47.161.81 \
#--force \
#--mariadb-root-password 123 \
#--admin-password admin \
#--no-mariadb-socket

bench new-site 34.47.161.81 \
  --force \
  --admin-password Root@admin \
  --db-host 34.93.2.23 \
  --db-name frappeDB \
  --db-root-username root \
  --db-root-password Frappe@Root \
  --no-mariadb-socket


bench --site 34.47.161.81 install-app helpdesk
bench --site 34.47.161.81 set-config developer_mode 1
bench --site 34.47.161.81 set-config mute_emails 1
bench --site 34.47.161.81 set-config server_script_enabled 1
bench --site 34.47.161.81 clear-cache
bench use 34.47.161.81

bench start