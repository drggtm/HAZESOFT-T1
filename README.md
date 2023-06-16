# HAZESOFT-T1
To run this Dockerfile clone the repo and build an image with your_image_name( command: docker build -t your_image_name) and run the image with docker run command.
You can see the results at http://localhost:9000/site/index.html

## If in case you get nginx 404 error then
 i. Check the file permission of:  /var/www/html where lies your index.html cloned from given repository and give executable permission.
 ii. Go to /etc/nginx/http.d/default.conf and change the contents with your favouriate text editor as 
 
 
 server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location = /404.html {
        internal;
    }
}



# Dockerfile Details
## Base Image
This Docker image is based on the latest version of Alpine Linux.
## Installed Packages
Nginx: The web server used to serve the website.
Git: Required to clone the repository.
## Repository Cloning
Dockerfile clones the repository located at https://github.com/veekrum/task into the /tmp/task directory of your container.
## Website Configuration
The site folder from the cloned repository (/tmp/task/site) is copied to the Nginx document root (/var/www/html) inside the container.
### Exposed Port
Port 9000 is exposed in the Docker image, allowing you to access the Nginx server running inside the container.
