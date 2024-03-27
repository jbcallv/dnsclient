#!/bin/bash

# cloudflare
exec &> >(tee cloudflare_udp_out.txt)

echo "Cloudflare nameserver udp"

while IFS=, read -r _ domain; do
    # remove carriage return
    domain=${domain//$'\r'/}
    echo -n "i: $domain, o: "

    ../dnssd "$domain"
done < top-1m.csv

# cloudflare with tcp
exec &> >(tee cloudflare_tcp_out.txt)

echo "Cloudflare nameserver tcp"

while IFS=, read -r _ domain; do
    # remove carriage return
    domain=${domain//$'\r'/}

    echo -n "i: $domain, o: "
    ../dnssd -tcp "$domain"
done < top-1m.csv

# ------------------------------

# google
exec &> >(tee google_udp_out.txt)

echo "Google nameserver udp"

while IFS=, read -r _ domain; do
    # remove carriage return
    domain=${domain//$'\r'/}

    echo -n "i: $domain, o: "
    ../dnssd -server 8.8.8.8:53 "$domain"
done < top-1m.csv

# google
exec &> >(tee google_tcp_out.txt)

echo "Google nameserver tcp"

while IFS=, read -r _ domain; do
    # remove carriage return
    domain=${domain//$'\r'/}

    echo -n "i: $domain, o: "
    ../dnssd -tcp -server 8.8.8.8:53 "$domain"
done < top-1m.csv

