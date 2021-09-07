Pimox - Proxmox V7 for the Raspberry Pi
===

Pimox is a port of Proxmox to the Raspberry Pi allowing you to build a Proxmox cluster of Rapberry Pi's or even a hybrid cluster of Pis and x86 hardware.

Requirements
---
* Raspberry Pi 4
* Pre-installed Debian __Bullseye__ based 64-bit OS ___(not 32-bit)___ (Works on [DietPi](https://dietpi.com/) too)

Install
---
__Note: The network will be reconfigured as part of the install. You may lose networking if the install does not complete!__
```sh
sudo -s
wget https://raw.githubusercontent.com/ZwCreatePhoton/pimox7/master/RPiOS64fullautoinst.sh
# Modify hostname and network settings (HOSTNAM, RPI4_IP, GATEWAY, NETMASK) in a file editor.
nano RPiOS64fullautoinst.sh
#vi RPiOS64fullautoinst.sh
# If an SSH server other than OpenSSH is running on port 22, it must be disabled prior to the proxmox-ve install command.
# If installing proxmox over SSH, add the command to disable the SSH server into the script.
# The script is configured to disable dropbear (dropbear is DietPi's default SSH server)
cat RPiOS64fullautoinst.sh | sh &
# The system will reboot upon installation completion
# After reboot, you must uninstall the previous SSH server, if applicable.
# sudo apt purge -y dropbear ; sudo reboot
```

Notes
---
1. This repo just contains the precompiled debian packages. The original Proxmox sources can be found at https://git.proxmox.com
2. The (very minimally) patched sources to rebuild this can be found at https://github.com/pimox

