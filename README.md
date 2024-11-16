# Ansible Control Node

Gameplay with Ansible control node and multiple managed nodes.

## Related repositories

- https://github.com/kolosovpetro/packer-azure-windows-image
- https://github.com/kolosovpetro/azure-windows-vm-terraform

## Infrastructure

- Control node (SSH key authentication)
- DB server (Password authentication -> then copy id to be executed)
- Web server (Password authentication -> then copy id to be executed)
- Windows DB server (RDP)
- Windows Web server (RDP)

## DNS

- ansible.control.node.razumovsky.me
- ansible.dbserver.razumovsky.me
- ansible.webserver.razumovsky.me
- ansible.win.dbserver.razumovsky.me
- ansible.win.webserver.razumovsky.me

## SSH configuration for Linux managed nodes

From control node execute:

- ssh razumovsky_r@ansible.control.node.razumovsky.me
- ssh-keygen
- ssh-copy-id -i ~/.ssh/id_rsa razumovsky_r@ansible.dbserver.razumovsky.me
- ssh-copy-id -i ~/.ssh/id_rsa razumovsky_r@ansible.webserver.razumovsky.me

## Control node initial configuration (Linux)

- Validate that Python is installed
- Install Ansible (see script `install_ansible.sh`)
- Update Ansible global configuration file `ansible.cfg` by using `cp ansible.cfg /etc/ansible/ansible.cfg`
  from the root of the repository
- Update inventory file `inventory/inventory.yaml` if necessary
- Check connection to managed nodes `ansible-playbook playbooks/ping.yaml`

## SSH connection commands (Linux managed nodes)

- ssh razumovsky_r@ansible.control.node.razumovsky.me
- ssh razumovsky_r@ansible.dbserver.razumovsky.me
- ssh razumovsky_r@ansible.webserver.razumovsky.me

## Ansible for Windows

- https://docs.ansible.com/ansible/latest/os_guide/windows_winrm.html
- https://docs.ansible.com/ansible/latest/os_guide/windows_setup.html
- https://github.com/AlbanAndrieu/ansible-windows/blob/master/files/ConfigureRemotingForAnsible.ps1
- Set-ExecutionPolicy -ExecutionPolicy Bypass
- pip install "pywinrm>=0.3.0"

## Provision infrastructure (Terraform)

- Copy your SSH public key to

## Diagram

![ansible_concept](./img/Ansible_concept.png)

## Links

- https://trello.com/c/HBFIS51g