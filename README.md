# AUMK: Automatic USB Mounter for Klipper

## Problem
When using a Klipper 3D printer, manually mounting a USB drive to print files from it can be a cumbersome process, requiring user intervention every time.

## Solution
AUMK automates the USB mounting process to the Klipper `printer_data/gcodes` folder by utilizing udev rules. This ensures that the USB drive is automatically mounted when plugged in.

## Installation
Ensure that you have the `make` and `git` utility installed on your system. If it's not already installed, use your package manager to install it.

- Clone the AUMK repository:
    ```bash
    git clone https://github.com/chinifabio/aumk.git
    cd aumk
    ```
- Run the installation script:
    ```bash
    sudo make install
    ```
- Reload udev rules for the changes to take effect:
    ```bash
    sudo udevadm control --reload-rules
    ```
- If you use moonraker as your Klipper host, you can use the `update_manager` to update the repo automatically by adding to the `moonraker.conf` file the following lines:
    ```ini
    [update_manager aumk]
    type: git_repo
    path: ~/aumk
    origin: https://github.com/chinifabio/aumk.git
    install_script: install.sh
    managed_service: aumk
    ```
## Customization
To customize the parent directory where the USB will be mounted run the following command
```bash
echo "CUSTOM_PARENT_PATH=<custom path>" | sudo tee /etc/default/automount

```
## Uninstallation
- To uninstall AUMK and revert changes, run the following command:
    ```bash
    sudo make uninstall
    ```
