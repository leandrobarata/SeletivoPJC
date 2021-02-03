
## Atualizar o S.O. \

sudo apt-get update \
 \

## Instalar docker \

# instalar depedencias conforme site do fabricante do software (https://docs.docker.com/engine/install/debian/) \

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

\ 
# adicionar GPG key

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \

\
# Adicionar repositorio do docker no kali linux \

sudo nano /etc/apt/sources.list.d/docker.list \ 

deb [arch=amd64] https://download.docker.com/linux/debian buster stable \

\ 
# Atualizar o S.O e Novo Repositorio do docker \
 
sudo apt update \


# Instalar o docker \

sudo apt install docker-ce docker-ce-cli containerd.io \





# Criar usuario para execucao do docker e adicionar ao grupo docker \

sudo usermod -aG docker $USER \

newgrp docker \

\
## Instalar o Docker compose conforme documentação oficial do software \


sudo wget https://github.com/docker/compose/releases/download/1.28.0-rc2/docker-compose-Linux-x86_64 \

chmod +x docker-compose-Linux-x86_64 \

sudo mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose \



systemctl enable docker \



###\
\
ip link add mac0 link eth0 type macvlan mode bridge \
ip addr add 192.168.1.254/24 dev mac0 \
ifconfig mac0 up \

#### \
\
sudo ip link add mac0 link eth0 type ipvlan mode l3
sudo ip addr add 192.168.1.254/24 dev mac0
sudo ifconfig mac0 up



##Comandos mais utilizados
\
docker-compose up -d

docker-compose down

docker system prune -a

docker ps

docker exec -it CONTAINERID /bin/sh




