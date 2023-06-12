#!/bin/bash

apt update
apt install -y gpg curl

curl -Sl 'get.speedify.com/pgp.key' | gpg --quiet --dearmor | tee '/usr/share/keyrings/connectify-archive-keyring.gpg'

echo 'deb [signed-by=/usr/share/keyrings/connectify-archive-keyring.gpg] http://apt.connectify.me/ speedify main' | tee '/etc/apt/sources.list.d/connectify.list'

apt update && apt -y install speedify

echo '#!/bin/sh' > /usr/share/speedify/DisableRpFilter.sh
echo 'echo "DisableRpFilter.sh has been cleared for the docker container"' >> /usr/share/speedify/DisableRpFilter.sh

cd /
mkdir debug
touch /debug/log