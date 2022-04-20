pnputil.exe /a "C:\temp\Brother5430D\BROHLA8A.INF"
try { Add-PrinterDriver -Name 'Brother HL-5340D series' -ErrorAction Stop }
catch { Add-PrinterDriver -Name 'Brother HL-5340D series' -ErrorAction Stop  -InfPath 'C:\temp\Brother5430D\BROHLA8A.INF' }

Add-Printer -Name '\\http://pi4:631\Brother_HL-5340D_series' -PortName 'http://pi4:631/printers/Brother_HL-5340D_series' -DriverName 'Brother HL-5340D series' 
Get-Service spool* | Restart-Service
