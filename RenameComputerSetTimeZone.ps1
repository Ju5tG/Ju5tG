$vmName = Read-Host "Enter the name of the Hyper-V VM"
Rename-Computer -NewName $vmName -Restart
tzutil /s "Central Standard time"