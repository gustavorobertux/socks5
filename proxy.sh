#!/bin/bash

# Instala o proxychains na maquina do axiom 

apt install proxychains

# Remove o arquivo do proxychains

rm /etc/proxychains.conf 

# Entra no diretorio /etc

cd /etc

# Faz o download de um arquivo limpo do proxychains

wget https://raw.githubusercontent.com/gustavorobertux/socks5/main/proxychains.conf

# Sai do diretorio etc 

cd ~

# Coloca o proxychains em quiet_mode

sed -i 's/#quiet_mode/quiet_mode/g' /etc/proxychains.conf

# Comenta a linha 64 do arquivo do proxychains referente a socks4

sed -i '64s/^/#/' /etc/proxychains.conf

# Cria maquinas com o nome de proxy

axiom-fleet proxy -i 5

# Sobe o servico de proxy

axiom-exec -f "proxy\*" 'docker run -d -p 1080:1080 gustavorobertux/proxy'

# Adiciona os novos proxies ao arquivo do proxychains

axiom-exec -f "proxy\*" 'hostname -I | cut -f1 -d" "' 2>&1 | sed 's/^/socks5 /g;s/$/ 1080 bugbounty MeuPasswordSinistro/g' >> /etc/proxychains.conf

# Testa o IP sem o proxychains

curl ifconfig.me

# Testa o IP com proxychains

proxychains curl ifconfig.me
