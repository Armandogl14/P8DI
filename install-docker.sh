#!/bin/bash

# Instalar paquetes necesarios
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Agregar la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio de Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar la lista de paquetes e instalar Docker
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Iniciar el servicio Docker y habilitarlo en el arranque
sudo systemctl start docker
sudo systemctl enable docker

# Agregar el usuario actual al grupo docker
sudo usermod -aG docker $USER

# Aplicar los cambios en el grupo (requiere reinicio de sesión para efecto completo)
newgrp docker

# Verificar la instalación
docker --version
echo "Docker instalado correctamente en Ubuntu EC2"
