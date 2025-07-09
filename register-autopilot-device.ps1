# Set execution policy for this process
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Install WindowsAutopilotIntune module if not already installed
if (-not (Get-Module -ListAvailable -Name WindowsAutopilotIntune)) {
    Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
    Install-Module -Name WindowsAutopilotIntune -Force -Scope CurrentUser
}

# Import the module
Import-Module WindowsAutopilotIntune

# ask for grouptag
$grouptag = Read-Host "Enter the grouptag"


# Register device online (will prompt for Intune admin credentials)
Get-WindowsAutoPilotInfo -Online -grouptag $grouptag

Write-Host "Autopilot hardware hash uploaded to Intune."

# Optional: If you want to register the device with a specific profile

#Run from external source:
# iex ((Invoke-WebRequest -UseBasicParsing "https://contoso.com/Get-WindowsAutopilotInfo.ps1").Content)