# MonitorTaskScheduler
External monitor auto changing brightness on sunrise and sunset

Problem: Windows nie umożliwia bezpośrednio manipulacji jasnością/nasyceniem na zewnętrznym monitorze, co powoduje, że nie można ustawić automatycznego przyciemnienia podczas określonego czasu.
Rozwiązanie: Napisanie programu od Task Schedulera (harmonogram zadań), który na podstawie API (np. ze strony sunrise-sunset.org, ex. https://api.sunrise-sunset.org/json?lat=51.1079&lng=17.0385), będzie pobierał czas zachodu i wschodu słońca i o danej godzinie będzie zmieniał jasność ekranu.

Instrukcja konfiguracji skryptu
Tworzenie zadania:

1.Otwórz Task Scheduler i kliknij "Create Basic Task".
2.Nazwij zadanie (np. "Adjust Monitor Brightness").
3.Ustaw wyzwalacz na "At startup" i dodaj dodatkowy wyzwalacz "Daily" aby uruchamiał się co 15 minut (Advanced settings -> Repeat task every 15 minutes).
4.Wybierz "Start a Program" jako akcję.
5.W polu "Program/script" wpisz powershell.exe.
6.W polu "Add arguments" wpisz pełną ścieżkę do skryptu PowerShell, np. -File "C:\MonitorScheduler\YourScript.ps1".
7.Konfiguracja uruchamiania wraz z systemem:
-Upewnij się, że w zakładce "Conditions" nie jest zaznaczone "Start the task only if the computer is on AC power".
-W zakładce "Settings" zaznacz "Allow task to be run on demand" oraz "Run task as soon as possible after a scheduled start is missed".