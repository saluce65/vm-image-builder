# Download from Storage
Set-Variable -Name "source" -Value "https://bdsimagebuilder.blob.core.windows.net/powerbuilder"
Set-Variable -Name "filename" -Value "PowerBuilder-2022 R3-3356-EN-MR"
Set-Variable -Name "zipFile" -Value "$filename.zip"
Set-Variable -Name "path" -Value "C:\devbox-customizations\powerbuilder"
New-Item -ItemType Directory -Force -Path $path
Invoke-RestMethod $source/$zipFile -OutFile $path\$zipFile
Expand-Archive -Path $path\$zipFile -DestinationPath $path -Force

# Run installer
$env:AgreeToAppeonLicense='true'
Push-Location -Path $path\$filename
./silentinstall.bat

# Clean up
Pop-Location
Remove-Item -Path $path -Recurse -Force
