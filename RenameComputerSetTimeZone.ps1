tzutil /s "Central Standard time"
$vm = Get-WmiObject -Class Win32_ComputerSystem
if ($vm.Model -match "Virtual") {
    $vmName = Read-Host "Enter the name of the Hyper-V VM"
    Rename-Computer -NewName $vmName -Restart
    } else {
    Write-Output "This machine is hosted on physical hardware."
}
