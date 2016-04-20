#!/usr/bin/env bash

kubectl create -f rethinkdb-spark/rethinkdb-admin-svc.yaml
kubectl create -f rethinkdb-spark/rethinkdb-svc.yaml
kubectl create -f rethinkdb-spark/rethinkdb-rc.yaml

read -n1 -r -p "create db 'tododb' and a table 'todo' then press space to continue..."

kubectl create -f rethinkdb-spark/todomvc-svc.yaml
kubectl create -f rethinkdb-spark/todomvc-rc.yaml

