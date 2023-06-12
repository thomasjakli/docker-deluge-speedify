#!/usr/bin/with-contenv bash

cd /usr/share/speedify

echo "Connecting Speedify"

bash ./connect-speedify.sh

echo 'Waiting on speedify'
while sleep 60; do
  speedify_status=$(./speedify_cli state)
  
  if [[ "$speedify_status" != *"CONNECTED"* ]]; then
    echo "Speedify has disconnected, reconnecting."
    exit 1
  else
    echo "Speedify still CONNECTED"
    echo 'Waiting on speedify'
  fi
done
echo 'Speedify is dead'