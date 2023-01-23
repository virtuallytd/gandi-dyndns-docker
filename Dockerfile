FROM alpine:latest
COPY gandi_dyndns.sh /
RUN apk add --no-cache curl
RUN chmod +x /gandi_dyndns.sh
CMD echo "0 * * * * API_KEY=$API_KEY DOMAIN=$DOMAIN SUBDOMAIN=$SUBDOMAIN /bin/sh /gandi_dyndns.sh" >> /etc/crontabs/root && crond -f
