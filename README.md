# Ansible

The place where I test ansible playbooks.

## DNS

- http://ansible-control-node.razumovsky.me
- http://ansible-dbserver.razumovsky.me
- http://ansible-webserver.razumovsky.me
- http://ansible-win-dbserver.razumovsky.me
- http://ansible-win-webserver.razumovsky.me

## Infrastructure provisioning

- Run terraform code (terraform init, plan, apply)
    - Terraform provisions 5 azure virtual machines (1 control node, 2 linux managed nodes, 2 windows managed nodes)
    - Terraform configures WinRM for Windows machines my means of custom script extension and
      `Configure-Ansible-WinRM.ps1` script
    - Terraform installs latest updates, nginx (for tests) and Ansible to Control node using `remote exec` provisioner
    - Terraform installs latest updates, nginx (for tests) to Linux nodes using `remote exec` provisioner
- Configure Cloudflare DNS records using `Configure-CloudflareDnsRecords.ps1` powershell script
- Configure ansible control node (ansible.cfg, inventory files) using `Initialize-Control-Node.ps1` powershell script
- SSH to control node and test connections
    - `ansible linux_servers -m ping`
    - `ansible windows_servers -m win_ping`

## SSH connection commands (Linux managed nodes)

- ssh razumovsky_r@ansible-control-node.razumovsky.me
- ssh razumovsky_r@ansible-dbserver.razumovsky.me
- ssh razumovsky_r@ansible-webserver.razumovsky.me

## Ansible for Windows Docs

- https://docs.ansible.com/ansible/latest/os_guide/windows_winrm.html
- https://docs.ansible.com/ansible/latest/os_guide/windows_setup.html
- https://github.com/AlbanAndrieu/ansible-windows/blob/master/files/ConfigureRemotingForAnsible.ps1
