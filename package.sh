#!/bin/bash
[[ -z $1 ]] && echo "please give a name" && exit 1

name="$1"

vagrant destroy
sed -e 's/#config.ssh.insert_key/config.ssh.insert_key/' \
    -i Vagrantfile
vagrant up
vagrant package --output "se-$name-$(date +%Y%m%d).box"
sed -e 's/config.ssh.insert_key/#config.ssh.insert_key/' \
    -i Vagrantfile
