#!/usr/bin/env fish

# echo "Podaj pierwszy string: "
# read -l string1
#
# echo "Podaj drugi string: "
# read -l string2
#
# if test "$string1" = "$string2"
#     echo "Stringi są takie same"
# else
#     echo "Stringi są różne"
# end

# Deklaruj i zainicjuj listę stringów
# set moja_lista "element1" "element2" "element3"
#
# # Możesz również dodawać nowe elementy do listy
# set moja_lista $moja_lista "nowy_element"
#
# # Wyświetlenie zawartości listy
# echo $moja_lista
#
# # Dostęp do poszczególnych elementów listy
# echo "Pierwszy element: $moja_lista[1]"
# echo "Drugi element: $moja_lista[2]"

# function install_packages
#     set package_manager $argv[1]
#     set -l packages $argv[2..-1]
#
#     echo $package_manager
#
#     for item in $packages
#       echo $item
#     end
# end
#
# set -l packages "vim" "git"  # Przypisujemy listę do zmiennej packages
# set package_manager "pacman"
# install_packages $package_manager $packages


# function get_current_user
#     set current_user (whoami)
#     return $current_user
# end
#
# # Wywołanie funkcji i przypisanie wyniku do zmiennej
# set user (get_current_user)
# echo "Aktualny użytkownik: $user"


function get_available_package_manager
    # Lista menedżerów pakietów do sprawdzenia
    set package_managers "apt" "yum" "yay" "pacman"

    # Zmienna do przechowania dostępnego menedżera
    set available_manager ""

    # Pętla sprawdzająca dostępność menedżerów
    for manager in $package_managers
        if command -v $manager > /dev/null
            set available_manager $manager
            break
        end
    end

    if not test -z $available_manager
        echo $available_manager
    else
        echo "Brak dostępnego menedżera pakietów"
    end
end

# Wywołanie funkcji i przypisanie wyniku do zmiennej
set package_manager (get_available_package_manager)

# Wyświetlenie wyniku
echo "Dostępny menedżer pakietów: $package_manager"


