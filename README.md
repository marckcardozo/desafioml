# Repositório do desafio prosposto - ML

## Pasta APP contém os arquivos da aplicação do tipo  API, métodos GET/POST;

## Pasta iac_ml contém as receitas terraform para provisionamento da infraestrutura na AWS:

    - VPC
    - 2 subnetes públicas e duas privadas
    - 1 Gateway de internet e um NAT Gateway, além das rotas necessárias;
    - ALB
    - Cluster EKS com um node;
    - TGs.

## A pasta "k8s" contém os manifestos kubernetes para o deploy da aplicação em seu respectivo ambente;

## A pasta "kong" contém o arquivo docker-compose para implantação da stack do Kong;
