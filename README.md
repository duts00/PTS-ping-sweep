# ping-sweep.sh — Descoberta de Hosts Ativos (ICMP)

Script Bash para identificar os hosts ativos em uma sub-rede por meio de ICMP (ping). O usuário informa a rede base e o script percorre os endereços de `.1` a `.254`, listando os que respondem. Desenvolvido como exercício de estudo na fase de reconhecimento de redes.

---

## Aviso Legal

Ferramenta educacional, voltada para laboratórios, máquinas próprias ou redes com autorização explícita. A varredura de redes de terceiros sem permissão pode ser ilegal (no Brasil, Lei 12.737/2012 e Marco Civil da Internet). Use de forma ética e responsável.

---

## Objetivo

Descobrir quais hosts de uma rede estão ativos (respondem ao ping). É uma das primeiras etapas de um reconhecimento: mapear o que está "vivo" antes de analisar portas e serviços.

A técnica é o **ping sweep**: envia-se um pacote ICMP Echo Request para cada endereço da rede; quem responde (Echo Reply) está ativo.

---

## Funcionalidades

- Percorre os hosts `.1` a `.254` da rede informada (máscara /24).
- Envia 1 pacote por host, com timeout curto (não trava em endereços sem resposta).
- Lista cada host ativo e exibe o total ao final.

---

## Requisitos

- Linux
- Bash
- `ping` (presente por padrão na maioria das distribuições)

---

## Uso

Dar permissão de execução:

```bash
chmod +x ping-sweep.sh
```

Executar:

```bash
./ping-sweep.sh REDE
```

- `REDE` — parte fixa do endereço (ex.: `192.168.0`); o script itera `.1` a `.254`

### Exemplo

```bash
./ping-sweep.sh 192.168.0
```

### Saída esperada

```
[*] Varrendo a rede 192.168.0.0/24 ...
---------------------------------------------
[+] 192.168.0.1 esta ativo
[+] 192.168.0.10 esta ativo
[+] 192.168.0.105 esta ativo
---------------------------------------------
[ok] Concluido. 3 host(s) ativo(s) em 192.168.0.0/24.
```

---

## Observações Técnicas e Limites

1. **ICMP filtrado** — muitos hosts e firewalls bloqueiam ICMP. Um host que não responde ao ping pode, ainda assim, estar ativo (apenas não responde a ping).
2. **Máscara /24** — assume IPv4 e /24. Para outras máscaras, a lógica de iteração precisa ser adaptada.
3. **Velocidade** — a varredura é sequencial; uma rede inteira leva algum tempo. Paralelizar aceleraria bastante.

---

## Sugestões de Melhoria (exercícios)

- Paralelizar os pings (executar em segundo plano e aguardar), reduzindo muito o tempo total
- Exportar a lista de ativos para arquivo (TXT/CSV)
- Aceitar máscaras diferentes de /24
- Combinar com varredura de portas nos hosts encontrados

---

## Nota Final

Projeto de estudo em reconhecimento de redes e automação em Bash. O objetivo é compreender, na prática, como funciona a descoberta de hosts por ICMP — etapa inicial de um pentest — e, do lado defensivo, por que o monitoramento e a filtragem de ICMP são relevantes.

---

Desenvolvido por duts00 — projeto de estudo em segurança da informação
