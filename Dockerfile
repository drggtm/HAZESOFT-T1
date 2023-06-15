# Use the alpine linux image
FROM alpine:latest

# Install nginx
RUN apk update && apk add --no-cache nginx

# Clone the repository
RUN apk add --no-cache git && \
    git clone https://github.com/veekrum/task /tmp/task

# Copy the site folder to nginx document root
RUN cp -r /tmp/task/site /var/www/html

# Expose port 9000
EXPOSE 9000

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

