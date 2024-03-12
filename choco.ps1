Write-Host 'AIB Customization: Starting Choco Install'
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host 'AIB Customization: Installing Postman via Choco'
choco install -y postman

Write-Host 'AIB Customization: Installing GitKraken via Choco'
choco install -y gitkraken

Write-Host 'AIB Customization: Installing VSCode via Choco'
choco install -y vscode
