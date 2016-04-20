#!/usr/bin/env bash

sshpass -p 'hypriot' ssh root@192.168.0.2 'shutdown now' &
sshpass -p 'hypriot' ssh root@192.168.0.3 'shutdown now' &
sshpass -p 'hypriot' ssh root@192.168.0.5 'shutdown now' &
sshpass -p 'hypriot' ssh root@192.168.0.6 'shutdown now' &
sshpass -p 'hypriot' ssh root@192.168.0.8 'shutdown now' &

