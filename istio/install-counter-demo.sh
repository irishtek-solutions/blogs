kubectl create ns counter-demo
kubectl label namespace counter-demo istio-injection=enabled
kubectl apply -f demo-app/demo.yaml 
kubectl apply -f demo-app/demo-v2.yaml 
kubectl apply -f ingress/counter-app-ing.yaml 