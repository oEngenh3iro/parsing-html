# parsing-html

Script **Bash** para **Linux** que:
- baixa o HTML de um domínio/URL
- extrai hosts encontrados no código fonte
- resolve DNS dos hosts e mostra os IPs

## Requisitos (Linux)
Este script roda somente em Linux (ex.: Kali, Ubuntu, Debian).  
Ele usa comandos do sistema: wget, grep, sed, sort e host.

COMO USAR:
chmod +x parsing_html.sh
./parsing_html.sh teste.com.br
