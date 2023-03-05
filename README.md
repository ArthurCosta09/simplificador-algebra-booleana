**<h1 align="center">Simplificador de Algebra Booleana :heavy_plus_sign:</h1>**

<br/>

## **_Sumário_**

> - [Introdução](#introdução)
> - [Portas lógicas](#portas-lógicas)
> - [Algebra Booleana](#álgebra-booleana)
> - [Mapa de Karnaugh](#mapa-de-karnaugh)
> - [Sobre o projeto](#sobre-o-projeto)
> - [Desenvolvimento](#desenvolvimento)
> - [Referências](#referências)

---

## **_Introdução_**

A eletrônica digital é a área que utiliza dois pulsos representados por 1 e 0. Comandos como if-else, for loop e while loop são provenientes da eletrônica digital.

Representamos os bits 1 e 0 nos sistemas eletrônicos atráves dos níveis de tensão elétrica. Nos Circuitos Integrados (CI) utilizamos os seguintes níveis de tensão:

- **0V** (nível **BAIXO** ou **LOW**) que representa o bit 0.
- **5V** (nível **ALTO** ou **HIGH**) que representa o bit 1.

Veja a diferença entre um sinal analógico e um sinal digital na figura abaixo.

<br/>

![Sinal analógico vs Sinal Digital](.//img/sinalAD.png)

<br/>

O sinal digital geralmente é representado por uma onda quadrada onde a amplitude máxima representa o bit 1, e a amplitude mínima representa o bit 0. 

Assim, o presente repositório tem por objetivo apresentar a aplicação das equações booleanas na área de TI, e como ela pode facilitar o entendimento das portas lógicas AND, NOT, OR, XOR e NOT na construção de placas eletrônicas que compõem o hardware dos computadores modernos.

---

## **_Portas Lógicas_**

As portas lógicas são dispositivos que operam com um ou mais sinais de entrada, transformando-os um único sinal de saída LOW ou HIGH. As portas lógicas mais conhecidas são a AND, NOT, NAND, OR, NOR, XOR e XNOR.

Para o estudo da algebra booleana por trás das portas lógicas, iremos recorrer a um instrumento conhecido como Tabela Verdade. A tabela verdade facilita a visualização do valor lógico de um circuito digital.

<br/>

![Tabela verdade](.//img/tabelaverdademodelo.png)

<br/>

### **Porta AND**

A porta AND gera um sinal de saída em nível alto quando ambos os sinais de entrada estiverem em nível alto. Caso contrário, será gerado um sinal em nível baixo.

<br/>

![Tabela verdade porta AND](.//img/tabelaAND.png)

<br/>

A expressão booleana da porta AND é x = A * B. Não confuda isso com a multiplicação convencional que vemos diariamente na matemática clássica, entretanto a OPERAÇÃO AND sobre variáveis booleanas equivale à multiplicação convencional.

A simbologia da porta AND é representada logo abaixo.

<br/>

![Simbologia porta AND](.//img/portaAND.png)

<br/>

O circuito integrado mais utilizado é o [IC7408](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://www.electroschematics.com/wp-content/uploads/2013/07/7408-datasheet.pdf), que possui 4 portas AND em suas conexões.

<br/>

![Pinagem 7408](.//img/pinagemAND.png)

<br/>

Onde:

- Vcc (alimentação) - Deve ser ligada a 5V
- GND (aterramento)

Entradas das portas AND:

- Porta A - 1 e 2
- Porta B - 4 e 5
- Porta C - 9 e 10
- Porta D - 12 e 13

Saídas das portas AND:

- Porta A - 3
- Porta B - 6
- Porta C - 8
- Porta D - 11

<br/>

### **Porta OR**

Este dispositivo gera um sinal de saída em nível alto quando uma das entradas ou ambas forem de nível alto. Caso contrário, a saída terá nível lógico baixo. A expressão booleana é dada por x = A + B. O sinal "+" não representa a adição convencional. Caso uma das entradas for 0 e o restante for 1, a saída será 1. Caso ambas forem 0, a saída será 0.

<br/>

![Tabela verdade porta OR](.//img/tabelaOR.png)

<br/>

A simbologia da porta OR é representada logo abaixo.

<br/>

![Simbologia porta OR](.//img/portaOR.png)

<br/>

O circuito integrado mais utilizado é o [IC732](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://eater.net/datasheets/74ls32.pdf), que possui 4 portas OR em suas conexões.

<br/>

![Pinagem 7432](.//img/pinagemOR.png)

<br/>

Onde:

- Vcc (alimentação) - Deve ser ligada a 5V
- GND (aterramento)

Entradas das portas OR:

- Porta A - 1 e 2
- Porta B - 4 e 5
- Porta C - 9 e 10
- Porta D - 12 e 13

Saídas das portas OR:

- Porta A - 3
- Porta B - 6
- Porta C - 8
- Porta D - 11

<br/>

### **Porta NOT**

A porta NOT inverte o sinal de entrada. Está porta possui somente uma entrada.

<br/>

![Tabela verdade porta NOT](.//img/tabelaNOT.png)

<br/>

A simbologia da porta NOT é representada logo abaixo.

<br/>

![Simbologia porta NOT](.//img/portaNOT.png)

<br/>

O circuito integrado mais utilizado é o [IC7404](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/http://www4.ujaen.es/~dlopez/descargas/Hoja%20caracteristicas%207404.pdf), que possui 6 portas NOT em suas conexões.

<br/>

![Pinagem 7404](.//img/pinagemNOT.png)

<br/>

Onde:

- Vcc (alimentação) - Deve ser ligada a 5V
- GND (aterramento)

Entradas das portas NOT:

- Porta A - 1
- Porta B - 3
- Porta C - 5
- Porta D - 9
- Porta E - 11
- Porta F - 13

Saídas das portas NOT:

- Porta A - 2
- Porta B - 4
- Porta C - 6
- Porta D - 8
- Porta E - 10
- Porta F - 12

<br/>

### **Porta NAND**

A porta NAND é análoga a AND seguida de uma porta NOT. Apresenta a operação inversa da porta AND.

<br/>

![Tabela verdade porta NAND](.//img/tabelaNAND.png)

<br/>

A simbologia da porta NAND é representada logo abaixo.

<br/>

![Simbologia porta NAND](.//img/portaNAND.png)

<br/>

O circuito integrado mais utilizado é o [IC7400](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://web.mit.edu/6.131/www/document/7400.pdf), que possui 4 portas NAND em suas conexões.

<br/>

![Pinagem 7400](.//img/pinagemNAND.png)

<br/>

Onde:

- Vcc (alimentação) - Deve ser ligada a 5V
- GND (aterramento)

Entradas das portas NAND:

- Porta A - 1 e 2
- Porta B - 4 e 5
- Porta C - 9 e 10
- Porta D - 12 e 13

Saídas das portas NAND:

- Porta A - 3
- Porta B - 6
- Porta C - 8
- Porta D - 11

<br/>

### **Porta NOR**

É análago a porta OR seguida de uma porta NOT. Apresenta a operação inversa da porta OR.

<br/>

![Tabela verdade porta NOR](.//img/tabelaNOR.png)

<br/>

A simbologia da porta NOR é apresentada logo abaixo.

<br/>

![Simbologia porta NOR](.//img/portaNOR.png)

<br/>

O circuito integrado mais utilizado é o [IC7402](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://web.mit.edu/6.131/www/document/7402.pdf), que possui 4 portas NOR em suas conexões.

<br/>

![Pinagem 7402](.//img/pinagemNOR.png)

<br/>

Onde: 

- Vcc (alimentação) - Deve ser ligada a 5V
- GND (aterramento)

Entradas das portas NOR:

- Porta A - 2 e 3
- Porta B - 5 e 6
- Porta C - 8 e 9
- Porta D - 11 e 12

Saídas das portas NOR:

- Porta A - 1
- Porta B - 4
- Porta C - 10
- Porta D - 13

<br/>

### **Porta XOR**

Conhecido como "OR exclusivo", a porta lógica produz uma saída em nível ALTO sempre que as duas entradas estiverem em níveis opostos. 

<br/>

![Tabela verdade porta XOR](.//img/tabelaXOR.png)

<br/>

A simbologia da porta XOR é representada logo abaixo.

<br/>

![Simbologia porta XOR](.//img/portaXOR.png)

<br/>

O circuito integrado mais utilizado é o [IC7486](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/http://www4.ujaen.es/~dlopez/descargas/Hoja%20caracteristicas%207486.pdf), que possui 4 portas XOR em suas conexões.

<br/>

![Pinagem 7486](.//img/pinagemXOR.png)

<br/>

Onde: 

- Vcc (alimentação) - Deve ser ligada a 5V
- GND (aterramento)

Entradas das portas XOR:

- Porta A - 1 e 2
- Porta B - 4 e 5
- Porta C - 9 e 10
- Porta D - 12 e 13

Saídas das portas XOR:

- Porta A - 3
- Porta B - 6
- Porta C - 8
- Porta D - 11

<br/>

### **Porta XNOR**

Opera de maneira completamente oposta ao circuito XOR onde gerará uma saída em nível ALTO caso as duas entradas estiverem no mesmo nível lógico.

<br/>

![Tabela verdade porta XNOR](.//img/tabelaXNOR.png)

<br/>

A simbologia da porta XNOR é representada logo abaixo.

<br/>

![Simbologia porta XNOR](.//img/portaXNOR.png)

<br/>

O circuito integrado mais utilizado é o [IC74266](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://www.jameco.com/Jameco/Products/ProdDS/47360.pdf), que possui 4 portas XNOR em suas conexões.

<br/>

![Pinagem 74266](.//img/pinagemXNOR.png)

<br/>

Onde:

- Vcc (alimentação) - Deve ser ligada a 5V
- GND (aterramento)

Entradas das portas XNOR:

- Porta A - 1 e 2
- Porta B - 5 e 6
- Porta C - 8 e 9
- Porta D - 12 e 13

Saídas das portas XNOR:

- Porta A - 3
- Porta B - 4
- Porta C - 10
- Porta D - 11

---

## **_Álgebra Booleana_**

A álgebra booleana é um **método que serve para simplificar circuitos lógicos** em eletrônica digital que foi criada pelo matemático inglês George Boole em 1854. A lógica booleana permite apenas dois estados de circuito (verdadeiro ou falso), sendo representados por 1 e 0.

<br/>

![](.//img/tabelaBool.png)

<br/>

As variáveis booleanas 1 e 0 **não representam necessariamente números, e sim o estado do nível de tensão de uma variável de entrada ou saída**. Para entender melhor isso, será apresentada algumas identidades básicas.

<br/>

- Leis Fundamentais

![Leis fundamentais da algebra booleana](.//img/leiFundamental.png)

<br/>

 - Lei Comutativa

![Lei comutativa](.//img/leiComutativa.png)

<br/>

- Lei Distributiva

![Lei distributiva](.//img/leiDistributiva.png)

<br/>

- Outras identidades

![Outras identidades](.//img/outrasIdentidades.png)

<br/>

### **Lei de DeMorgan**

O teorema de DeMorgan é muito útil quando queremos **simplificar uma expressão booleana a fim de reduzir o número de portas lógicas** durante a montagem do circuito. As identidades da Lei de DeMorgan estão logo abaixo.

<br/>

![Lei de Morgan](.//img/leiMorgan.png)

<br/>

Eis os circuitos equivalentes das identidades propostas.

<br/>

![](.//img/circuitoEq1.png)

<br/>

![](.//img/circuitoEq2.png)

<br/>

É possível simplificar funções booleanas através de dois métodos:

1. **Método algébrico** - Utilizando identidades e leis booleanas.
2. **Método gráfico** - Utilizando o método do Mapa de Karnaugh.

Neste artigo, abordaremos o método do Mapa de Karnaugh já que o algoritmo por trás da simplificação é baseado na lógica do mesmo.

---

## **_Mapa de Karnaugh_**

O **Mapa de Karnaugh** (**Mapa K**) é um método gráfico utilizado para simplificar uma equação lógica ou converter uma tabela-verdade no circuito lógico correspondente, de maneira simples e metódica. Para fins ditáticos e práticos, o algoritmo é restrito a problemas com até quatro variáveis, pois resolver problemas de cinco ou seis variáveis é complicado demais, sem contar a lógica de programação por trás de problemas com mais de quatro variáveis ser bem mais complexa.

Estarei disponibilizando alguns links caso tenha interesse em aprofundar sobre o método de resolução de funções booleanas com o Mapa K, pois não estarei entrando em muito detalhes do passo a passo para não deixar o artigo muito grande.

:link: [Material I](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://edisciplinas.usp.br/pluginfile.php/5217375/mod_resource/content/1/Aula%205%20-%20Mapas%20de%20Karnaugh.pdf)

:link: [Material II](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://www.inf.ufsc.br/~j.guntzel/isd/isd2.pdf)

:link: [Sistemas Digitais: Princípios e Aplicações](https://www.amazon.com.br/Sistemas-digitais-princ%C3%ADpios-aplica%C3%A7%C3%B5es-Ronald/dp/8576059223)

Para a construção do Mapa K, foi-se necessário utilizar algumas estrutura de dados como OrderedDict, List e Set. O mapa K foi feito por uma List de no máximo 4 linhas e 4 colunas. A tabela abaixo mostra uma pequnea noção da lógica por trás do mapa.

<br/>

![](.//img/mapaK.png)

<br/>

Veja que as entradas A e B representam as linhas da matriz, enquanto as entradas C e D representam as colunas da matriz.

Antes de fazer a matriz, o algoritmo construiu uma tabela verdade para a montagem do mapa K. 

Uma observação importante é sempre deixar a tabela verdade na ordem decrescente para não haver confusões durante sua aplicação.

---

## **_Sobre o projeto_**

O projeto foi desenvolvido na linguagem dart utilizando o framework Flutter. O simplificador é um trabalho acadêmico desenvolvido por Arthur Nazário da Costa, juntamente com o professor Júlio Cesar Coelho, estudante do curso de graduação de Engenharia Eletrônica e de Telecomunicações da Universidade Federal de Uberlândia campus Patos de Minas.

O objetivo do trabalho é ajudar os estudantes ou profissionais da área de TI a resolverem problemas envolvendo a área da eletrônica digital. Além disso, o leitor terá uma certa noção de como a Algebra Booleana consegue descrever o comportamento das portas lógicas, que são essenciais para a realização de inúmeros comandos ao usufruir um smartphone, smart tv, notebook, etc. 

O código foi por trás de todo o aplicativo foi separado em diversos arquivos .dart a fim de organizar o código para melhor experiência do leitor. Abaixo está uma imagem da tela principal do simplificador.

<br/>

![Tela do app](.//img/telaApp.png)

<br/>

Para que o aplicativo funcione de forma correta, é preciso utilizar os comandos descritos na legenda no campo de texto. Após escrever a função, basta clicar em "Efetuar Operação" para obter a função simplifica da equação inserida.

Para a resolução das operações, utilizei uma biblioteca que realiza as operações booleanas no formato de String. Ao realizar as operações, escrevi um algoritmo que montasse a tabela-verdade para a construção do Mapa de Karnaugh.

Os códigos do app estão disponíveis na pasta lib.

---

## **_Desenvolvimento_**

Foi utilizada as seguintes ferramentas na construção do simplificador.

- Dart
  - Flutter
  - Android Studio
- VsCode
  - Prettier
  - Markdown All in One
  - Extensão Dart
  - Extensão Flutter
- CIs
  - 7404
  - 7432
  - 7486
- Git
- Github

---

## **_Referências_**

[1] TOCCI, R. J.; WIDMER, N. S.; MOSS, G. L. Sistemas digitais princípios e aplicações. [s.l.] São Paulo Pearson Prentice Hall, 2007.

‌[2] ELETROGATE. Introdução às Portas Lógicas. Disponível em: <https://blog.eletrogate.com/introducao-as-portas-logicas/#:~:text=para%20uso%20geral.->. Acesso em: 5 mar. 2023.

‌[3] BARRETO, C. G. Tudo sobre a eletrônica analógica e eletrônica digital! Disponível em: <https://automacaoecartoons.com/2020/04/10/eletronica-analogica-eletronica-digital/>. Acesso em: 5 mar. 2023.

‌[4] Descubra o que estuda a eletrônica! - Blog da Eletrônica. Disponível em: <https://www.blogdaeletronica.com.br/descubra-o-que-estuda-a-eletronica/>. Acesso em: 5 mar. 2023.

‌

