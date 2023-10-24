# Linux Package Installer Script

## Spis treści

- [Opis](#opis) 
- [Wymagania](#wymagania)
- [Instalacja](#instalacja)
- [Zmienne globalne](#zmienne-globalne)
- [Funkcje](#funkcje)
- [Jak dodać menedżer pakietów](#jak-dodać-menedżer-pakietów)
- [Jak powinien wyglądać plik packages.txt](#jak-powinien-wyglądać-plik-packages.txt)

## Opis

Skrypt "Linux Package Installer" jest narzędziem do automatycznego instalowania pakietów na systemach Linux. Pozwala użytkownikowi wybrać menedżera pakietów z dostępnych na jego systemie, podać ścieżkę do pliku tekstowego zawierającego listę pakietów, a następnie dokonać instalacji tych pakietów. Skrypt zawiera mechanizmy obsługi błędów i informuje użytkownika o wynikach instalacji.

## Wymagania

- System operacyjny Linux.
- Dostępność przynajmniej jednego menedżera pakietów obsługiwanego przez skrypt (zdefiniowanego w pliku .package_managers.txt).

## Instalacja

Pobierz skrypt na swój system.
Upewnij się, że masz odpowiednie uprawnienia do uruchamiania skryptu. Jeśli nie, możesz nadać odpowiednie uprawnienia za pomocą polecenia chmod.

## Zmienne globalne

package_managers: Lista menedżerów pakietów dostępnych w systemie, odczytywana z pliku .package_managers.txt.

available_managers: Lista menedżerów pakietów dostępnych na bieżącym systemie (wybranych z package_managers).

packages: Lista pakietów do zainstalowania.

user_number: Wybór użytkownika dotyczący menedżera pakietów.

## Funkcje

is_valid_number: Sprawdza, czy argument jest poprawną liczbą.

print_error: Wyświetla komunikat o błędzie.

print_success: Wyświetla komunikat o sukcesie.
    
wellcome_message: Wyświetla wiadomość powitalną.
    
check_is_root: Sprawdza, czy skrypt jest uruchomiony jako root.
    
check_available_package_managers: Sprawdza dostępność menedżerów pakietów na systemie.
    
print_available_package_managers: Wyświetla dostępne menedżery pakietów.
    
select_package_managers: Pozwala użytkownikowi wybrać menedżera pakietów.
    
get_path_to_packages: Pozwala użytkownikowi podać ścieżkę do pliku z listą pakietów.
    
print_loaded_packages: Wyświetla listę pakietów do zainstalowania.
    
install_packages: Instaluje wybrane pakiety i informuje o wynikach.

## Jak dodać menedżer pakietów

### Edycja Pliku .package_managers.txt:
Otwórz plik .package_managers.txt, który znajduje się w katalogu, w którym jest zapisany skrypt. Dodaj nazwę nowego menedżera pakietów do tego pliku, a następnie, oddzielając ją przecinkiem, argumenty które pozwalają zainstalować pakiet bez potwierdzania

## Jak powinien wyglądać plik packages.txt

Plik packages.txt powinien zawierać listę nazw pakietów, które mają być zainstalowane przez skrypt Instalatora Pakietów Linux. Każda nazwa pakietu powinna znajdować się w osobnej linii. Oto przykład prostego pliku 

```
nazwa-pakietu-1
nazwa-pakietu-2
nazwa-pakietu-3
```
