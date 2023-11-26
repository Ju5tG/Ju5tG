     #
# Windows PowerShell script for AD DS Deployment
#
Import-Module ADDSDeployment
Install-ADDS Forest -CreateDnsDelegation:$false
-DatabasePath "C:\Windows\NTDS" -DomainMode "WinThreshold"
-DomainName "test.galstontechnology solutions.com" -DomainNetbiosName "TEST"
-ForestMode "WinThreshold"
-InstallDns:$true
-LogPath "C:\Windows\NTDS"
-NoRebootOnCompletion: $false` -SysvolPath "C:\Windows\SYSVOL" -Force: $true