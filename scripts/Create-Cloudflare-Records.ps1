# Convert the JSON string to a PowerShell object
$jsonData = $( terraform output -json )
$data = $jsonData | ConvertFrom-Json
$CloudflareToken = $env:CLOUDFLARE_TOKEN

# Iterate through each key in the JSON object
foreach ($key in $data.PSObject.Properties)
{
    # Check if the current property contains a "value" object with "dns" and "ip"
    if ($key.Value.value)
    {
        $dns = $key.Value.value.sub_domain
        $ip = $key.Value.value.ip
        ./scripts/Create-Cloudflare-A-Record.ps1 `
            -ZoneId "d8bdf4c7860b59eddfd9fcc7bf864b47" `
            -Token $CloudflareToken `
            -SubDomain $dns `
            -IpAddress $ip
    }
}