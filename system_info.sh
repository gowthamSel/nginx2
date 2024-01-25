
while true; do
    # Capture host system information
    HOST_CPU_INFO=$(lscpu)
    HOST_DATE_INFO=$(date)
    HOST_DISK_INFO=$(df -h)

    # Create an HTML file with captured host information
    cat <<EOF > /usr/share/nginx/html/index.html
    <!DOCTYPE html>
    <html>
    <head>
        <title>Host System Information</title>
    </head>
    <body>
        <h3>Host System Information</h3>
        <pre>
        Host CPU Information:
        $HOST_CPU_INFO

        Host Date and Time:
        $HOST_DATE_INFO

        Host Disk Space:
        $HOST_DISK_INFO
        </pre>
    </body>
    </html>
EOF

    # Restart Nginx to apply changes
    # systemctl restart nginx

    # Wait for 1 second before the next iteration
    sleep 1
done
