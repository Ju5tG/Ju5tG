#AD Group you want to iterate through
Get-ADGroupMember -Identity "Domain Users" | Get-ADUser -Properties * | Select-Object Description, Enabled, DistinguishedName, SamAccountName, @{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}}, Manager | Format-Table
#Pipes output to Get-ADUser with all properties available
#Select which objects you want to output, @{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}} is a calculated value for LastLogonDate 
