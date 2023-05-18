#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo systemctl start nginx

# install application dependant Node packages

sudo apt-get install python-software-properties -y

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - # change from version 6 to 12

sudo apt-get install nodejs -y

sudo npm install pm2 -g

# install npm, within the app directory, and run the application

# cd app

# cd app

# npm install

# node app.js

new_file="
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name 192.168.10.100;

        location / {
                proxy_pass http://localhost:3000;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
        }

        location /posts {
                proxy_pass http://localhost:3000/posts;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
    }
}
"
new_file > /etc/nginx/sites-available/default