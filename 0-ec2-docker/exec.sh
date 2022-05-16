#!/bin/bash

cd terraform/
terraform init
terraform apply -auto-approve

echo "Aguardando máquina ..."
sleep 20  # espera um pouco

ANSIBLE_RETORNO=$(terraform output)
DNS=(${ANSIBLE_RETORNO//=/ })
DNS=${DNS[1]}
DNS=$(echo $DNS | sed -e "s/\"//g")

# DNS=$(terraform output public_dns) # Rafa mais reduzido

cd ../ansible

echo "
[docker]
$DNS
" > hosts

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /Users/danilo/Desktop/desafio_devops/chaves_desafio_kubernetes/id_rsa

ssh -i /Users/danilo/Desktop/desafio_devops/chaves_desafio_kubernetes/id_rsa ubuntu@$DNS -o ServerAliveInterval=60