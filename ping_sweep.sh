#!/bin/bash
#
# ping-sweep.sh - Descobre hosts ativos em uma rede /24 usando ICMP (ping).
#
# Objetivo: o usuario informa a rede (3 primeiros octetos) e o script percorre
# os hosts de .1 a .254, listando os que respondem ao ping.
#
# Uso:     ./ping-sweep.sh REDE
# Exemplo: ./ping-sweep.sh 192.168.0
#
# Estudo de seguranca - usar apenas em redes proprias ou autorizadas.

set -u

# --- Validacao do argumento ---
if [ -z "${1:-}" ]; then
    echo "_____ DUTS00 SECURITY - PING SWEEP _____"
    echo "Modo de uso: $0 REDE"
    echo "Exemplo:     $0 192.168.0"
    exit 1
fi

REDE="$1"

echo "[*] Varrendo a rede $REDE.0/24 ..."
echo "---------------------------------------------"

ativos=0

for host in {1..254}; do
    alvo="$REDE.$host"
    # -c 1: envia 1 pacote | -W 1: espera no maximo 1s pela resposta
    if ping -c 1 -W 1 "$alvo" >/dev/null 2>&1; then
        echo "[+] $alvo esta ativo"
        ativos=$((ativos + 1))
    fi
done

echo "---------------------------------------------"
echo "[ok] Concluido. $ativos host(s) ativo(s) em $REDE.0/24."
