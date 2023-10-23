#!/usr/bin/env fish


function is_valid_number
    if math "$argv[1]" >/dev/null 2>&1
        return 0
    else
        return 1
    end
end


function print_error
  echo -e "\033[31mError:\033[0m $argv[1]"
end


function print_sucess
  echo -e "\e[32mSucess:\e[0m $argv[1]"
end


function wellcome_message
  echo -e "\n"
  echo -e "Witaj w instalatorze pakietów linux"
  echo -e "=============================================\n"
end


function check_is_root
  if [ (id -u) -ne 0 ]
      echo -e "\n"
      print_error "skrypt musi być uruchomiony jako root (sudo) \n"
      exit
  end
end


function check_available_package_managers
  set package_managers (cat "./.package_managers.txt")
  set -l elements (string split , $package_managers)

  for index in (seq 1 2 (count $elements))
      set item $elements[$index]
      if command -v $item > /dev/null
        set --append available_managers $item
      end
  end

  if test (count $available_managers) -eq 0
    print_error "Brak menedżerów pakietów na twoim systemie które są wspierane przez ten skrypt"
    exit
  end
end


function print_available_package_managers
  echo -e "Dostępne menedżery pakietów w twoim systemie\n"
  set i 1
  for index in (seq 1 2 (count $available_managers))
      set item $available_managers[$index]
      echo "$i. $item"
      set i (math $i + 1)
  end
end


function select_package_managers
  set list_length (count $available_managers)
  set continue_loop true

  while $continue_loop
    print_available_package_managers

    echo "Podaj numer menedżera pakietów:"
    read -P "> " user_number

    if ! is_valid_number $user_number
        print_error "Niepoprwany numer \n" 
      else
        if test $user_number -gt 0 -a $user_number -le $list_length
            set continue_loop false
          else
            print_error "Niepoprwany numer \n" 
        end
    end

  end
end


function get_path_to_packages
  set continue_loop true

  while $continue_loop
    echo "Podaj ścieżkę do pliku tekstowego z listą pakietów:"
    read -P "> " user_path

    if test -e "$user_path"
        set continue_loop false
    else
        print_error "Ten plik '$user_path' nie istnieje"
    end
  end

  set packages (cat $user_path)
end


function print_loaded_packages
    echo -e "Lista pakietów do zainstalowania: \n"
    for item in $packages
      echo "$item"
    end
end


function install_packages
  echo "Czy chcesz zainstalować te pakiety: (y / n)"
  read -P "> " response

  if test $response = "n"
    exit
  end

  echo "Instalowanie pakietów"
  echo -e "=============================================\n"

  echo "$available_managers[$user_number]"
end


set -g available_managers
set -g packages
set -g user_number


function main
  # 1.Wiadomość powitalna
  wellcome_message

  # 2.Sprawdzamy czy skrypt został uruchumiony jako root
  check_is_root

  # 3.Sprawdzamy jakie menedżery pakietów są dostępne w systemie
  check_available_package_managers

  # 4.Użytkownik wybiera menedżer pakietu który będzie służy do instalacji pakietów
  select_package_managers

  # 5.Użytkownik podaje do pliku gdzie znajdują się nazwy pakietów
  get_path_to_packages

  # 6.Wypisujemy nazwy pakietów które zostanły znalezione w pliku
  print_loaded_packages

  # 7.Instalujemy pakiety
  install_packages
end

main
