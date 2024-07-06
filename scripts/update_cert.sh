#!/bin/bash

# Run ansible certificate generation playbook
ansible-playbook -i inventory.yml playbooks/update_cert.yml