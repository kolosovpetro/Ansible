# Copy the SSH private key to the control node
Write-Output "Starting: Copying the SSH private key to the control node..."
scp "$env:USER_DIRECTORY/.ssh/id_rsa" razumovsky_r@ansible-control-node.razumovsky.me:~/.ssh
if (-not $?)
{
    Write-Output "Error: Failed to copy the SSH private key. Stopping execution."
    exit 1
}
Write-Output "Completed: SSH private key copied to the control node."

# Secure the SSH private key on the control node
Write-Output "Starting: Securing the SSH private key on the control node..."
ssh razumovsky_r@ansible-control-node.razumovsky.me "chmod 600 ~/.ssh/id_rsa"
if (-not $?)
{
    Write-Output "Error: Failed to secure the SSH private key. Stopping execution."
    exit 1
}
Write-Output "Completed: SSH private key secured on the control node."

# Copy the Ansible configuration file to the control node
Write-Output "Starting: Copying the Ansible configuration file to the control node..."
scp "ansible.cfg" razumovsky_r@ansible-control-node.razumovsky.me:~/ansible.cfg
if (-not $?)
{
    Write-Output "Error: Failed to copy the Ansible configuration file. Stopping execution."
    exit 1
}
Write-Output "Completed: Ansible configuration file copied to the control node."

# Move the Ansible configuration file to the correct location
Write-Output "Starting: Moving the Ansible configuration file to /etc/ansible/ on the control node..."
ssh razumovsky_r@ansible-control-node.razumovsky.me "sudo mv ~/ansible.cfg /etc/ansible/ansible.cfg"
if (-not $?)
{
    Write-Output "Error: Failed to move the Ansible configuration file. Stopping execution."
    exit 1
}
Write-Output "Completed: Ansible configuration file moved to /etc/ansible/."

# Copy the inventory file to the control node
Write-Output "Starting: Copying the inventory file to the control node..."
scp "inventory/inventory.ini" razumovsky_r@ansible-control-node.razumovsky.me:~/inventory.ini
ssh razumovsky_r@ansible-control-node.razumovsky.me "sudo mv ~/inventory.ini /etc/ansible"
if (-not $?)
{
    Write-Output "Error: Failed to copy the inventory file. Stopping execution."
    exit 1
}
Write-Output "Completed: Inventory file copied to the control node."
