param(
    [string]$ZoneId = "d8bdf4c7860b59eddfd9fcc7bf864b47",
    [string]$Token,
    [string]$Domain = "razumovsky.me",
    [string]$SubDomain = "test.pwsh",
    [string]$IpAddress = "198.51.100.4"
)

$uri = "https://api.cloudflare.com/client/v4/zones/$ZoneId/dns_records"
$AuthorizationHeader = "Authorization: Bearer $Token"
$Json = @"
{
  "comment": "Domain verification record",
  "name": "$SubDomain.$Domain",
  "proxied": false,
  "settings": {},
  "tags": [],
  "content": "$IpAddress",
  "type": "A"
}
"@

curl --request POST `
  --url $uri `
  --header "Content-Type: application/json" `
  --header "$AuthorizationHeader" `
  --data $Json


# call: ./Create-Cloudflare-A-Record.ps1 -Token "your_token"