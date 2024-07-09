#!/bin/bash
rm -f ips_corretos.txt ips_errados.txt urls.txt

# Run the command to list enabled Apache virtual hosts
# Replace with the appropriate command for your system (e.g., apachectl -S)
apache_command_output=$(apachectl -S)

# Extract URLs from the output (lines containing 'namevhost')
urls=$(echo "$apache_command_output" | grep -oE 'namevhost\s+([^[:space:]]+[a-Z]+)')

# Extract the URLs from the 'namevhost' lines
formatted_urls=$(echo "$urls" | awk '{print $2}')

# Save the URLs to a text file
echo "$formatted_urls" > urls.txt

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
