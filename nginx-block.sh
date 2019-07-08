#!/bin/bash
NGINX_AVAILABLE='/etc/nginx/sites-available'
NGINX_ENABLED='/etc/nginx/sites-enabled'
echo "-- RUN WITH SUDO PERMISSION --"
echo "What is the local domain?"
read domain
echo "What is the path of application?"
read path
echo "127.0.0.1  $domain" >> /etc/hosts
cat > $NGINX_AVAILABLE/$domain <<EOF
server {
    server_name $domain;
    root $path;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }
}
EOF
sudo ln -s $NGINX_AVAILABLE/$domain $NGINX_ENABLED
sudo service nginx restart
echo "All right!"
