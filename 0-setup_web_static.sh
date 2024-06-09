#!/usr/bin/env bash
# Prepare my web servers

# Update package list and install nginx
sudo apt-get update
sudo apt-get -y install nginx

# Directories to be created
directories=("/data/web_static/releases/test" "/data/web_static/shared/")

# Create directories
for directory in "${directories[@]}"; do
  sudo mkdir -p "$directory"
done

# Create a test HTML file
echo "<html>
  <head>
  </head>
  <body>
    <h1>Holberton School</h1>
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

# Create a symbolic link /data/web_static/current linked to /data/web_static/releases/test/ folder
sudo ln --symbolic --force /data/web_static/releases/test /data/web_static/current

# Apply ownership recursively to the /data/ folder
sudo chown -R ubuntu:ubuntu /data/

# Update Nginx configuration to serve the content
sudo sed -i '/listen 80 default_server;/a \\n    location /hbnb_static {\n        alias /data/web_static/current/;\n        index index.html;\n    }' /etc/nginx/sites-available/default

# Restart Nginx to apply changes
sudo service nginx restart

