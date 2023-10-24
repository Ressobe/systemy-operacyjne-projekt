# Linux Package Installer Script

## Overview

The Linux Package Installer Script is a simple utility for installing packages on Linux systems. It allows users to select a package manager, specify a list of packages from a file, and perform installations seamlessly.

**Features**:

- **Dynamic Package Manager Selection**: Choose your preferred package manager from a list of available options, ensuring compatibility with your system.
- **Package List Input**: Import a list of packages to install from a text file, making it easy to manage and update your installations.
- **Error Handling**: The script provides clear error messages and continues installation for non-fatal errors, so you always know what's happening.
- **Root Access Check**: It checks whether you're running the script with root access (sudo) as some package managers require it for installations.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Running the Script](#running-the-script)
- [Configuration](#configuration)
- [Feedback and Contributions](#feedback-and-contributions)

## Getting Started

### Prerequisites

- A Linux-based operating system.
- The Fish shell (Fish shell should be installed on your system).

### Installation

1. Clone the repository to your local machine or download the script.

   ```bash
   git clone https://github.com/yourusername/linux-package-installer.git
   ```

2. Navigate to the script's directory.

   ```bash
   cd linux-package-installer
   ```

3. Make the script executable.

   ```bash
   chmod +x install_packages.fish
   ```

### Usage

Running the Script

1. Open your terminal.

2. Navigate to the directory where the script is located.

3. Run the script using the following command:

    ```bash
     ./run.fish
    ```

4. Follow the on-screen instructions to:

    Select a package manager.
    Provide the path to a text file containing a list of packages.
    Confirm whether to install the listed packages.

5.The script will initiate package installations and provide feedback on each installation.

## Configuration

You can customize the list of supported package managers by editing the `.package_managers.txt` file.

## Feedback and Contributions

Feedback and contributions are welcome. Please create an issue or submit a pull request on GitHub.
