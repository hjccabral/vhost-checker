#!/bin/bash
rm -f ips_corretos.txt ips_errados.txt urls.txt

# Run the command to list enabled Apache virtual hosts
# Replace with the appropriate command for your system (e.g., apachectl -S)
nginx -T | sed -r -e 's/[ \t]*$//' -e 's/^[ \t]*//' -e 's/^#.*$//' -e 's/[ \t]*#.*$//' -e '/^$/d' | \
sed -e ':a;N;$!ba;s/\([^;\{\}]\)\n/\1 /g' | \
grep -P 'server_name[ \t]' | grep -v '\$' | grep '\.' | \
sed -r -e 's/(\S)[ \t]+(\S)/\1\n\2/g' -e 's/[\t ]//g' -e 's/;//' -e 's/server_name//' | \
sort | uniq | xargs -L1 >> urls.txt

echo "Enabled Apache URLs saved to urls.txt"

# Lê as URLs do arquivo (assumindo que você já gerou o arquivo 'enabled_apache_urls.txt')


while read -r url; do
    # Extrai o nome do host da URL
#    hostname=$(echo "$url" | awk -F/ '{print $3}')

    # Obtém o endereço IP usando resolução DNS (nslookup)
    ip_address=$(dig +short $url)

    # Verifica se o endereço IP corresponde a 200.19.215.61
    if [ "$ip_address" == "200.19.215.61" ]; then
        echo $url >> ips_corretos.txt
    else
        echo $url >> ips_errados.txt
    fi
done < urls.txt
