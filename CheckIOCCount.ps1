$iocs = @('e6ca06e9b000933567a8604300094a85', 'e62584c9cd15c3fa2b6ed0f3a34688ab', 'f5315fb4a654087d30c69c768d80f826', '6d989302166ba1709d66f90066c2fd59', '4bc6cab128f623f34bb97194da21d7b6', '494e65cf21ad559fccf3dacdd69acc94', 'a5965b750997dbecec61358d41ac93c7', '4e84b1448cf96fabe88c623b222057c4')
$files = Get-ChildItem -Path "C:\Users\crava\Downloads\hashes\ICMP Critical System Hashes" -Filter "*.txt"
$hash = @{}
foreach ($file in $files) {
    $content = Get-Content $file.FullName
    $count = 0
    foreach ($ioc in $iocs) {
        $count += ($content | Select-String -Pattern $ioc -AllMatches).Matches.Count
    }
    $hash[$file.Name] = $count
}
$sorted = $hash.GetEnumerator() | Sort-Object -Property Value -Descending
$top_file = $sorted[0].Name
$top_count = $sorted[0].Value
Write-Host "File with the most IOCs: $top_file ($top_count IOCs)"
