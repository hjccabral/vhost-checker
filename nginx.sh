#!/bin/bash

#Check if httpd is running
ps cax | grep nginx
if [ $? -eq 1 ]
 then
 echo "nginx is not running. Exit!"
 exit 1
fi

rm -f ips_corretos.txt ips_errados.txt urls.txt

# Run the command to list enabled Apache virtual hosts
# Replace with the appropriate command for your system (e.g., apachectl -S)
nginx -T | sed -r -e 's/[ \t]*$//' -e 's/^[ \t]*//' -e 's/^#.*$//' -e 's/[ \t]*#.*$//' -e '/^$/d' | \
sed -e ':a;N;$!ba;s/\([^;\{\}]\)\n/\1 /g' | \
grep -P 'server_name[ \t]' | grep -v '\$' | grep '\.' | \
sed -r -e 's/(\S)[ \t]+(\S)/\1\n\2/g' -e 's/[\t ]//g' -e 's/;//' -e 's/server_name//' | \
sort | uniq | xargs -L1 >> urls.txt

echo "vHosts do NGINX salvas em urls.txt"