#!/bin/bash

# Função para executar o script01.sh
executar_check_url_httpd() {
  echo "Executando httpd.sh..."
  bash modules/httpd.sh
}

# Função para executar o script01.sh
executar_verify_urls_httpd() {
  echo "Executando urls.sh with variable httpd..."
  webserver="httpd"
  bash modules/urls.sh "$webserver"
}

# Função para executar o script01.sh
executar_check_url_nginx() {
  echo "Executando nginx.sh with variable nginx..."
  bash modules/nginx.sh 
}

# Função para executar o script01.sh
executar_verify_urls_nginx() {
  echo "Executando urls.sh..."
  webserver="nginx"
  bash modules/urls.sh "$webserver"
}

# Chamada das funções
executar_check_url_httpd
executar_verify_urls_httpd
executar_check_url_nginx
executar_verify_urls_nginx
