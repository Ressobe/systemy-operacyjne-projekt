#!/usr/bin/env fish


# Function to check if an argument is a valid number
function is_valid_number
    if math "$argv[1]" >/dev/null 2>&1
        return 0
    else
        return 1
    end
end


# Function to print error messages
function print_error
  echo -e "\033[31mError:\033[0m $argv[1]"
end


# Function to print success messages
function print_sucess
  echo -e "\e[32mSucess:\e[0m $argv[1]"
end


# Function to display a welcome message
function wellcome_message
  echo -e "\n"
  echo -e "Witaj w instalatorze pakietów linux"
  echo -e "=============================================\n"
end


# Function to check if the script is run as root
function check_is_root
  if [ (id -u) -ne 0 ]
      echo -e "\n"
      print_error "skrypt musi być uruchomiony jako root (sudo) \n"
      exit
  end
end


# Function to check available package managers in the system
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


# Function to print available package managers
function print_available_package_managers
  echo -e "Dostępne menedżery pakietów w twoim systemie:"
  set i 1
  for item in $available_managers
      echo "$i. $item"
      set i (math $i + 1)
  end
  echo -e "\n"
end


# Function to select a package manager
function select_package_managers
  set list_length (count $available_managers)
  set continue_loop true

  while $continue_loop
    print_available_package_managers

    echo "Podaj numer menedżera pakietów:"
    read -P "> " user_number

    clear
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


# Function to get the path to the file with a list of packages
function get_path_to_packages
  set continue_loop true

  while $continue_loop
    echo "Podaj ścieżkę do pliku tekstowego z listą pakietów:"
    read -P "> " user_path

    clear
    if test -e "$user_path"
        set continue_loop false
    else
        print_error "Ten plik '$user_path' nie istnieje\n"
    end
  end

  set packages (cat $user_path)
end


# Function to print the list of loaded packages
function print_loaded_packages
    echo -e "Lista pakietów do zainstalowania:"
    for item in $packages
      echo "$item"
    end
    echo -e "\n"
end


# Function to install packages
function install_packages
  echo "Czy chcesz zainstalować te pakiety: (y / n)"
  read -P "> " response

  if test $response = "n"
    exit
  end

  clear
  echo "Instalowanie pakietów"
  echo -e "=============================================\n"

  set manager $available_managers[$user_number]
  set -l elements (string split , $package_managers)

  set package_index -1

  for index in (seq 1 2 (count $elements))
      set item $elements[$index]
      if test "$item" = "$manager"
        set package_index $index
      end
  end

  set flags $elements[(math $package_index + 1)]

  set errors 0
  for item in $packages
    echo "Instalacja pakietu: $item ..."
    eval "$manager $flags $item" > /dev/null 2>&1

    if test $status -eq 0
      print_sucess "Pakiet $item został zainstalowany \n"
    else
      print_error "Pakiet $item nie został zainstalowany \n"
      set errors (math $errors + 1)
    end
  end

  if test $errors -eq 0
    print_sucess "Wszystkie pakiety zostały zainstalowane"
  else
    print_error "Ilość pakietów które nie zostały zainstalowane: $errors"
  end
end


# Global variables
set -g package_managers
set -g available_managers
set -g packages
set -g user_number


# Main function
function main
  # 1. Welcome message
  wellcome_message

  # 2. Check if the script is run as root
  check_is_root

  # 3. Check available package managers in the system
  check_available_package_managers

  # 4. User selects the package manager to be used for package installation
  select_package_managers

  # 5. User provides the path to the file containing package names
  get_path_to_packages

  # 6. Print the names of packages found in the file
  print_loaded_packages

  # 7. Install the packages
  install_packages
end


clear
main
