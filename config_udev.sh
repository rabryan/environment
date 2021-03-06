#!/bin/sh

# get the path of directory containing this file
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

config_rules() {
    echo "Config device plugdev rules"
    echo "Adding device usb ids to plugdev rules"
    sudo cp $SCRIPTPATH/99-uCtools.rules /etc/udev/rules.d/

    #see : https://bugs.launchpad.net/ubuntu/+source/modemmanager/+bug/1827328
    sudo sed 's/--filter-policy=strict/--filter-policy=paranoid/' -i \
        /lib/systemd/system/ModemManager.service

    echo "Ensuring correct permissions are set"
    for GROUP in plugdev dialout; do
        if [ -z $(grep $GROUP /etc/group)  ]; then
            echo "Adding the group $GROUP"
            sudo groupadd $GROUP
        fi
        if [ -z $(grep $GROUP /etc/group | grep $USER) ]; then
            echo "Adding $USER to $GROUP"
            sudo usermod -a -G $GROUP $USER
        fi
    done
    sudo udevadm control --reload-rules
    sudo udevadm trigger
}

config_rules;
