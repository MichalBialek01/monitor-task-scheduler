# Sprawdzanie, czy jest podłączony zewnętrzny monitor
$monitors = Get-WmiObject -Namespace root\wmi -Class WmiMonitorBasicDisplayParams
$externalMonitorConnected = $monitors | Where-Object { $_.Active -eq $true -and $_.InstanceName -notmatch "Laptop_Display" }

if ($externalMonitorConnected) {
        # Tutaj możesz zdefiniować zmienne jasności i kontrastu w zależności od potrzeb
        $brightness = "50" # Przykładowa wartość jasności
        $contrast = "50" # Przykładowa wartość kontrastu

        # Wywołanie Monitorian.exe z argumentami
        $monitorianPath = "$env:LOCALAPPDATA\Microsoft\WindowsApps\Monitorian.exe"
        if (Test-Path $monitorianPath) {
            Start-Process -FilePath $monitorianPath -ArgumentList "/set all $brightness", "/set contrast $contrast"
        } else {
            Write-Host "Monitorian nie został znaleziony w oczekiwanej lokalizacji: $monitorianPath"
        }
    } else {
    Write-Host "Zewnętrzny monitor nie jest podłączony."
}
