[CmdletBinding()]
param (
    [Parameter()]
    [object]
    $Adapter = (Get-NetConnectionProfile | Where-Object IPv4Connectivity -eq 'Internet')
)

if ($Adapter.NetworkCategory -ne 'Private') {
    try {
        $Adapter | Set-NetConnectionProfile -NetworkCategory 'Private' -ErrorAction Stop
        $Ansible.Changed = $true
    }
    catch {
        $Ansible.Changed = $false
        Throw
    }
}
else {
    $Ansible.Changed = $false
}