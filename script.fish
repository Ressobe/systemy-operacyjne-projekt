#!/usr/bin/env fish
#


function wellcome_message
  echo -e "\n"
  echo -e "Witaj w instalatorze pakietów linux"
  echo -e "=============================================\n"
end


function print_error
  echo -e "\033[31mError:\033[0m $argv[1]"
end


function print_sucess
  echo -e "\e[32mSucess:\e[0m $argv[1]"
end


function check_is_root
  if [ (id -u) -ne 0 ]
      echo -e "\n"
      print_error "skrypt musi być uruchomiony jako root (sudo) \n"
      exit
  end
end


function install_packages
    set package_manager $argv[1]
    set -l packages $argv[2..-1]
    # "package-manager" "install-command" "packages"
end


function later



  for element in $supported_package_managers
    if test "$element" = "$package_manager"
      install_packages $package_manager $packages
    end
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


function is_valid_number
    if math "$argv[1]" >/dev/null 2>&1
        return 0
    else
        return 1
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
end


set -g available_managers
set -g user_path


function main
  # check_is_root
  wellcome_message
  check_available_package_managers

  # while loop until user give valid index
  select_package_managers

  # podaj scieżke do pliku z pakietami
  get_path_to_packages


  # Lista pakietów do zainstalowania  
  # Czy chcesz kontynuować? (tak/nie): <tak_lub_nie>
end

main
