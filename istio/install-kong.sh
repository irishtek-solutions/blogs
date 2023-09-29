#!/bin/bash

kubectl create namespace kong
kubectl label namespace kong istio-injection=enabled
helm repo add kong https://charts.konghq.com
kubectl create secret tls konnect-client-tls -n kong --cert=./tls.crt --key=./tls.key
helm install kong kong/ingress -n kong --values ./values.yaml