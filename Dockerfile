FROM alpine:latest
COPY gandi_dyndns.sh /
RUN chmod +x /gandi_dyndns.sh
CMD echo "0 * * * * API_KEY=$API_KEY DOMAIN=$DOMAIN SUBDOMAIN=$SUBDOMAIN /gandi_dyndns.sh" >> /etc/crontabs/root && crond -f