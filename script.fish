#!/usr/bin/env fish
#
#
# apt yum dnf pacman portage flatpak snap

# Sprawdź, czy użytkownik jest rootem
if not id -u | grep -q 0
    echo "Skrypt musi być uruchomiony jako root!"
    exit
end

# Funkcja do instalowania pakietów
function install_packages
    set package_manager $argv[1]
    set -e packages $argv[2..-1]

    switch $package_manager
        case "apt"
            apt-get update
            apt-get install -y $packages
        case "yum"
            yum update
            yum install -y $packages
        case "pacman"
            pacman -Syu $packages
        case '*'
            echo "Menedżer pakietów nieobsługiwany: $package_manager"
            exit 1
    end
end

# Menedżer pakietów dostępne w skrypcie
set supported_package_managers "apt yum pacman"

# Wybierz menedżer pakietów
echo "Dostępne menedżery pakietów: $supported_package_managers"
read -P "Wybierz menedżer pakietów (apt/yum/pacman): " package_manager

# Sprawdź, czy wybrany menedżer jest obsługiwany
if not contains -- $package_manager $supported_package_managers
    echo "Nieobsługiwany menedżer pakietów: $package_manager"
    exit 1
end

# Wczytaj listę pakietów z pliku (każda linia to nazwa pakietu)
read -P "Podaj ścieżkę do pliku z listą pakietów: " package_list_file

# Sprawdź, czy plik istnieje
if not test -f "$package_list_file"
    echo "Plik nie istnieje: $package_list_file"
    exit 1
end

# Odczytaj listę pakietów z pliku
set packages_to_install (cat "$package_list_file")

# Zainstaluj pakiety
install_packages $package_manager $packages_to_install

# Komunikat po zakończeniu instalacji
echo "Instalacja zakończona."
