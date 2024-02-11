#!/bin/bash

if ! [ -f inventory.yml ]; then
    ansible-playbook playbooks/init_env.yml
fi

# Run the core app
docker compose -f ./docker-compose.core.yml up -d