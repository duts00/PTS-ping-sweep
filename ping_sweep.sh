#objetivo: 

#cria um script para descobrir o hosts ativos utilizando o ping.

#o usuário deve informar a rede e o script deve retornar os hosts que respondem ao ping. 

# pra dar permissão da automação usamos chmod +x ping.sweep.sh
# pra excutar ./ping.sweep.sh

!/bin/bash
#validando o input do usuário fornecido o ping! 
if ["$1" == ""];     #se o estiver em branco ' '.
then                #então ele irar printar tudo do echo.

    echo"SEGURITY DUTS00 - PING SWEEP"
    echo"modo de uso: $0 REDE"
    echo "EXEMPLO: $0 192.168.0"   #exemplo de class c 192.169.0 que contem de 254 host.

else # se nao sera exibido ação que queremos ! 

# vamos criar a ação 
for host in {1..254};
do 
ping -c $1.$host; | grep "64 bytes" | cut -d " " -f 4 | sed 's/.$//'; #  mais limpo a saida com mais agregação de codigos! 
done
fi

# podemos usar cut, sed, grep...

# podemos deixar o mais limpo a saida com mais agregação de codigos ou apenas deixar (ping -c $1.$host;) ! 

