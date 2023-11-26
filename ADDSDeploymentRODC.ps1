 #
# Windows PowerShell script for AD DS Deployment
#
Import-Module ADDSDeployment
Install-ADDSDomainController
-AllowPassword ReplicationAccountName @("TEST\Allowed RODC Password Replication Group")
-NoGlobalCatalog:$false
-Credential (Get-Credential) *
-CriticalReplicationOnly: $false
-DatabasePath "C:\Windows\NTDS"
-DenyPassword ReplicationAccountName @("BUILTIN\Administrators", "BUILTIN\Server Operators", "BUILTIN\Backup Operators", "BUILTIN\Account Operators", "TEST\Denied RODC Password Replication Group")
-DomainName "test.galstontechnology solutions.com"
-InstallDns:$true
-LogPath "C:\Windows\NTDS" " -NoRebootOnCompletion:$false ReadOnlyReplica:$true"
-SiteName "Default-First-Site-Name" -SysvolPath "C:\Windows\SYSVOL" -Force: $true