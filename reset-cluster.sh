#!/usr/bin/env bash

sshpass -p 'hypriot' ssh root@192.168.0.2 'kube-config disable & yes | kube-config delete-data' &

sshpass -p 'hypriot' ssh root@192.168.0.3 'kube-config disable & yes | kube-config delete-data' &
sshpass -p 'hypriot' ssh root@192.168.0.5 'kube-config disable & yes | kube-config delete-data' &
sshpass -p 'hypriot' ssh root@192.168.0.6 'kube-config disable & yes | kube-config delete-data' &
sshpass -p 'hypriot' ssh root@192.168.0.8 'kube-config disable & yes | kube-config delete-data' &

echo "--------- Attente de 20 s pour que tous nodes soient 'clean'"
sleep 20

sshpass -p 'hypriot' ssh root@192.168.0.2 'kube-config enable-master'
echo "--------- Attente de 110 s pour que le master soit up'"
sleep 100

sshpass -p 'hypriot' ssh root@192.168.0.3 'kube-config enable-worker 192.168.0.2' &
sshpass -p 'hypriot' ssh root@192.168.0.5 'kube-config enable-worker 192.168.0.2' &
sshpass -p 'hypriot' ssh root@192.168.0.6 'kube-config enable-worker 192.168.0.2' &
sshpass -p 'hypriot' ssh root@192.168.0.8 'kube-config enable-worker 192.168.0.2' &

