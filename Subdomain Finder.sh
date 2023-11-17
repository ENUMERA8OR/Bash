#!/bin/bash

echo "Enter domain"
read domain

for subdomain in $(cat subdomains.txt); do
  host $subdomain.$domain | grep "has address" | cut -d " " -f4
done
