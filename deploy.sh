#!/bin/bash
#! WARNING: THIS HOST CAN ONLY BE RUN ON UNIX-COMPATIBLE DEVICES. PLEASE DO NOT TRY TO RUN THIS ON WINDOWS OR I'LL BE SAD :(

git pull origin main

if ! [ -f inventory.yml ]; then
    ansible-playbook playbooks/init_env.yml
fi

ansible-playbook -i inventory.yml playbooks/init_services.yml
ansible-playbook -i inventory.yml playbooks/deploy.yml