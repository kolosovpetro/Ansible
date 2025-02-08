# Login to Azure (if not already logged in)
# Connect-AzAccount

# Define the resource group name
$resourceGroupName = "rg-ansible-d01"

# Get all virtual machines in the specified resource group
$vmList = Get-AzVM -ResourceGroupName $resourceGroupName

# Start each virtual machine
foreach ($vm in $vmList) {
    Write-Host "Starting VM: $($vm.Name)" -ForegroundColor Yellow
    Start-AzVM -ResourceGroupName $resourceGroupName -Name $vm.Name
    Write-Host "Started VM: $($vm.Name)" -ForegroundColor Green
}

Write-Host "All virtual machines in resource group '$resourceGroupName' have been started." -ForegroundColor Cyan