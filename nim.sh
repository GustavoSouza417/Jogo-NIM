#!bin/bash

#variáveis globais
#qtp = quantidade total de palitos
declare qtp;
#mi = quantidade máxima de palitos removidos por rodada
declare ma;

qtp=33;
ma=5;

#função principal
function main(){
  menu;
};

#sessão de funções
function menu(){
  declare local opcao;

  while true; do
    clear;
    echo -e "NIM\n";
    echo "1) Jogar";
    echo "2) Instruções";
    echo "3) Configurações";
    echo "4) Sair";
    echo "";

    read -p "R: " opcao;

    case $opcao in
      1) jogar;;
      2) instrucoes;;
      3) configuracoes;;
      4) exit;;
      *)
         echo "Valor inválido!";
         read -p "Pressione ENTER para tentar novamente...";
      ;;
    esac;
  done;
};





function jogar(){
  declare local totalPalitos;
  declare local vez;

  totalPalitos=$qtp;
  vez=$(sortearPrimeiroJogador);

  while true; do
    clear;

    echo -n "Palitos restantes: $totalPalitos | ";
    exibirPalitos $totalPalitos;
    echo "";

    if [ $vez -eq 0 ]; then
      vezDoPlayer;
      vez=$(( vez + 1  ));
    else
      vezDaCpu;
      vez=$(( vez - 1 ));
    fi;
  done;
};

function sortearPrimeiroJogador(){
  declare local numeroAleatorio;

  random=$(date +%s);
  numeroAleatorio=$(( random % 2 ));
  echo "$numeroAleatorio";
};

function exibirPalitos(){
  declare local i;
  i=0;

  while [ $i -lt $1 ]; do
    echo -n "*";
    i=$(( i + 1  ));
  done;
};

function vezDoPlayer(){
  declare local qtdPalitosRemover;

  if [ $totalPalitos -eq 1 ]; then
    echo -e "\nA CPU venceu!";
    echo "Fim do jogo!";
    sleep 3;
    menu;
  fi;

  echo -e "\n| Vez do Player |";
  read -p "Quantidade a remover: " qtdPalitosRemover;
  echo "";

  if [[ !($qtdPalitosRemover =~ ^[1-$ma]+$) || ($qtdPalitosRemover -gt $ma) ]]; then
    echo "Você deve digitar apenas números inteiros de 1 a $ma";
    read -p "Pressione ENTER para tentar novamente...";
    echo -e "-------------------------------------------------------\n";
    vezDoPlayer;
    return;
  fi;

  if [ $qtdPalitosRemover -gt $((totalPalitos - 1)) ]; then
    echo "Você não pode remover essa quantidade de palitos!";
    read -p "Pressione ENTER para tentar novamente...";
    echo -e "-------------------------------------------------------\n";
    vezDoPlayer;
    return;
  fi;

  totalPalitos=$(( totalPalitos - qtdPalitosRemover ));

  echo "Palitos retirados: $qtdPalitosRemover";
  read -p "Pressione para passar a vez...";
};

function vezDaCpu(){
  declare local qtdPalitosRemover;

  if [ $totalPalitos -eq 1 ]; then
    echo -e "\nO Player venceu!";
    echo "Fim do jogo!";
    sleep 3;
    menu;
  fi;

  echo -e "\n| Vez da CPU |";

  if [ $ma -eq 3 ]; then
    qtdPalitosRemover=$(cpu3);
  elif [ $ma -eq 4 ]; then
    qtdPalitosRemover=$(cpu4);
  else
    qtdPalitosRemover=$(cpu5);
  fi;

  totalPalitos=$(( totalPalitos - qtdPalitosRemover ));

  sleep 1;
  echo "";
  echo "Palitos retirados: $qtdPalitosRemover";
  sleep 2;
};

function cpu3(){
  if [ $totalPalitos -eq 2 ]; then
    echo "1";

  elif [ $totalPalitos -eq 3 ]; then
    echo "2";

  elif [ $totalPalitos -eq 4 ]; then
    echo "3";

  elif [ $totalPalitos -eq 5 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 6 ]; then
    echo "1";

  elif [ $totalPalitos -eq 7 ]; then
    echo "2";

  elif [ $totalPalitos -eq 8 ]; then
    echo "3";

  elif [ $totalPalitos -eq 9 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 10 ]; then
    echo "1";

  elif [ $totalPalitos -eq 11 ]; then
    echo "2";

  elif [ $totalPalitos -eq 12 ]; then
    echo "3";

  elif [ $totalPalitos -eq 13 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 14 ]; then
    echo "1";

  elif [ $totalPalitos -eq 15 ]; then
    echo "2";

  elif [ $totalPalitos -eq 16 ]; then
    echo "3";

  elif [ $totalPalitos -eq 17 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 18 ]; then
    echo "1";

  elif [ $totalPalitos -eq 19 ]; then
    echo "2";

  elif [ $totalPalitos -eq 20 ]; then
    echo "3";

  elif [ $totalPalitos -eq 21 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 22 ]; then
    echo "1";

  elif [ $totalPalitos -eq 23 ]; then
    echo "2";

  elif [ $totalPalitos -eq 24 ]; then
    echo "3";

  elif [ $totalPalitos -eq 25 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 26 ]; then
    echo "1";

  elif [ $totalPalitos -eq 27 ]; then
    echo "2";

  elif [ $totalPalitos -eq 28 ]; then
    echo "3";

  elif [ $totalPalitos -eq 29 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 30 ]; then
    echo "1";

  elif [ $totalPalitos -eq 31 ]; then
    echo "2";

  elif [ $totalPalitos -eq 32 ]; then
    echo "3";

  elif [ $totalPalitos -eq 33 ]; then
    echo "1"; #jogo perdido
  else
    echo "ERRO: há algo de errado no CPU3";
  fi;
};

function cpu4(){
  if [ $totalPalitos -eq 2 ]; then
    echo "1";

  elif [ $totalPalitos -eq 3 ]; then
    echo "2";

  elif [ $totalPalitos -eq 4 ]; then
    echo "3";

  elif [ $totalPalitos -eq 5 ]; then
    echo "4";

  elif [ $totalPalitos -eq 6 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 7 ]; then
    echo "1";

  elif [ $totalPalitos -eq 8 ]; then
    echo "2";

  elif [ $totalPalitos -eq 9 ]; then
    echo "3";

  elif [ $totalPalitos -eq 10 ]; then
    echo "4";

  elif [ $totalPalitos -eq 11 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 12 ]; then
    echo "1";

  elif [ $totalPalitos -eq 13 ]; then
    echo "2";

  elif [ $totalPalitos -eq 14 ]; then
    echo "3";

  elif [ $totalPalitos -eq 15 ]; then
    echo "4";

  elif [ $totalPalitos -eq 16 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 17 ]; then
    echo "1";

  elif [ $totalPalitos -eq 18 ]; then
    echo "2";

  elif [ $totalPalitos -eq 19 ]; then
    echo "3";

  elif [ $totalPalitos -eq 20 ]; then
    echo "4";

  elif [ $totalPalitos -eq 21 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 22 ]; then
    echo "1";

  elif [ $totalPalitos -eq 23 ]; then
    echo "2";

  elif [ $totalPalitos -eq 24 ]; then
    echo "3";

  elif [ $totalPalitos -eq 25 ]; then
    echo "4";

  elif [ $totalPalitos -eq 26 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 27 ]; then
    echo "1";

  elif [ $totalPalitos -eq 28 ]; then
    echo "2";

  elif [ $totalPalitos -eq 29 ]; then
    echo "3";

  elif [ $totalPalitos -eq 30 ]; then
    echo "4";

  elif [ $totalPalitos -eq 31 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 32 ]; then
    echo "1";

  elif [ $totalPalitos -eq 33 ]; then
    echo "2";
  else
    echo "ERRO: há algo de errado no CPU4";
  fi;
};

function cpu5(){
  if [ $totalPalitos -eq 2 ]; then
    echo "1";

  elif [ $totalPalitos -eq 3 ]; then
    echo "2";

  elif [ $totalPalitos -eq 4 ]; then
    echo "3";

  elif [ $totalPalitos -eq 5 ]; then
    echo "4";

  elif [ $totalPalitos -eq 6 ]; then
    echo "5";

  elif [ $totalPalitos -eq 7 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 8 ]; then
    echo "1";

  elif [ $totalPalitos -eq 9 ]; then
    echo "2";

  elif [ $totalPalitos -eq 10 ]; then
    echo "3";

  elif [ $totalPalitos -eq 11 ]; then
    echo "4";

  elif [ $totalPalitos -eq 12 ]; then
    echo "5";

  elif [ $totalPalitos -eq 13 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 14 ]; then
    echo "1";

  elif [ $totalPalitos -eq 15 ]; then
    echo "2";

  elif [ $totalPalitos -eq 16 ]; then
    echo "3";

  elif [ $totalPalitos -eq 17 ]; then
    echo "4";

  elif [ $totalPalitos -eq 18 ]; then
    echo "5";

  elif [ $totalPalitos -eq 19 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 20 ]; then
    echo "1";

  elif [ $totalPalitos -eq 21 ]; then
    echo "2";

  elif [ $totalPalitos -eq 22 ]; then
    echo "3";

  elif [ $totalPalitos -eq 23 ]; then
    echo "4";

  elif [ $totalPalitos -eq 24 ]; then
    echo "5";

  elif [ $totalPalitos -eq 25 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 26 ]; then
    echo "1";

  elif [ $totalPalitos -eq 27 ]; then
    echo "2";

  elif [ $totalPalitos -eq 28 ]; then
    echo "3";

  elif [ $totalPalitos -eq 29 ]; then
    echo "4";

  elif [ $totalPalitos -eq 30 ]; then
    echo "5";

  elif [ $totalPalitos -eq 31 ]; then
    echo "1"; #jogo perdido

  elif [ $totalPalitos -eq 32 ]; then
    echo "1";

  elif [ $totalPalitos -eq 33 ]; then
    echo "2";
  else
    echo "ERRO: há algo de errado no CPU5";
  fi;
};





function instrucoes(){
  clear;

  echo "HISTÓRIA DO JOGO";
  echo "O jogo NIM é um jogo de estratégia ancestral com raízes que remontam a várias culturas ao redor do mundo. Sua origem exata é incerta, mas variações do jogo foram documentadas em várias culturas ao longo da história. Uma das primeiras menções registradas do jogo foi feita no século XVIII, quando o matemático Charles L. Bouton descreveu uma versão francesa do jogo em seu livro "Mathematical Recreation". Desde então, o jogo ganhou popularidade e foi estudado em campos como teoria dos jogos e matemática recreativa.";
  echo "";

  echo "COMO O JOGO FUNCIONA";
  echo "O jogo NIM pode ser jogado com diferentes conjuntos de objetos, como palitos, pedras ou até mesmo moedas. Algumas versões do jogo possuem uma fileira única (como este jogo) e outras possuem múltiplas fileiras. Os jogadores alternam turnos, removendo um número arbitrário de palitos da fileira em cada jogada. O jogador que remove o último palito é o perdedor.";
  echo "";

  echo -e "\nDICAS E ESTRATÉGIAS\n";
  echo -e "1) Antes de começar a jogar, certifique-se de compreender completamente as regras do jogo, incluindo o número máximo de palitos que podem ser removidos em cada turno;\n";
  echo -e "2) Tente antecipar os movimentos do seu oponente e planeje suas jogadas de acordo. Pense não apenas na jogada imediata, mas também nas consequências a longo prazo de suas decisões;\n";
  echo -e "3) Procure controlar o jogo, especialmente na fase inicial, removendo um número estratégico de palitos para forçar o seu oponente a seguir uma linha desfavorável de jogadas;\n";
  echo -e "4) Uma estratégia eficaz é criar armadilhas para o seu oponente, deixando-o em situações onde qualquer movimento que ele faça o levará à derrota;\n";
  echo -e "5) Algumas estratégias envolvem a criação de padrões de remoção de palitos que podem confundir seu oponente e aumentar suas chances de vitória. Experimente diferentes padrões e observe como seu oponente reage a eles;\n";
  echo -e "6) Se você perceber que está em desvantagem, mude para uma estratégia defensiva. Concentre-se em impedir seu oponente de criar armadilhas e tente prolongar o jogo o máximo possível para aumentar suas chances de uma reviravolta;\n";
  echo -e "7) Preste atenção ao padrão de remoção de palitos do seu oponente e tente identificar qualquer comportamento previsível. Use isso a seu favor, criando armadilhas com base nos padrões de jogo do seu oponente;\n";
  echo -e "8) Desenvolva a habilidade de calcular rapidamente quantos palitos precisam ser removidos para manter ou mudar a vantagem durante o jogo. Pratique fazer cálculos mentais rápidos para tomar decisões mais informadas durante suas jogadas;\n";
  echo -e "9) Reflita sobre suas partidas anteriores e analise quais estratégias foram mais eficazes e quais não deram certo. Use essas informações para ajustar sua abordagem e melhorar seu desempenho nas próximas partidas;\n";

  read -p "Pressione ENTER para voltar para o menu...";
};





function configuracoes(){
  declare local opcao;
  declare local valor;

  while true; do
    clear;
    echo -e "CONFIGURAÇÕES\n";
    echo "Quantidade total de palitos por partida (QTP): $qtp";
    echo "Quantidade máxima de palitos retirados por rodada (MA): $ma";
    echo "";

    echo "OPÇÕES:";
    echo "1) Alterar QTP";
    echo "2) Alterar MA";
    echo "3) Voltar para o menu";
    echo "";

    read -p "R: " opcao;

    case $opcao in
      1)
         read -p "Valor: " valor;
         setQtp $valor;
      ;;

      2)
         read -p "Valor: " valor;
         setMa $valor;
      ;;

      3) main;;

      *)
        echo "Valor inválido!";
        read -p "Pressione ENTER para tentar novamente...";
      ;;
    esac;
  done;
};

function setQtp(){
  echo "";

  if [[ !($1 =~ ^[0-9]+$) ]]; then
    echo "O QTP deve ser um valor numérico (inteiro)";
    read -p "Pressione ENTER para tentar novamente...";
    configuracoes;
  fi;

  if [ $1 -lt 5 -o $1 -gt 33 ]; then
    echo "O QTP deve ser um valor numérico (inteiro) entre 5 e 33";
    read -p "Pressione ENTER para tentar novamente...";
  else
    echo "QTP alterado com sucesso!";
    read -p "Pressione ENTER para continuar...";
    qtp=$1;
  fi;
};

function setMa(){
  echo "";

  if [[ !($1 =~ ^[3-5]+$) ]]; then
    echo "O MA deve ser um valor numérico (inteiro) de 3 a 5";
    read -p "Pressione ENTER para tentar novamente...";
    configuracoes;
  fi;

  echo "MA alterado com sucesso!";
  read -p "Pressione ENTER para continuar...";
  ma=$1;
};

#invocação da função principal
main;
