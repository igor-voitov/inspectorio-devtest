helm del $(helm ls --all --short) --purge
helm install aws-checker --name aws-checker --wait
kubectl get svc load-balancer

image: devtest01registry01.azurecr.io/swagger_server:latest
image: igorvoitov/swagger_server:latest