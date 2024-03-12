New-Item -Path 'C:\build-artifacts' -ItemType Directory
Set-Location -Path 'C:\build-artifacts'
Write-Host "AIB Customization: Install WinGet"
$progressPreference = 'silentlyContinue' # Suppress progress bar
Write-Host "AIB Customization: Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.7.3/Microsoft.UI.Xaml.2.7.x64.appx -OutFile Microsoft.UI.Xaml.2.7.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.7.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
########################################################################################




$latestWingetMsixBundleUri = $(Invoke-RestMethod https://api.github.com/repos/microsoft/winget-cli/releases/latest).assets.browser_download_url | Where-Object {$_.EndsWith(".msixbundle")}
$latestWingetMsixBundle = $latestWingetMsixBundleUri.Split("/")[-1]
Write-Host 'AIB Customization: Downloading winget to artifacts directory...'
write-host $latestWingetMsixBundleUri
write-host $latestWingetMsixBundle
Invoke-WebRequest -Uri $latestWingetMsixBundleUri -OutFile './$latestWingetMsixBundle'
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Write-Host 'AIB Customization: Installing VCLibs'
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Write-Host 'AIB Customization: Installing Msix Bunder'
Add-AppxPackage $latestWingetMsixBundle
