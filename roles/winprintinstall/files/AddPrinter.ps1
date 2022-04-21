$printerDriverName = 'Brother HL-5340D series'
$infPath = 'C:\temp\Brother5430D\BROHLA8A.INF'
$printerName = '\\http://pi4:631\Brother_HL-5340D_series'
$printerPortName = 'http://pi4:631/printers/Brother_HL-5340D_series'

try {
    $printer = Get-Printer -Name $printerName -ErrorAction Stop
}
catch {
    $msg = ('Printer did not exist')
    Throw $msg
}

if ($printer) {
    $Ansible.Changed = $false
}
else {
    pnputil.exe /a $infPath
    try { Add-PrinterDriver -Name $printerDriverName -ErrorAction Stop }
    catch { Add-PrinterDriver -Name $printerDriverName  -ErrorAction Stop  -InfPath $infPath }

    Add-Printer -Name $printerName -PortName $printerPortName -DriverName $printerDriverName
    $Ansible.Changed = $true
}