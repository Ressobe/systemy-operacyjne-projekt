# Linux Package Installer Script

## Spis treści

    - Opis
    - Wymagania
    - Instalacja
    - Jak korzystać
    - Przykłady użycia
    - Opcje i flagi
    - Zmienne globalne
    - Funkcje

## Opis

Skrypt "Linux Package Installer" jest narzędziem do automatycznego instalowania pakietów na systemach Linux. Pozwala użytkownikowi wybrać menedżera pakietów z dostępnych na jego systemie, podać ścieżkę do pliku tekstowego zawierającego listę pakietów, a następnie dokonać instalacji tych pakietów. Skrypt zawiera mechanizmy obsługi błędów i informuje użytkownika o wynikach instalacji.

## Wymagania

    System operacyjny Linux.
    Dostępność przynajmniej jednego menedżera pakietów obsługiwanego przez skrypt (zdefiniowanego w pliku .package_managers.txt).

## Instalacja

    Pobierz skrypt na swój system.
    Upewnij się, że masz odpowiednie uprawnienia do uruchamiania skryptu. Jeśli nie, możesz nadać odpowiednie uprawnienia za pomocą polecenia chmod.

## Jak korzystać

    Uruchom skrypt, używając polecenia ./run.fish w terminalu.
    Postępuj zgodnie z instrukcjami wyświetlanymi przez skrypt.

Przykłady użycia

bash

./nazwa_skryptu.fish

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
