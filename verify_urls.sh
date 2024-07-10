# Nome do arquivo txt com as URLs
webserver=$1
arquivo_urls="urls.txt"

# Verificando se o arquivo foi passado como argumento
if [ ! -z "$arquivo_urls" ]; then
  echo "Erro: Arquivo urls.txt inexistente."
  exit 1
fi

# Obtendo o IP local
ip_local=$(hostname -I)

# Criando arquivos de destino (se não existirem)
touch urls_corretas.txt urls_erradas.txt

# Contadores para URLs
contador_total=0
contador_corretas=0
contador_erradas=0

# Verificando cada URL no arquivo
while IFS= read -r url; do
  # Obtendo o IP de destino
  ip_destino=$(dig +short $url @${ip_local})

  # Comparando os IPs
  if [ "$ip_local" = "$ip_destino" ]; then
    # URL aponta para o IP local
    echo "$url" >> urls_corretas_$webserver.txt
    contador_corretas=$((contador_corretas + 1))
  else
    # URL não aponta para o IP local
    echo "$url" >> urls_erradas_$webserver.txt
    contador_erradas=$((contador_erradas + 1))
  fi

  # Incrementando contador total
  contador_total=$((contador_total + 1))
done < "$arquivo_urls"

# Mensagem de finalização
echo "Verificação concluída!"
echo "Total de URLs: $contador_total"
echo "URLs corretas (salvas em urls_corretas.txt): $contador_corretas"
echo "URLs erradas (salvas em urls_erradas.txt): $contador_erradas"