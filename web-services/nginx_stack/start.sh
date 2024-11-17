#!/bin/bash

# Start the SSH service
service ssh start

# Start NGINX in the background
service nginx start

# Validate NGINX configuration
nginx -t
if [ $? -ne 0 ]; then
    echo "NGINX configuration is invalid!"
    exit 1
fi

# Keep the container running
tail -f /dev/null
