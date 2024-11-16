# Ansible Control Node

Gameplay with Ansible control node and multiple managed nodes.

## Infrastructure

- Control node (SSH key authentication)
- DB server (Password authentication -> then copy id to be executed)
- Web server (Password authentication -> then copy id to be executed)

## DNS

- ansible.control.node.razumovsky.me
- ansible.dbserver.razumovsky.me
- ansible.webserver.razumovsky.me

## SSH configuration for managed nodes

From control node execute:

- ssh-keygen
- ssh-copy-id -i ~/.ssh/id_rsa razumovsky_r@ansible.dbserver.razumovsky.me
- ssh-copy-id -i ~/.ssh/id_rsa razumovsky_r@ansible.webserver.razumovsky.me

## SSH connection commands

- ssh razumovsky_r@ansible.control.node.razumovsky.me
- ssh razumovsky_r@ansible.dbserver.razumovsky.me
- ssh razumovsky_r@ansible.webserver.razumovsky.me

## Provision infrastructure (Terraform)

- Copy your SSH public key to 

## Diagram

![ansible_concept](./img/Ansible_concept.png)

## Links

- https://trello.com/c/HBFIS51g