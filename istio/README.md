# Kong Konnect Ingress Controller + Istio + Counter App

## Quick Install

1. **Clone this repo:**
2. **Change directory:** cd irishtek-guides/istio/
3. **Install istio:** 
4. **Install Kong:**
5. **Install demo app:**

## Step by step install

### Installation of Istio

1. **Add Istio Chart:** helm repo add istio https://istio-release.storage.googleapis.com/charts
2. **Update Repo:** helm repo update
3. **Create a Namespace:** kubectl create namespace istio-system
4. **Install istio:** helm install istio-base istio/base -n istio-system --set defaultRevision=default
5. **See deployment status:** helm ls -n istio-system

<!--
If using CNI
$ helm install istiod istio/istiod -n istio-system --set values.istio_cni.enabled=true --wait
-->

6. **Install istiod:** helm install istiod istio/istiod -n istio-system --wait
7. **See status of deployment:** helm status istiod -n istio-system
8. **See status of pods:** kubectl get deployments -n istio-system --output wide

### Istall Kiali

1. **Add a repo:** helm repo add kiali https://kiali.org/helm-charts
2. **Update Repo:** helm repo update
3. **Install:**

```
helm install \
  --namespace istio-system \
  --set auth.strategy="anonymous" \
  --repo https://kiali.org/helm-charts \
  kiali-server \
  kiali-server
```

4. **Port forward:** kubectl port-forward svc/kiali 20001:20001 -n istio-system
5. **Install Grafana:** kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.19/samples/addons/prometheus.yaml
6. **Apply Grafana:** kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.19/samples/addons/grafana.yaml

### Installation of KIC

1. **Install KIC:** kubectl create namespace kong
2. **Label namespace:** kubectl label namespace kong istio-injection=enabled
3. **Add repo:** helm repo add kong https://charts.konghq.com
4. **Create a secret and key:** kubectl create secret tls konnect-client-tls -n kong --cert=./tls.crt --key=./tls.key
5. **Install Kong:** helm install kong kong/ingress -n kong --values ./values.yaml
6. **Check to see if its running successfully:** kubectl get po -n kong

```
NAME                               READY   STATUS    RESTARTS      AGE
kong-controller-68fb679cb6-cthmb   2/2     Running   1 (43s ago)   50s
kong-gateway-54d8978d64-xt58v      2/2     Running   0             50s
```

### Deploy sample application

1. Create namespace: kubectl create ns counter-demo
2. Label Namespace: kubectl label namespace counter-demo istio-injection=enabled
3. Install demo app: kubectl apply -f demo-app/demo.yaml 
4. Install demo-app front-end: kubectl apply -f demo-app/demo-v2.yaml 
5. Install demo-app ing: kubectl apply -f ingress/counter-app-ing.yaml 