$monitors = Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams

if ($monitors.Count -gt 1) {
    $lat = "51.1079"
    $lng = "17.0385"
    $url = "https://api.sunrise-sunset.org/json?lat=$lat&lng=$lng&formatted=0"
    
    $response = Invoke-RestMethod -Uri $url
    $sunrise = [datetime]::Parse($response.results.sunrise).ToLocalTime()
    $sunset = [datetime]::Parse($response.results.sunset).ToLocalTime()

    $current_time = Get-Date

    if ($current_time -ge $sunset -or $current_time -lt $sunrise) {
        $brightness = 30  # przyciemnić monitor
    } else {
        $brightness = 100 # ustawić normalną jasność
    }

    & "C:\Path\To\Monitorian.exe" /Set 1 $brightness
}
