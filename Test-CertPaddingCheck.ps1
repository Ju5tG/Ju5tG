# Define the registry key path and value name
$regPath = "HKLM:\Software\Microsoft\Cryptography\Wintrust\Config"
$valueName = "EnableCertPaddingCheck"
$regPath2 = "HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config"
$valueName2 = "EnableCertPaddingCheck"

# Check if the registry key exists
if (!(Test-Path $regPath)) {
  # Create the registry key if it doesn't exist
  New-Item -Path $regPath -Force | Out-Null
}

# Check if the registry value exists
if (!(Test-Path "$regPath\$valueName")) {
  # Create the registry value if it doesn't exist
  New-ItemProperty -Path $regPath -Name $valueName -Value 1 -PropertyType String
}

# Output the registry value data
Get-ItemProperty -Path $regPath -Name $valueName

# Check if the registry key exists
if (!(Test-Path $regPath2)) {
  # Create the registry key if it doesn't exist
  New-Item -Path $regPath2 -Force | Out-Null
}

# Check if the registry value exists
if (!(Test-Path "$regPath2\$valueName")) {
  # Create the registry value if it doesn't exist
  New-ItemProperty -Path $regPath2 -Name $valueName2 -Value 1 -PropertyType String
}

# Output the registry value data
Get-ItemProperty -Path $regPath2 -Name $valueName2