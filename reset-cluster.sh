#!/usr/bin/env bash


function check_url {

    for page in {1..60}; do
        sleep 5
        http_code=$(curl -s -o /dev/null -w "%{http_code}" "$1")
        if [ "${http_code}" -eq "$2" ]; then
            echo "$http_code OK"
            break
        else
            echo "waiting master to be ready ... $page : $http_code"
            if [ "$page" -eq "40" ]; then
                exit ${http_code}
            fi
        fi
    done

}

sshpass -p 'hypriot' ssh root@192.168.0.2 'kube-config disable & yes | kube-config delete-data'

sshpass -p 'hypriot' ssh root@192.168.0.3 'kube-config disable & yes | kube-config delete-data' &
sshpass -p 'hypriot' ssh root@192.168.0.5 'kube-config disable & yes | kube-config delete-data' &
sshpass -p 'hypriot' ssh root@192.168.0.6 'kube-config disable & yes | kube-config delete-data' &
sshpass -p 'hypriot' ssh root@192.168.0.8 'kube-config disable & yes | kube-config delete-data' &

echo "--------- Attente de 10 s pour que tous les nodes soient 'clean'"
sleep 10

sshpass -p 'hypriot' ssh root@192.168.0.2 'kube-config enable-master'

check_url "192.168.0.2:8080/api" "200"

sshpass -p 'hypriot' ssh root@192.168.0.3 'kube-config enable-worker 192.168.0.2' &
sshpass -p 'hypriot' ssh root@192.168.0.5 'kube-config enable-worker 192.168.0.2' &
sshpass -p 'hypriot' ssh root@192.168.0.6 'kube-config enable-worker 192.168.0.2' &
sshpass -p 'hypriot' ssh root@192.168.0.8 'kube-config enable-worker 192.168.0.2' &

