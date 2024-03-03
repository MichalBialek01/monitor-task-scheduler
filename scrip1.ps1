
# Skrypt PowerShell do pobrania czasów wschodu i zachodu słońca i aktualizacji zadań w Harmonogramie Zadań

$apiUrl = "https://api.sunrise-sunset.org/json?lat=51.1079&lng=17.0385&formatted=0"
$response = Invoke-RestMethod -Uri $apiUrl

$sunrise = [DateTime]::Parse($response.results.sunrise).ToLocalTime().ToString("HH:mm")
$sunset = [DateTime]::Parse($response.results.sunset).ToLocalTime().ToString("HH:mm")

$scriptPath = "C:\Path\To\Your\SecondScript.ps1"

# Aktualizacja lub utworzenie zadania dla wschodu słońca
schtasks /create /tn "UruchomSkryptOWschodzieSłońca" /tr "powershell.exe -ExecutionPolicy Bypass -File '$scriptPath'" /sc once /st $sunrise /f

# Aktualizacja lub utworzenie zadania dla zachodu słońca
schtasks /create /tn "UruchomSkryptOZachodzieSłońca" /tr "powershell.exe -ExecutionPolicy Bypass -File '$scriptPath'" /sc once /st $sunset /f
