$Path = "HKLM:SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces"

$Interfaces = Get-ChildItem $Path | Select-Object -ExpandProperty PSChildName

foreach($Interface in $Interfaces) {
    $NetBiosCheck = Get-ItemProperty -path "$Path\$Interface" -Name "NetbiosOptions"
    if ($NetBiosCheck.NetbiosOptions -ne 2) {
        $Detect = $true
    }ELSE{
        $Detect = $false
    }
}

if ($Detect) {
    Write-Warning "Not Compliant"
    Exit 1
} else {
    Write-Output "Compliant"
    Exit 0
}