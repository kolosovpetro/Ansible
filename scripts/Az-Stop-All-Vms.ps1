# Login to Azure (if not already logged in)
Connect-AzAccount

# Define the resource group name
$resourceGroupName = "rg-ansible-d01"

# Get all virtual machines in the specified resource group
$vmList = Get-AzVM -ResourceGroupName $resourceGroupName

# Stop each virtual machine
foreach ($vm in $vmList) {
    Write-Host "Stopping VM: $($vm.Name)" -ForegroundColor Yellow
    Stop-AzVM -ResourceGroupName $resourceGroupName -Name $vm.Name -Force
    Write-Host "Stopped VM: $($vm.Name)" -ForegroundColor Green
}

Write-Host "All virtual machines in resource group '$resourceGroupName' have been stopped." -ForegroundColor Cyan
