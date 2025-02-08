Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force;
$scriptUrl="https://raw.githubusercontent.com/AlbanAndrieu/ansible-windows/master/files/ConfigureRemotingForAnsible.ps1";
$localScriptPath="$env:TEMP\ConfigureRemotingForAnsible.ps1";
Invoke-WebRequest -Uri $scriptUrl -OutFile $localScriptPath -UseBasicParsing;powershell.exe -File $localScriptPath;

$ShoudInstallIIS = $true;

if ($ShoudInstallIIS)
{
    # Install IIS
    import-module servermanager
    add-windowsfeature web-server -includeallsubfeature
    add-windowsfeature Web-Asp-Net45
    add-windowsfeature NET-Framework-Features
}
