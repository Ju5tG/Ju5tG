$vm = Get-WmiObject -Class Win32_ComputerSystem
if ($vm.Model -match "Virtual") {
    $vmName = Read-Host "Enter the name of the Hyper-V VM"
    Rename-Computer -NewName $vmName -Restart
    tzutil /s "Central Standard time"
} else {
    Write-Output "This machine is hosted on physical hardware."
}