
## Atualizar o S.O. 

sudo apt-get update 
 

## Instalar docker 

# instalar depedencias conforme site do fabricante do software (https://docs.docker.com/engine/install/debian/) 

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common


# adicionar GPG key

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - 


# Adicionar repositorio do docker no kali linux 

sudo nano /etc/apt/sources.list.d/docker.list 

deb [arch=amd64] https://download.docker.com/linux/debian buster stable 


# Atualizar o S.O e Novo Repositorio do docker 
 
sudo apt update 


# Instalar o docker 

sudo apt install docker-ce docker-ce-cli containerd.io 





# Criar usuario para execucao do docker e adicionar ao grupo docker 

sudo usermod -aG docker $USER 

newgrp docker 


## Instalar o Docker compose conforme documentação oficial do software 


sudo wget https://github.com/docker/compose/releases/download/1.28.0-rc2/docker-compose-Linux-x86_64 

chmod +x docker-compose-Linux-x86_64 

sudo mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose 



systemctl enable docker 


### IP WEB SERVERS

app_1 - 192.168.2.100
app_2 - 192.168.2.200


### IP PROXY REVERSO

VLAN10 - 192.168.1.250

VLAN20 - 192.168.2.250


### IP FIREWALL

VLAN10 - 192.168.1.240

VLAN20 - 192.168.2.240

VLAN30 - 10.1.1.240

VLANWAN - 201.10.151.102


\


##### INICIO PARA RODAR O DOCKER-COMPOSER


### Configurar uma interface docker host para VLAN30

#Nencessário para que o notebook se comunique na vlan 30

sudo ip link add mac0 link eth0.30 type macvlan mode bridge

sudo ip addr add 10.1.1.10/24 dev mac0

sudo ip link set mac0 up 



##### RODAR SCRIPT

Dentro da pasta PJC executar o comando:

docker-compose up -d



##### PONTOS DE ATENÇÃO

Ao final , todos os cantainers estão funcionando , mais após na configuração do arquivo YML na sessão COMMAND: e adicionar os comandos para execução de adcionar rotas padrões os APP_1 e APP_2 e o PROXY não sobem o serviço NGINX (porta 80).

Se for removido a sessão COMMAND , os nginx sobe.

Fiz configurações do firewall para rotear as redes , definindo os gateways nas interfaces pem como suas VLANs. Configurado o IPTABLES para roteamento na ETH3 para saida ip externo proposto 201.10.151.100 simulando a nuvem.

Servidor Zabbix implementação incompleta 



### PROCESSOS PARA  TROUBLESHOOTING


### TESTES PARA PROXY REVERSO > APP_1 e APP_2

sudo ip link add mac0 link eth0.10 type macvlan mode bridge

sudo ip addr add 192.168.1.10/24 dev mac0

sudo ip link set mac0 up 

\

###### COMANDOS MAIS UTILIZADOS:


## DOCKER

docker-compose up -d

docker-compose down

docker system prune -a

docker ps

docker exec -it CONTAINERID /bin/sh


## CRIAR DOCKER IMAGEM PUSH

sudo docker login --username=leandrobarata

sudo docker run --cap-add=NET_ADMIN  -it alpine bin/sh

sudo docker run --name some-zabbix-appliance -p 80:80 -p 10051:10051 -d zabbix/zabbix-appliance

sudo docker pull zabbix/zabbix-appliance

sudo docker tag [IDCONTAINER] leandrobarata/zabbix:1.0

sudo docker push leandrobarata/zabbix:1.0


## GIT

git push origin main

git add .

git commit -m ""

git push origin main




