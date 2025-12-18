# parsing-html

Script **Bash** para **Linux** que:
- baixa o HTML de um domínio/URL
- extrai hosts encontrados no código-fonte
- resolve DNS dos hosts e mostra os IPs

## Requisitos (Linux)
Este script roda **somente em Linux** (ex.: Kali, Ubuntu, Debian).

Dependências:
- `wget`
- `grep`, `sed`, `sort`
- `host` (vem no pacote `dnsutils`)

Instalação (Debian/Ubuntu/Kali):
```bash
sudo apt update
sudo apt install -y wget dnsutils
