#!/usr/bin/env fish


function check_is_root
  if [ (id -u) -ne 0 ]
      echo -e "\033[31mSkrypt musi być uruchomiony jako root\033[0m"
      exit
  end
end


function install_packages
    set package_manager $argv[1]
    set -l packages $argv[2..-1]

    "package-manager" "install-command" "packages"
end


function main
  set package_managers (cat "./package_managers.txt")
  set available_managers
  set -l elements (string split , $package_managers)


  for index in (seq 1 2 (count $elements))
      set item $elements[$index]
      if command -v $item > /dev/null
        set --append available_managers $item
      end
  end
end



for element in $supported_package_managers
  if test "$element" = "$package_manager"
    install_packages $package_manager $packages
  end
end
