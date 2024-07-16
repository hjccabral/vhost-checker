#!/bin/bash

# Função para executar o script01.sh
executar_check_url_httpd() {
  echo "Executando httpd.sh..."
  bash httpd.sh
}

# Função para executar o script01.sh
executar_verify_urls_httpd() {
  echo "Executando verify_urls.sh..."
  webserver="httpd"
  bash verify_urls.sh "$webserver"
}

# Função para executar o script01.sh
executar_check_url_nginx() {
  echo "Executando nginx.sh..."
  bash nginx.sh 
}

# Função para executar o script01.sh
executar_verify_urls_nginx() {
  echo "Executando verify_urls.sh..."
  webserver="nginx"
  bash verify_urls.sh "$webserver"
}

# Chamada das funções
executar_check_url_httpd
executar_verify_urls_httpd
executar_check_url_nginx
executar_verify_urls_nginx
