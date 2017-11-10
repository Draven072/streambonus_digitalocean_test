#!/bin/bash

ansible-playbook 1-digiocean_host_create.yml
cat newhost >> hosts
#ssh-keyscan  $(cat newhost) >> ~/.ssh/known_hosts
#ansible-playbook 2-digiocean_docker_install.yml

#ADDR=$(cat newhost)
#sed -i -e "s/$ADDR//" hosts
#echo -n > newhost
