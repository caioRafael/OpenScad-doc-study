## Formas 2D

Com o BOSL2 temos novas funções para criação de formas 2D, permitindo ter um leque de opções maiores.

Para começar a estudar essas formas vamos começar pelos primitivos, formas que ja conhecemos.

Existem duas formas primitivas 2D integradas que o OpenSCAD fornece: square()e circle(). Você ainda pode usá-las da maneira usual que o OpenSCAD oferece:

Quadrado ou Retângulo:

```scad
include <BOSL2/std.scad>
square([60,40], center=true);
```

Circulo:

```scad
include <BOSL2/std.scad>
circle(r=50);
```

Octogono:

```scad
include <BOSL2/std.scad>
circle(d=100, $fn=8);
```

Esses módulos também foram aprimorados na biblioteca BOSL2 de três maneiras: ancoragem, rotação e capacidade de conexão.

### Ancoragem

Ao criar um `Analog` square(), você pode especificar qual canto ou lado será ancorado na origem. Isso substitui o center=argumento `ancora` e é mais flexível. O anchor= argumento `ancora` recebe um vetor como valor, apontando aproximadamente para o lado ou canto que você deseja alinhar à origem. Por exemplo, para alinhar o centro da borda traseira à origem, defina a âncora como [0,1]:

```scad
include <BOSL2/std.scad>
square([60,40], anchor=[0,1]);
```

Para alinhar o canto frontal direito à origem:

```scad
include <BOSL2/std.scad>
square([60,40], anchor=[1,-1]);
```

Para centralizar:

```scad
include <BOSL2/std.scad>
square([60,40], anchor=[0,0]);
```

Para maior clareza ao fornecer vetores, existem diversas constantes vetoriais padrão definidas:

| Constante                 | Direção      | Valor                        |
| ------------------------- | ------------ | ---------------------------- |
| LEFT                      | X-           | `[-1, 0, 0]`                 |
| RIGHT                     | X+           | `[ 1, 0, 0]`                 |
| FRONT / FORWARD / FWD     | Y-           | `[ 0,-1, 0]`                 |
| BACK                      | Y+           | `[ 0, 1, 0]`                 |
| BOTTOM / BOT / BTM / DOWN | Z-           | `[ 0, 0,-1]` (Apenas em 3D.) |
| TOP / UP                  | Z+           | `[ 0, 0, 1]` (Apenas em 3D.) |
| CENTER / CTR              | Centralizado | `[ 0, 0, 0]`                 |

Observe que, embora sejam vetores 3D, você pode usar a maioria deles (exceto UP/ DOWN, é claro) para âncoras em formas 2D:

```scad
include <BOSL2/std.scad>
square([60,40], anchor=BACK);
```

```scad
include <BOSL2/std.scad>
square([60,40], anchor=CENTER);
```

Você pode somar vetores para apontar para cantos:

```scad
include <BOSL2/std.scad>
square([60,40], anchor=FRONT+RIGHT);
```

Para circle(), o vetor de ancoragem pode apontar para qualquer parte do perímetro do círculo:

```scad
include <BOSL2/std.scad>
circle(d=50, anchor=polar_to_xy(1,150));
```

Observe que o raio não importa para a âncora, pois apenas a direção da âncora afeta o resultado. Você pode ver os pontos de ancoragem típicos adicionando-os show_anchors()como filhos da forma:

```scad
include <BOSL2/std.scad>
square([60,40], center=true)
    show_anchors();
```

### Rotação

A segunda maneira pela qual as formas square() e circle()foram aprimoradas é com a rotação. Ao criar a forma, você pode girá-la no próprio eixo com o spin=argumento. Basta passar um número de graus para girá-la no sentido horário:

```scad
include <BOSL2/std.scad>
square([60,40], anchor=CENTER, spin=30);
```

Como a ancoragem é realizada antes da rotação, você pode usá-las juntas para girar em torno da âncora:

```scad
include <BOSL2/std.scad>
circle(d=50, $fn=6, anchor=LEFT, spin=15);
```

### Capacidade de fixação

A terceira maneira, que square() e circle() foram aprimoradas, é a possibilidade de unir as formas em pontos de ancoragem de diversas maneiras. Isso é feito tornando uma forma filha da forma à qual você deseja unir as formas. Por padrão, basta tornar uma forma filha da outra para que a forma filha seja posicionada no centro da forma pai.

```scad
include <BOSL2/std.scad>
square(50, center=true)
    #square(50, spin=45, center=true);
```

```scad
include <BOSL2/std.scad>
square(50, center=true)
    #square([20,40], anchor=FWD);
```

Ao adicionar o módulo position(), você pode posicionar o elemento filho em qualquer ponto de ancoragem no elemento pai:

```scad
include <BOSL2/std.scad>
square(50, center=true)
    position(BACK)
        #square(25, spin=45, center=true);
```

Se você deseja orientar o objeto filho para que ele corresponda à orientação de um ponto de ancoragem, pode usar o módulo orient(). Ele não posiciona o objeto filho, apenas o rotaciona.

```scad
include <BOSL2/std.scad>
square(50, center=true)
    orient(anchor=LEFT)
        #square([10,40], anchor=FWD);
```

Você pode usar ` position` position()e ` orient()orientation` juntos para posicionar e orientar um ponto de ancoragem:

```scad
include <BOSL2/std.scad>
square(50, center=true)
    position(RIGHT+BACK)
        orient(anchor=RIGHT+BACK)
            #square([10,40], anchor=FWD);
```

Mas é mais simples usar o attach()módulo para fazer as duas coisas ao mesmo tempo:

```scad
include <BOSL2/std.scad>
square(50, center=true)
    attach(LEFT+BACK)
        #square([10,40], anchor=FWD);
```

### Retângulos

A biblioteca BOSL2 oferece uma alternativa ao square(), que suporta mais recursos. Ela se chama rect(). Você pode usá-la da mesma forma que usa o square(), mas ela também oferece funcionalidades adicionais. Por exemplo, permite arredondar os cantos:

```scad
include <BOSL2/std.scad>
rect([60,40], rounding=10);
```

Ou chanfre-os:

```scad
include <BOSL2/std.scad>
rect([60,40], chamfer=10);
```

É possivel utilizar simultaneamnete os chamfros e arredondamentos

```scad
include <BOSL2/std.scad>
rect([60,40], rounding=[5,0,10,0], chamfer=[0,5,0,15]);
```

### Elipses

A biblioteca BOSL2 também fornece um equivalente aprimorado circle()chamado ellipse(). Você pode usá-lo da mesma forma que usa circle(), mas ele também oferece funcionalidades adicionais. Por exemplo, permite maior controle sobre seu tamanho.

Como um círculo no OpenSCAD só pode ser aproximado por um polígono regular com vários lados retos, isso pode levar a imprecisões de tamanho e forma. Para contornar isso, os argumentos ` realign=x` e `y` circum=também são fornecidos.

O realign=argumento, se definido true, rotaciona o polígono ellipse()pela metade do ângulo entre seus lados:

```scad
include <BOSL2/std.scad>
ellipse(d=100, $fn=8);
#ellipse(d=100, $fn=8, realign=true);
```

O circum=argumento, se verdadeiro, faz com que o polígono que forma o ellipse()círculo circunscreva o círculo ideal em vez de o inscrever.

Inscrição do círculo ideal:

```scad
include <BOSL2/std.scad>

linear_extrude(height=1)
color("green")
ellipse(d=100, $fn=360);
color("red")
linear_extrude(height=3)
ellipse(d=100, $fn=6);
```

O ellipse()módulo, como o próprio nome sugere, pode receber raios ou diâmetros X e Y separados. Para isso, basta fornecer r=uma d=lista com dois raios ou diâmetros:

```scad
include <BOSL2/std.scad>
ellipse(r=[30,20]);
```

Assim como circle()você pode ancorar, girar e anexar ellipse().

#### Parâmetros do `ellipse()`

| Parâmetro | Descrição                                                                                              | Valor padrão |
| --------- | ------------------------------------------------------------------------------------------------------ | ------------ |
| `r`       | Raio da elipse. Pode ser um número (círculo) ou uma lista `[X, Y]` com raios separados.                | `1`          |
| `d`       | Diâmetro da elipse. Pode ser um número ou uma lista `[X, Y]` com diâmetros separados. Sobrescreve `r`. | —            |
| `realign` | Se `true`, rotaciona o polígono pela metade do ângulo entre seus lados.                                | `false`      |
| `circum`  | Se `true`, o polígono circunscreve o círculo ideal em vez de inscrevê-lo.                              | `false`      |
| `$fn`     | Número de lados do polígono que aproxima a elipse.                                                     | —            |
| `anchor`  | Ponto de ancoragem em relação à origem (usa as constantes vetoriais).                                  | `CENTER`     |
| `spin`    | Rotação da forma em graus, no sentido anti-horário.                                                    | `0`          |

### Triângulos retângulos

A biblioteca BOSL2 oferece uma maneira simples de criar um triângulo retângulo em 2D usando o right_triangle()módulo:

```scad
include <BOSL2/std.scad>
right_triangle([40,30]);
```

Você pode usar os botões xflip()e yflip()para alterar o quadrante em que o triângulo é formado:

```scad
include <BOSL2/std.scad>
xflip() right_triangle([40,30]);
```

```scad
include <BOSL2/std.scad>
yflip() right_triangle([40,30]);
```

Ou, alternativamente, basta rotacioná-lo para o quadrante correto com spin=:

```scad
include <BOSL2/std.scad>
right_triangle([40,30], spin=90);
```

Você também pode usar ancoragem com triângulos retângulos:

```scad
include <BOSL2/std.scad>
right_triangle([40,30], anchor=FWD+RIGHT);
```

### Trapézios

O OpenSCAD não oferece uma maneira simples de criar triângulos, trapézios ou paralelogramos 2D genéricos. A biblioteca BOSL2, por sua vez, fornece todas essas formas através de um trapezoid()módulo.

Para criar um triângulo simples, basta definir uma das larguras como zero:

```scad
include <BOSL2/std.scad>
trapezoid(w1=50, w2=0, h=40);
```

Para formar um triângulo retângulo, você precisa usar o shift=argumento para deslocar a parte de trás do trapézio ao longo do eixo X:

```scad
include <BOSL2/std.scad>
trapezoid(w1=50, w2=0, h=50, shift=-25);
```

Você pode criar um trapézio especificando larguras diferentes de zero para a frente ( w1=) e para trás ( w2=).

Um paralelogramo é simplesmente uma questão de usar a mesma largura na frente e atrás, com um deslocamento ao longo do eixo X:

```scad
include <BOSL2/std.scad>
trapezoid(w1=50, w2=50, shift=20, h=50);
```

Um quadrilátero pode ser formado por larguras frontal ( w1=) e traseira ( w2=) desiguais e diferentes de zero, com a largura traseira deslocada ao longo do eixo X:

```scad
include <BOSL2/std.scad>
trapezoid(w1=50, w2=30, shift=20, h=50);
```

### N-Gons regulares

O OpenSCAD permite criar polígonos regulares de N lados (pentágonos, hexágonos, etc.) usando o comando circle() `with` $fn. Embora seja conciso, pode não ser tão óbvio à primeira vista.

A biblioteca BOSL2 possui módulos com nomes mais claros para N-gons comuns:

```scad
include <BOSL2/std.scad>
pentagon(d=50);
```

```scad
include <BOSL2/std.scad>
hexagon(d=50);
```

```scad
linear_extrude(height=1)
octagon(d=50);
```

Para os N-gons mais comuns existem módulos com nomes dedicados: `pentagon()` (5 lados), `hexagon()` (6 lados) e `octagon()` (8 lados). Quando você precisa de um polígono regular com um número arbitrário de lados, use `regular_ngon()` e informe a quantidade de lados no parâmetro `n`.

Diferente do `circle()` com `$fn`, esses módulos deixam explícito que a intenção é criar um polígono regular, além de aceitarem as mesmas funcionalidades das outras formas 2D do BOSL2: ancoragem, rotação e conexão.

O tamanho pode ser definido de várias maneiras: pelo raio/diâmetro do círculo circunscrito (`r`/`d`), pelo raio/diâmetro do círculo inscrito (`ir`/`id`) ou pelo comprimento de cada lado (`side`).

```scad
include <BOSL2/std.scad>
regular_ngon(n=7, d=50);
```

#### Parâmetros do `regular_ngon()`

| Parâmetro    | Descrição                                                             | Valor padrão |
| ------------ | --------------------------------------------------------------------- | ------------ |
| `n`          | Número de lados do polígono.                                          | `6`          |
| `r` / `d`    | Raio / diâmetro do círculo circunscrito (passa pelos vértices).       | —            |
| `ir` / `id`  | Raio / diâmetro do círculo inscrito (passa pelo meio dos lados).      | —            |
| `side`       | Comprimento de cada lado do polígono.                                 | —            |
| `rounding`   | Arredondamento aplicado aos cantos.                                   | `0`          |
| `realign`    | Se `true`, rotaciona o polígono pela metade do ângulo entre os lados. | `false`      |
| `align_tip`  | Alinha um vértice na direção do vetor informado.                      | —            |
| `align_side` | Alinha o meio de um lado na direção do vetor informado.               | —            |
| `$fn`        | Alternativa para definir o número de lados.                           | —            |
| `anchor`     | Ponto de ancoragem em relação à origem (usa as constantes vetoriais). | `CENTER`     |
| `spin`       | Rotação da forma em graus, no sentido anti-horário.                   | `0`          |

> Os módulos `pentagon()`, `hexagon()` e `octagon()` aceitam os mesmos parâmetros, exceto `n`, que já é fixo pelo próprio nome.

### Estrelas

A biblioteca BOSL2 tem estrelas como uma forma básica suportada. Elas podem ter qualquer número de pontas. Você pode especificar a forma de uma estrela pela contagem de pontas e pelos raios/diâmetros dos vértices interno e externo:

```scad
include <BOSL2/std.scad>
star(n=3, id=10, d=50);
```

```scad
include <BOSL2/std.scad>
star(n=5, id=15, r=25);
```

```scad
include <BOSL2/std.scad>
star(n=10, id=30, d=50);
```

Ou você pode especificar a estrela pela contagem de pontas e pelo número de pontas a "pular" (`step=`), formando estrelas com pontas mais afiadas:

```scad
include <BOSL2/std.scad>
star(n=7, step=2, d=50);
```

```scad
include <BOSL2/std.scad>
star(n=7, step=3, d=50);
```

Se o argumento `realign=` receber um valor verdadeiro, a estrela é rotacionada pela metade do ângulo de uma ponta:

```scad
include <BOSL2/std.scad>
left(30) star(n=5, step=2, d=50);
right(30) star(n=5, step=2, d=50, realign=true);
```

O argumento `align_tip=` recebe um vetor para alinhar a primeira ponta em uma direção específica:

```scad
include <BOSL2/std.scad>
star(n=5, ir=15, or=30, align_tip=BACK)
    attach("tip0") color("blue") anchor_arrow2d();
```

De forma semelhante, a primeira reentrância (o "vale" entre pontas) pode ser orientada com `align_pit=`:

```scad
include <BOSL2/std.scad>
star(n=5, ir=15, or=30, align_pit=BACK)
    attach("pit0") color("blue") anchor_arrow2d();
```

Você pode usar `anchor=` e `spin=`, como em outras formas conectáveis. Porém, os pontos de ancoragem baseiam-se nos extremos da forma e podem não ficar onde você espera:

```scad
include <BOSL2/std.scad>
star(n=5, step=2, d=50)
    show_anchors(custom=false);
```

As estrelas também têm pontos de ancoragem nomeados para as pontas (`tip`), reentrâncias (`pit`) e pontos médios entre as pontas:

```scad
include <BOSL2/std.scad>
star(n=5, step=2, d=40)
    show_anchors(std=false);
```

#### Parâmetros do `star()`

| Parâmetro    | Descrição                                                                              | Valor padrão |
| ------------ | -------------------------------------------------------------------------------------- | ------------ |
| `n`          | Número de pontas da estrela.                                                           | —            |
| `r` / `d`    | Raio / diâmetro externo (dos vértices das pontas).                                     | —            |
| `or` / `od`  | Raio / diâmetro externo (forma alternativa de `r`/`d`).                                | —            |
| `ir` / `id`  | Raio / diâmetro interno (dos vértices das reentrâncias).                               | —            |
| `step`       | Número de pontas a pular ao desenhar, criando pontas mais afiadas. Alternativa a `ir`. | —            |
| `realign`    | Se `true`, rotaciona a estrela pela metade do ângulo de uma ponta.                    | `false`      |
| `align_tip`  | Vetor para alinhar a primeira ponta em uma direção.                                    | —            |
| `align_pit`  | Vetor para alinhar a primeira reentrância em uma direção.                              | —            |
| `rounding`   | Arredondamento aplicado às pontas.                                                     | `0`          |
| `anchor`     | Ponto de ancoragem em relação à origem (usa as constantes vetoriais).                  | `CENTER`     |
| `spin`       | Rotação da forma em graus, no sentido anti-horário.                                    | `0`          |

### Teardrop2D (Gota)

Ao imprimir em 3D, é comum precisar de um furo circular em uma parede vertical. Se o furo for muito grande, a saliência (overhang) no topo pode causar problemas de impressão em impressoras FDM/FFF. Se você não quer usar material de suporte, pode usar a forma de gota (teardrop). O módulo `teardrop2d()` cria a versão 2D dessa forma, para que você possa extrudá-la depois:

```scad
include <BOSL2/std.scad>
teardrop2d(r=20);
```

```scad
include <BOSL2/std.scad>
teardrop2d(d=50);
```

O ângulo de saliência padrão é de 45 graus, mas você pode ajustá-lo com o argumento `ang=`:

```scad
include <BOSL2/std.scad>
teardrop2d(d=50, ang=30);
```

Se preferir achatar o topo da gota, para facilitar o bridging, você pode usar o argumento `cap_h=`:

```scad
include <BOSL2/std.scad>
teardrop2d(d=50, cap_h=25);
```

```scad
include <BOSL2/std.scad>
teardrop2d(d=50, ang=30, cap_h=30);
```

Você pode usar `anchor=` e `spin=`, como em outras formas conectáveis. Porém, os pontos de ancoragem baseiam-se nos extremos da forma e podem não ficar onde você espera:

```scad
include <BOSL2/std.scad>
teardrop2d(d=50, ang=30, cap_h=30)
    show_anchors();
```

#### Parâmetros do `teardrop2d()`

| Parâmetro | Descrição                                                             | Valor padrão |
| --------- | --------------------------------------------------------------------- | ------------ |
| `r` / `d` | Raio / diâmetro do círculo da gota.                                   | —            |
| `ang`     | Ângulo da saliência (overhang) da ponta, em graus.                    | `45`         |
| `cap_h`   | Altura em que o topo da gota é achatado (limita o overhang).          | —            |
| `$fn`     | Número de lados usados para aproximar a parte circular.               | —            |
| `anchor`  | Ponto de ancoragem em relação à origem (usa as constantes vetoriais). | `CENTER`     |
| `spin`    | Rotação da forma em graus, no sentido anti-horário.                   | `0`          |

### Glued Circles (Círculos colados)

Uma forma mais incomum fornecida pelo BOSL2 são os Glued Circles. É basicamente um par de círculos, conectados por algo que parece um menisco de cola:

```scad
include <BOSL2/std.scad>
glued_circles(d=30, spread=40);
```

Os argumentos `r=`/`d=` especificam o raio ou o diâmetro dos dois círculos:

```scad
include <BOSL2/std.scad>
glued_circles(r=20, spread=45);
```

O argumento `spread=` especifica a distância entre os centros dos dois círculos:

```scad
include <BOSL2/std.scad>
glued_circles(d=30, spread=30);
```

```scad
include <BOSL2/std.scad>
glued_circles(d=30, spread=40);
```

O argumento `tangent=` define o ângulo da tangente do menisco em relação aos dois círculos:

```scad
include <BOSL2/std.scad>
glued_circles(d=30, spread=30, tangent=45);
```

```scad
include <BOSL2/std.scad>
glued_circles(d=30, spread=30, tangent=-20);
```

Um uso interessante é enfileirar alguns `glued_circles()` e extrudá-los para formar uma parede com nervuras:

```scad
include <BOSL2/std.scad>
$fn=36;  s=10;
linear_extrude(height=50,convexity=16,center=true)
    xcopies(s*sqrt(2),n=3)
        glued_circles(d=s, spread=s*sqrt(2), tangent=45);
```

Você pode usar `anchor=` e `spin=`, como em outras formas conectáveis. Porém, os pontos de ancoragem baseiam-se nos extremos da forma e podem não ficar onde você espera:

```scad
include <BOSL2/std.scad>
glued_circles(d=40, spread=40, tangent=45)
    show_anchors();
```

#### Parâmetros do `glued_circles()`

| Parâmetro | Descrição                                                             | Valor padrão |
| --------- | --------------------------------------------------------------------- | ------------ |
| `r` / `d` | Raio / diâmetro dos dois círculos.                                    | —            |
| `spread`  | Distância entre os centros dos dois círculos.                         | `10`         |
| `tangent` | Ângulo da tangente do menisco que conecta os círculos, em graus.     | `30`         |
| `anchor`  | Ponto de ancoragem em relação à origem (usa as constantes vetoriais). | `CENTER`     |
| `spin`    | Rotação da forma em graus, no sentido anti-horário.                   | `0`          |
