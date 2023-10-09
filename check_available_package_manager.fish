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
set moja_lista "element1" "element2" "element3"

# Możesz również dodawać nowe elementy do listy
set moja_lista $moja_lista "nowy_element"

# Wyświetlenie zawartości listy
echo $moja_lista

# Dostęp do poszczególnych elementów listy
echo "Pierwszy element: $moja_lista[1]"
echo "Drugi element: $moja_lista[2]"
