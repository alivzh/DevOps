#!/bin/bash

SERVICE_NAME="SERVICE_NAME"

while true; do
    # Check if the service is active
    systemctl is-active --quiet "$SERVICE_NAME"

    if [ $? -ne 0 ]; then
        echo "$SERVICE_NAME is not running. Restarting..."
        systemctl restart "$SERVICE_NAME"

        # Wait for a few seconds to allow the service to start
        sleep 5

        # Check if the service is active after restart
        systemctl is-active --quiet "$SERVICE_NAME"
        if [ $? -eq 0 ]; then
            echo "$SERVICE_NAME has been successfully restarted."
        else
            echo "Failed to restart $SERVICE_NAME. Retrying..."
        fi
    else
        echo "$SERVICE_NAME is running normally."
    fi

    # Wait for 30 seconds before checking again
    sleep 30
done