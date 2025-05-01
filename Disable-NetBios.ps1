$Path = "HKLM:SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces"

$Interfaces = Get-ChildItem $Path| Select-Object -ExpandProperty PSChildName

foreach($Interface in $Interfaces) {

    Set-ItemProperty -Path "$Path\$Interface" -Name "NetbiosOptions" -Value 2

}