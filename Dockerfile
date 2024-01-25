# Use the official nginx image as a base
FROM nginx:latest
RUN apt-get update && apt-get install -y cron
COPY system_info.sh /usr/share/nginx/html/system_info.sh
COPY crontab.txt /etc/cron.d/crontab.txt
RUN chmod +x /usr/share/nginx/html/system_info.sh 
RUN  chmod 0644 /etc/cron.d/crontab.txt
RUN crontab /etc/cron.d/crontab.txt && touch /var/log/cron.log
EXPOSE 80
# RUN /usr/share/nginx/html/system_info.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# ENTRYPOINT ["/bin/bash", "-c", "/usr/share/nginx/html/system_info.sh && nginx -g 'daemon off;'"]
# ENTRYPOINT ["/bin/bash", "-c", "nginx -g 'daemon off;' && /usr/share/nginx/html/system_info.sh"]

ENTRYPOINT ["/entrypoint.sh"]
