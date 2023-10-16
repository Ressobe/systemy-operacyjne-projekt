#!/usr/bin/env fish
#
#
# apt yum dnf pacman portage flatpak snap

# Sprawdź, czy użytkownik jest rootem
if [ (id -u) -ne 0 ]
    echo -e "\033[31mSkrypt musi być uruchomiony jako root\033[0m"
    exit
end



if command -v apt-get >/dev/null
    echo "Dostępny menedżer pakietów: Apt (Debian/Ubuntu)"
# Sprawdź, czy istnieje DNF (Fedora)
else if command -v dnf >/dev/null
    echo "Dostępny menedżer pakietów: DNF (Fedora)"
# Sprawdź, czy istnieje Pacman (Arch Linux)
else if command -v pacman >/dev/null
    echo "Dostępny menedżer pakietów: Pacman (Arch Linux)"
# Jeśli nie znaleziono menedżera pakietów, wyświetl odpowiedni komunikat
else
    echo "Nie znaleziono znanych menedżerów pakietów."
end







# Funkcja do instalowania pakietów
function install_packages
    set package_manager $argv[1]
    set -l packages $argv[2..-1]

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
set supported_package_managers "pacman" "apt"
set -l packages  "vim" "git"

# Wybierz menedżer pakietów
echo "Dostępne menedżery pakietów: $supported_package_managers"
echo "Wybierz menedżer pakietów (apt/pacman): "
read package_manager


# wypisz liste dostępnych package mangers w twoim systemie

for element in $supported_package_managers
  if test "$element" = "$package_manager"
    install_packages $package_manager $packages
  end
end





# Wczytaj listę pakietów z pliku (każda linia to nazwa pakietu)
# read -P "Podaj ścieżkę do pliku z listą pakietów: " package_list_file
#
# # Sprawdź, czy plik istnieje
# if not test -f "$package_list_file"
#     echo "Plik nie istnieje: $package_list_file"
#     exit 1
# end
#
# # Odczytaj listę pakietów z pliku
# set packages_to_install (cat "$package_list_file")
#
# # Zainstaluj pakiety
# install_packages $package_manager $packages_to_install
#
# # Komunikat po zakończeniu instalacji
# echo "Instalacja zakończona."
