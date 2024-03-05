#!/bin/bash

if ! [ -f inventory.yml ]; then
    ansible-playbook playbooks/init_env.yml --extra-vars "domain=localhost cloudflare_api_token='NOT NEEDED'"
fi

ansible-playbook playbooks/init_services.yml -i inventory.yml
ansible-playbook playbooks/start_dev.yml -i inventory.yml