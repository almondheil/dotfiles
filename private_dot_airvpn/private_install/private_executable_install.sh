#!/bin/bash

copy_scripts=( up.sh down.sh )

for script in "${copy_scripts[@]}"; do
	cp ./$script /etc/openvpn
	chmod +x /etc/openvpn/$script
done
