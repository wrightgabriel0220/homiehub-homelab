#!/bin/bash

if ! [ -f inventory.yml ]; then
    ansible-playbook playbooks/init_env.yml --extra-vars "domain=localhost cloudflare_api_token='NOT NEEDED'"
fi

# Run the core app
ansible-playbook playbooks/start_dev.yml -i inventory.yml