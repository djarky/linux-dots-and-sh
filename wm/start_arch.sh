#!/bin/bash
#konsole -e bash -c "python3 battery_sender.py 192.168.122.111; exec bash" &
cd /home/arky/DevS/battery_vm/
python3 battery_sender.py 192.168.122.54 &
virsh start cachy
GDK_BACKEND=x11 virt-manager --connect qemu:///system --show-domain-console cachy

deactivate



