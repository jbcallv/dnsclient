#!/bin/bash

# google
exec &> >(tee google_udp_out.txt)

echo "Google nameserver udp"

while IFS=, read -r _ domain; do
    # remove carriage return
    domain=${domain//$'\r'/}

    echo -n "i: $domain, o: "
    ../../dnssd -server 8.8.8.8:53 "$domain"
done < top-1m.csv
