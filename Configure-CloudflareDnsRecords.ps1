Set-Location -Path $PSScriptRoot

$zoneName = "razumovsky.me"

$newDnsEntriesHashtable = @{ }

$controlNodePublicIp = $(terraform output -raw control_node_linux_ip)
$windowsWebServerPublicIp = $(terraform output -raw web_server_windows_ip)
$windowsDbServerPublicIp = $(terraform output -raw db_server_windows_ip)
$linuxWebServerPublicIp = $(terraform output -raw web_server_linux_ip)
$linuxDbServerPublicIp = $(terraform output -raw db_server_linux_ip)

Write-Host "Gateway public IP: $controlNodePublicIp"

$newDnsEntriesHashtable["ansible-control-node.$zoneName"] = $controlNodePublicIp
$newDnsEntriesHashtable["ansible-dbserver.$zoneName"] = $linuxDbServerPublicIp
$newDnsEntriesHashtable["ansible-win-dbserver.$zoneName"] = $windowsDbServerPublicIp
$newDnsEntriesHashtable["ansible-webserver.$zoneName"] = $linuxWebServerPublicIp
$newDnsEntriesHashtable["ansible-win-webserver.$zoneName"] = $windowsWebServerPublicIp

.\cloudflare\Upsert-CloudflareDnsRecord.ps1 `
    -ApiToken $env:CLOUDFLARE_API_KEY `
    -ZoneName $zoneName `
    -NewDnsEntriesHashtable $newDnsEntriesHashtable
