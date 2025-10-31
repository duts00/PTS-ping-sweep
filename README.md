# ping_sweep — Descoberta de hosts ativos (script educacional)

> **Sobre este projeto:** Projeto educativo e experimental criado durante estudos — ideal para laboratórios e redes nas quais você tem autorização para testar. Não utilize em redes de terceiros sem permissão.

## Objetivo

Criar um script Bash simples que identifica hosts ativos em uma sub-rede usando `ping`. O usuário informa a rede base (ex.: `192.168.0`) e o script tenta `ping` em `x.x.x.1` até `x.x.x.254`, listando os IPs que respondem.

---

## Requisitos

* Linux (ou WSL com suporte a ICMP)
* Bash
* Permissão para executar pings na rede alvo

---

## Uso

1. Dê permissão de execução no script:

```bash
chmod +x ping_sweep.sh
```

2. Execute o script com a rede base (parte fixa):

```bash
./ping_sweep.sh 192.168.0
```

* O script itera de `.1` a `.254` e imprime os IPs que responderam ao ping.

---

## Exemplo de saída esperada

```
192.168.0.10
192.168.0.23
192.168.0.101
```

## Boas práticas

* Execute varreduras apenas em redes onde você tem autorização explícita.
* Documente suas ações e mantenha logs quando for realizar testes maiores.

---


---

## Como contribuir

1. Faça um fork do repositório.
2. Crie uma branch para sua melhoria: `git checkout -b feat/minha-melhoria`.
3. Faça commits pequenos e claros descrevendo suas mudanças.
4. Abra um pull request explicando o que foi alterado e por quê.

Se preferir, você também pode abrir uma *issue* para discutir uma ideia antes de implementar.

---

