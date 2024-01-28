$numbers = 1..30
$users = "Curtis", "Heather", "AJ", "Brandon", "Stephanie", "G"
$assignedNumbers = @{}

foreach ($user in $users) {
    $userNumbers = @()
    while ($userNumbers.Count -lt 5) {
        $number = Get-Random -InputObject $numbers
        if (-not $assignedNumbers.ContainsKey($number)) {
            $userNumbers += $number
            $assignedNumbers[$number] = $true
        }
    }
    Write-Host "$user $($userNumbers -join ', ')"
}
