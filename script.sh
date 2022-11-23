#!/bin/bash

echo "Criando as imagens....."

docker build -t glauciodrumond/backend:1.0 backend/.
docker build -t glauciodrumond/database:1.0 backend/.

echo "Subindo para o docker hub..."

docker push glauciodrumond/backend:1.0
docker push glauciodrumond/database:1.0

echo "Criando servicos no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando deployment..."

kubectl apply -f ./deployment.yml