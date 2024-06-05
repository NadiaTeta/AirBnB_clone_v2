#!/usr/bin/env bash
<<<<<<< HEAD
# Install Nginx if not already installed
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginx

# create folders
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared
#create a fake html file
echo "This is a test" | sudo tee /data/web_static/releases/test/index.html
# create symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# give ownership
sudo chown -hR ubuntu:ubuntu /data/
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx start
=======
#web_static development

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginx
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared
echo "Hello, this is a test HTML file." | sudo tee /data/web_static/releases/test/index.html
sudo rm -rf /data/web_static/current
sudo ln -s /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo sed -i '44i \\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}' /etc/nginx/sites-available/default
sudo service nginx restart
>>>>>>> 8360dec0d94ae8bdbaebfe63908542137f5d48b7
