# Linux Package Installer Script

## Description

This script is a user-friendly Linux package installer that allows you to select a package manager, provide a file containing a list of packages, and install the selected packages. It also checks for root access, the availability of package managers, and handles errors gracefully.

## Features

- Select a package manager from available options.
- Load a list of packages from a user-specified file.
- Install packages using the chosen package manager.
- Display success and error messages for each package installation.

## Requirements

- Linux operating system.
- Fish shell (the script is written in Fish).

## Usage

1. Ensure you have root access (sudo) as the script requires it.
2. Run the script using the following command:

   ```bash
   ./install_packages.fish
   ```

## Configuration

You can customize the list of supported package managers by editing the `.package_managers.txt` file.

## Feedback and Contributions

Feedback and contributions are welcome. Please create an issue or submit a pull request on GitHub.
