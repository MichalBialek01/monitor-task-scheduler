# MonitorTaskScheduler
External monitor auto changing brightness on sunrise and sunset

Problem: Windows nie umożliwia bezpośrednio manipulacji jasnością/nasyceniem na zewnętrznym monitorze, co powoduje, że nie można ustawić automatycznego przyciemnienia podczas określonego czasu.
Zadanie: Napisanie programu od Task Schedulera (harmonogram zadań), który na podstawie API (np. ze strony sunrise-sunset.org, ex. https://api.sunrise-sunset.org/json?lat=51.1079&lng=17.0385), będzie pobierał czas zachodu i wschodu słońca i o danej godzinie będzie zmieniał jasność ekranu.

Wykorzystane technologie/podpowiedzi:
PowerShell i System.Net.WebClient - Napisanie skryptu powershel z WebClientem do pobierania godziny
Task task scheduler - Podczas uruchamiania systemu operacyjnego wywołuje się skrypt, który pobiera dane o godzinie sunrise i sunset i ustawia akcje przyćmienia monitora 
Monitorian - https://github.com/emoacht/Monitorian - aplikacja która umożliwia zmianę jasności drugiego monitora (analiza jak wykonuje się identyfikację i operację na drugim monitorze)
Protokół DDC/CI 
VESA Monitor Control Command Set Standard MCCS 


Opis działania programu:
Podczas uruchamiania systemu, wykonuje się zadanie z Task schedulera, w którym w pierwszej kolejności sprawdza się, czy zewnętrzny monitor jest podłączony.
Jeżeli jest to następnie pobiera się czas sunrise i sunset, i następnie ustawia się akcję, zmiany jasności monitora.
