#!/bin/bash

# Script Name: gandi_dyndns.sh
# Author: Tony Davis <tony@virtuallytd.com>
# Date: 2019-11-12
# Description: This script gets the external IP of your systems then 
# connects to the Gandi LiveDNS API and updates your 
# dns record with the IP. This is a modified script from the original
# where variables are passed in via docker-compose.yml

# Get external IP address
IP=$(curl -s http://whatismyip.akamai.com/)

# Set the URL for the Gandi LiveDNS API
URL="https://dns.api.gandi.net/api/v5/domains/$DOMAIN/records/$SUBDOMAIN/A"

 # Update the DNS record with the current IP address
curl -X PUT -H "Content-Type: application/json" -H "X-Api-Key: $API_KEY" -d "{\"rrset_values\":[\"$IP\"]}" $URL