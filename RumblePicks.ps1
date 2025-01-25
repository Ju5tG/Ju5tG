$numbers = 1..30
$users = "Curtis", "Carolina", "AJ", "Brandon", "Stephanie", "G"
$assignedNumbers = @{}

foreach ($user in $users) {
    $userNumbers = @()
    while ($userNumbers.Count -lt 5) {
        $number = Get-Random -InputObject $numbers
        if (-not $assignedNumbers.ContainsKey($number)) {
            $userNumbers += $number
            $assignedNumbers[$number] = $user
        }
    }
}

# Create a custom object to store each number and its assigned user
$numberAssignments = $numbers | ForEach-Object {
    [PSCustomObject]@{
        Number = $_
        User = $assignedNumbers[$_] -ne "" ? $assignedNumbers[$_] : "Unassigned"
    }
}

# Format the output as a table
$numberAssignments | Format-Table -AutoSize
