#!/bin/bash

ansible-playbook 1-digiocean_host_create.yml
cat newhost >> hosts
sleep 20

ansible-playbook 2-digiocean_docker-ce_install.yml
sleep 10

ansible-playbook 3-digiocean_dockers.yml
sleep 10

ansible-playbook 4-digiocean_add_sudouser.yml

#ADDR=$(cat newhost)
#sed -i -e 's/$ADDR//' hosts
#sed -i '/./,/^$/!d' hosts
echo -n > newhost
echo '[digitalocean]
localhost ansible_connection=local ansible_python_interpreter=python
[dockerhost]' > hosts

echo "Deployment is finished"
