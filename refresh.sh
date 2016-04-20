#!/usr/bin/env bash

kubectl delete svc todomvc > /dev/null
kubectl create -f rethinkdb-spark/todomvc-svc.yaml > /dev/null

