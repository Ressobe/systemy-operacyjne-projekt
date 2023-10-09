#!/usr/bin/env fish

# Sprawdź, który menedżer pakietów jest obsługiwany
switch (true)
    case test -x /usr/bin/apt-get
        set package_manager "apt"
    case test -x /usr/bin/yum
        set package_manager "yum"
    case test -x /usr/bin/pacman
        set package_manager "pacman"
    case *
        set package_manager "nieznany"
end

echo "Obsługiwany menedżer pakietów: $package_manager"
