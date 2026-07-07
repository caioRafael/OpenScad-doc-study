## Formas 3D

O OpenSCAD oferece 3 formas primitivas 3D integradas: `cube()`, `cylinder()` e `sphere()`. A biblioteca BOSL2 estende essas formas e fornece alternativas com mais recursos, além de novas maneiras de reorientá-las (ancoragem, rotação, orientação e conexão).

### Cubos 3D

O BOSL2 sobrescreve o módulo `cube()` integrado. Ele ainda pode ser usado da forma tradicional:

```scad
include <BOSL2/std.scad>
cube(100);
```

```scad
include <BOSL2/std.scad>
cube(100, center=true);
```

```scad
include <BOSL2/std.scad>
cube([50,40,20], center=true);
```

Mas também foi aprimorado para permitir ancoragem (`anchor`), rotação (`spin`), orientação (`orient`) e conexão (`attach`).

Você pode usar `anchor=` de forma parecida com `rect()` ou `ellipse()`, mas agora também é possível ancorar verticalmente em 3D, permitindo ancorar a faces, arestas e cantos:

```scad
include <BOSL2/std.scad>
cube([50,40,20], anchor=BOTTOM);
```

```scad
include <BOSL2/std.scad>
cube([50,40,20], anchor=TOP+BACK);
```

```scad
include <BOSL2/std.scad>
cube([50,40,20], anchor=TOP+FRONT+LEFT);
```

Você pode usar `spin=` para girar em torno do eixo Z **depois** da ancoragem:

```scad
include <BOSL2/std.scad>
cube([50,40,20], anchor=FRONT, spin=30);
```

Objetos 3D também aceitam o argumento `orient=` como um vetor, apontando para onde o topo da forma deve ser rotacionado:

```scad
include <BOSL2/std.scad>
cube([50,40,20], orient=UP+BACK+RIGHT);
```

Se você usar `anchor=`, `spin=` e `orient=` juntos, a ancoragem é feita primeiro, depois a rotação e por fim a orientação:

```scad
include <BOSL2/std.scad>
cube([50,40,20], anchor=FRONT, spin=45, orient=UP+FWD+RIGHT);
```

#### Cuboid

O BOSL2 fornece o módulo `cuboid()`, que amplia o `cube()` com arredondamento e chanfro de arestas. Ele é usado de forma parecida com `cube()`, exceto que o `cuboid()` centraliza por padrão.

Você pode arredondar as arestas com o argumento `rounding=`:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=20);
```

Da mesma forma, você pode chanfrar as arestas com o argumento `chamfer=`:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], chamfer=10);
```

Você pode arredondar apenas algumas arestas usando o argumento `edges=`. Ele aceita vários tipos de valor. Se você passar um vetor apontando para uma face, apenas as arestas ao redor dessa face serão arredondadas:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=20, edges=TOP);
```

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=20, edges=RIGHT);
```

Se você passar para `edges=` um vetor apontando para um canto, todas as arestas que se encontram nesse canto serão arredondadas:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=20, edges=RIGHT+FRONT+TOP);
```

Se você passar para `edges=` um vetor apontando para uma aresta, apenas essa aresta será arredondada:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=10, edges=FRONT+TOP);
```

Se você passar a string `"X"`, `"Y"` ou `"Z"`, todas as arestas alinhadas ao eixo indicado serão arredondadas:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=10, edges="Z");
```

Se você passar uma lista de especificações de arestas, todas as arestas referenciadas na lista serão arredondadas:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=10, edges=[TOP,"Z",BOTTOM+RIGHT]);
```

O valor padrão de `edges=` é `EDGES_ALL` (todas as arestas). Você também pode usar o argumento `except_edges=` para especificar arestas que **não** devem ser arredondadas:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=10, except_edges=BOTTOM+RIGHT);
```

O argumento `except_edges=` aceita qualquer tipo de valor que `edges=` aceita:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=10, except_edges=[BOTTOM,"Z",TOP+RIGHT]);
```

Você pode combinar `edges=` e `except_edges=` para simplificar a especificação:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], rounding=10, edges=[TOP,FRONT], except_edges=TOP+FRONT);
```

O chanfro pode ser especificado da mesma maneira:

```scad
include <BOSL2/std.scad>
cuboid([100,80,60], chamfer=10, edges=[TOP,FRONT], except_edges=TOP+FRONT);
```

#### Parâmetros do `cuboid()`

| Parâmetro       | Descrição                                                                  | Valor padrão |
| --------------- | -------------------------------------------------------------------------- | ------------ |
| `size`          | Tamanho do cubo. Número (cubo) ou lista `[X, Y, Z]`.                        | `[1,1,1]`    |
| `rounding`      | Raio de arredondamento das arestas.                                        | —            |
| `chamfer`       | Tamanho do chanfro das arestas.                                            | —            |
| `edges`         | Quais arestas arredondar/chanfrar (face, canto, aresta, `"X"/"Y"/"Z"`).    | `EDGES_ALL`  |
| `except_edges`  | Arestas que **não** devem ser arredondadas/chanfradas.                     | —            |
| `anchor`        | Ponto de ancoragem em relação à origem (usa as constantes vetoriais).      | `CENTER`     |
| `spin`          | Rotação em torno do eixo Z em graus (após a ancoragem).                    | `0`          |
| `orient`        | Vetor para onde o topo da forma deve apontar.                              | `UP`         |

### Cilindros 3D

O BOSL2 sobrescreve o módulo `cylinder()` integrado. Ele ainda pode ser usado da forma tradicional:

```scad
include <BOSL2/std.scad>
cylinder(r=50,h=50);
```

```scad
include <BOSL2/std.scad>
cylinder(r=50,h=50,center=true);
```

```scad
include <BOSL2/std.scad>
cylinder(d=100,h=50,center=true);
```

```scad
include <BOSL2/std.scad>
cylinder(d1=100,d2=80,h=50,center=true);
```

Você também pode ancorar, girar, orientar e conectar, como no módulo `cuboid()`:

```scad
include <BOSL2/std.scad>
cylinder(r=50, h=50, anchor=TOP+FRONT);
```

```scad
include <BOSL2/std.scad>
cylinder(r=50, h=50, anchor=BOTTOM+LEFT, spin=30);
```

```scad
include <BOSL2/std.scad>
cylinder(r=50, h=50, anchor=BOTTOM, orient=UP+BACK+RIGHT);
```

#### Cyl

O BOSL2 fornece o módulo `cyl()`, que amplia o `cylinder()` com arredondamento e chanfro de arestas. Ele é usado de forma parecida com `cylinder()`, exceto que o `cyl()` centraliza o cilindro por padrão.

```scad
include <BOSL2/std.scad>
cyl(r=60, l=100);
```

```scad
include <BOSL2/std.scad>
cyl(d=100, l=100, anchor=TOP);
```

Você pode arredondar as arestas com o argumento `rounding=`:

```scad
include <BOSL2/std.scad>
cyl(d=100, l=100, rounding=20);
```

Da mesma forma, você pode chanfrar as arestas com o argumento `chamfer=`:

```scad
include <BOSL2/std.scad>
cyl(d=100, l=100, chamfer=10);
```

Você pode especificar o arredondamento e o chanfro de cada extremidade individualmente (`rounding1`/`rounding2` e `chamfer1`/`chamfer2`):

```scad
include <BOSL2/std.scad>
cyl(d=100, l=100, rounding1=20);
```

```scad
include <BOSL2/std.scad>
cyl(d=100, l=100, chamfer2=10);
```

E você pode até misturar arredondamento e chanfro:

```scad
include <BOSL2/std.scad>
cyl(d=100, l=100, rounding1=20, chamfer2=10);
```

```scad
include <BOSL2/std.scad>
cyl(d=100, l=100, rounding2=20, chamfer1=10);
```

#### Parâmetros do `cyl()`

| Parâmetro                 | Descrição                                                              | Valor padrão |
| ------------------------- | --------------------------------------------------------------------- | ------------ |
| `l` / `h`                 | Altura (comprimento) do cilindro.                                     | —            |
| `r` / `d`                 | Raio / diâmetro do cilindro.                                          | —            |
| `r1` / `d1`               | Raio / diâmetro da base (para cones/troncos).                         | —            |
| `r2` / `d2`               | Raio / diâmetro do topo (para cones/troncos).                         | —            |
| `rounding`                | Arredondamento de ambas as bordas circulares.                         | —            |
| `chamfer`                 | Chanfro de ambas as bordas circulares.                                | —            |
| `rounding1` / `rounding2` | Arredondamento da borda inferior / superior.                          | —            |
| `chamfer1` / `chamfer2`   | Chanfro da borda inferior / superior.                                 | —            |
| `anchor`                  | Ponto de ancoragem em relação à origem (usa as constantes vetoriais). | `CENTER`     |
| `spin`                    | Rotação em torno do eixo Z em graus (após a ancoragem).               | `0`          |
| `orient`                  | Vetor para onde o topo da forma deve apontar.                         | `UP`         |

### Esferas 3D

O BOSL2 sobrescreve o módulo `sphere()` integrado. Ele ainda pode ser usado da forma tradicional:

```scad
include <BOSL2/std.scad>
sphere(r=50);
```

```scad
include <BOSL2/std.scad>
sphere(d=100);
```

Você pode ancorar, girar e orientar `sphere()`s, assim como faz com `cylinder()` e `cube()`:

```scad
include <BOSL2/std.scad>
sphere(d=100, anchor=FRONT);
```

```scad
include <BOSL2/std.scad>
sphere(d=100, anchor=FRONT, spin=30);
```

```scad
include <BOSL2/std.scad>
sphere(d=100, anchor=BOTTOM, orient=RIGHT+TOP);
```

#### Spheroid

O BOSL2 também fornece o módulo `spheroid()`, que aprimora o `sphere()` com recursos como os argumentos `circum=` e `style=`.

Você pode usar `circum=true` para forçar a esfera a circunscrever a esfera ideal, em vez da inscrição padrão:

```scad
include <BOSL2/std.scad>
spheroid(d=100, circum=true);
```

O argumento `style=` escolhe a forma de construção da esfera. O estilo `"orig"` corresponde à construção do `sphere()` integrado:

```scad
include <BOSL2/std.scad>
spheroid(d=100, style="orig", $fn=20);
```

O estilo `"aligned"` garante um vértice em cada extremo dos eixos, desde que `$fn` seja múltiplo de 4:

```scad
include <BOSL2/std.scad>
spheroid(d=100, style="aligned", $fn=20);
```

O estilo `"stagger"` alterna (escalona) a triangulação das linhas verticais:

```scad
include <BOSL2/std.scad>
spheroid(d=100, style="stagger", $fn=20);
```

O estilo `"icosa"` cria triângulos de tamanho aproximadamente igual em toda a superfície, subdividindo um icosaedro. Esse estilo arredonda o `$fn` efetivo para um múltiplo de 5:

```scad
include <BOSL2/std.scad>
spheroid(d=100, style="icosa", $fn=20);
```

O estilo `"octa"` também cria triângulos de tamanho aproximadamente igual, mas subdividindo um octaedro. Ele garante vértices nos extremos dos eixos e arredonda o `$fn` efetivo para um múltiplo de 4:

```scad
include <BOSL2/std.scad>
spheroid(d=100, style="octa", $fn=20);
```

#### Parâmetros do `spheroid()`

| Parâmetro | Descrição                                                                    | Valor padrão |
| --------- | ---------------------------------------------------------------------------- | ------------ |
| `r` / `d` | Raio / diâmetro da esfera.                                                    | —            |
| `circum`  | Se `true`, a esfera circunscreve a esfera ideal em vez de inscrevê-la.       | `false`      |
| `style`   | Estilo de triangulação: `"orig"`, `"aligned"`, `"stagger"`, `"icosa"`, `"octa"`. | `"aligned"`  |
| `$fn`     | Número de segmentos usados para aproximar a esfera.                           | —            |
| `anchor`  | Ponto de ancoragem em relação à origem (usa as constantes vetoriais).        | `CENTER`     |
| `spin`    | Rotação em torno do eixo Z em graus (após a ancoragem).                       | `0`          |
| `orient`  | Vetor para onde o topo da forma deve apontar.                                | `UP`         |
