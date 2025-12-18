#!/bin/bash

# Cores
YELLOW="\e[33m"
CYAN="\e[36m"
NC="\e[0m"

if [ -z "$1" ]; then
  echo "Uso: $0 <dominio|url>"
  echo "Ex.:  $0 businesscorp.com.br"
  exit 1
fi

ALVO="$1"

if [[ "$ALVO" =~ ^https?:// ]]; then
  URL="$ALVO"
  DOMINIO=$(echo "$ALVO" | sed -E 's#https?://##; s#/.*##; s/:.*##')
else
  URL="http://$ALVO"
  DOMINIO="$ALVO"
fi

echo -e "${YELLOW}###############################################${NC}"
echo -e "${CYAN}|-> Buscando Hosts...BY NX <-|${NC}"
echo -e "${YELLOW}###############################################${NC}"

HTML=$(wget -qO- "$URL")

echo "$HTML" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]+' | sort -u

DOM_ESCAPADO=$(echo "$DOMINIO" | sed 's/\./\\./g')
HOSTS=$(echo "$HTML" | grep -Eo "([a-zA-Z0-9-]+\.)+${DOM_ESCAPADO}" | sort -u)

echo "$HOSTS"

echo -e "${YELLOW}###############################################${NC}"
echo -e "${CYAN}|-> Resolvendo Hosts... <-|${NC}"
echo -e "${YELLOW}###############################################${NC}"

for h in $HOSTS; do
  host "$h" | grep "has address"
done
