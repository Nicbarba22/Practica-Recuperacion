#!/bin/bash


# Actualizar los repositorios e instalar el servidor web nginx
sudo apt-get update -y
sudo apt-get install -y nginx

# Configuracion de Nginx como balanceador de carga
cat <<EOF > /etc/nginx/sites-available/default
upstream backend_servers {
    server 192.168.10.30;
    server 192.168.10.31;
}

server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://backend_servers;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}

EOF

# Reiniciar nginx para aplicar cambios
sudo systemctl restart nginx
