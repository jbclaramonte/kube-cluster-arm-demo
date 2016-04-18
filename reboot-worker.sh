#!/usr/bin/env bash

sshpass -p 'hypriot' ssh root@192.168.0.3 'reboot' &
sshpass -p 'hypriot' ssh root@192.168.0.5 'reboot' &
sshpass -p 'hypriot' ssh root@192.168.0.6 'reboot' &
sshpass -p 'hypriot' ssh root@192.168.0.8 'reboot' &

