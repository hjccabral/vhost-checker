# vhost-checker

Script para coletar as URLs dos VirtualHosts do HTTPD e do NGINX e verificar se as URLs estão realmente apontadas para o IP do servidor em questão.

Para chamar o script:

1. Garanta que o HTTPD e/ou o NGINX esteja em execução
2. Chame o script através do comando:

```
check_active_urls.sh
```

A saída do script será:

Arquivo **urls_corretas_nginx.txt** cotendo todas as URLs que estão ativas no NGINX e o IP apontado pra URL é realmente o do servidor em questão.
Arquivo **urls_erradas_nginx.txt** cotendo todas as URLs que estão ativas no NGINX e o IP apontado pra URL NÃO É PARA O SERVIDOR EM QUESTÃO.
Arquivo **urls_corretas_httpd.txt** cotendo todas as URLs que estão ativas no HTTPD e o IP apontado pra URL é realmente o do servidor em questão.
Arquivo **urls_erradas_httpd.txt** cotendo todas as URLs que estão ativas no HTTPD e o IP apontado pra URL NÃO É PARA O SERVIDOR EM QUESTÃO.