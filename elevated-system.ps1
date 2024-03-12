# Install WinGet


write-host 'AIB Customization: Installing WinGet'
mkdir C:\build-artifacts
Set-Location -Path 'c:\\build-artifacts'
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/microsoft/winget-cli/releases/latest/download/winget-cli.zip' -OutFile '.\\winget-cli.zip'; Expand-Archive -Path '.\\winget-cli.zip' -DestinationPath '.\\winget-cli'; Set-Location -Path '.\\winget-cli'; .\\winget.exe install -e --id Microsoft.DesktopAppInstaller
winget install --id Microsoft.AzureDataStudio -h --accept-source-agreements
