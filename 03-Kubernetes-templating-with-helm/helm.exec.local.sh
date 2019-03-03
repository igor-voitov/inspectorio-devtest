helm del $(helm ls --all --short) --purge
helm install aws-checker --name aws-checker --wait
kubectl get svc load-balancer