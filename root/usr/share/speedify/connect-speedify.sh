#!/usr/bin/with-contenv bash

cd /usr/share/speedify
echo 'Connecting VPN'
connection_status=$(./speedify_cli connect)
while [[ "$connection_status" == *"error"* ]]; do
    echo 'Error connecting, trying again in 2 seconds'
    sleep 2s
    connection_status=$(./speedify_cli connect)
done
echo 'VPN Connected'