#!/bin/bash

# google
exec &> >(tee google_tcp_out.txt)
 
echo "Google nameserver tcp"
 
while IFS=, read -r _ domain; do
    # remove carriage return    
    domain=${domain//$'\r'/}    
                                
    echo -n "i: $domain, o: "   
    ../../dnssd -tcp -server 8.8.8.8:53 "$domain"
done < top-1m.csv

