#!/bin/bash

#Check if httpd is running
ps cax | grep httpd
if [ $? -eq 1 ]
 then
 echo "httpd is not running. Exit!"
 exit 1
fi

# Save vHosts Apache

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

echo "vHosts do Apache salvas em urls.txt"