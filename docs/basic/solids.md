## Commandos de sólidos geometricos

Nessa sessão ficarão os comandos basicos do OpenScad, todos os comandos vão ter a biblioteca do Bosl2 para auxiliar

### Cubo

O comando para adicionar um cubo é simples como está abaixo

```scad
cube([10, 10, 10]);
```

Ele recebe inicialmente um parametro em Array [x, y, y]
x = largura
y = profundidade
z = altura

Outro parametro é o anchor, ele ancora o elemento a partir de uma face ou ponto do modelo.

| Anchor                    | Ponto de referência     |               |
| ------------------------- | ----------------------- | ------------- |
| `CENTER`                  | Centro do objeto        |               |
| `LEFT`                    | Centro da face esquerda |               |
| `RIGHT`                   | Centro da face direita  |               |
| `FRONT`                   | Centro da face frontal  |               |
| `BACK`                    | Centro da face traseira |               |
| `TOP` ou `UP`             | Centro da face superior |               |
| `BOTTOM`, `BOT` ou `DOWN` | Centro da face inferior | ([GitHub][1]) |

[1]: https://github.com/BelfrySCAD/BOSL2/wiki/constants.scad?utm_source=chatgpt.com "constants.scad · BelfrySCAD/BOSL2 Wiki · GitHub"

- também é possivel usar o Bosl2 para criar um cubo

```scad
include <BOSL2/std.scad>

cuboid(size = [10, 10, 10], anchor = BOTTOM);
```

Com esse comando é possivel adicionar mais parametros para estilização do cubo

- rounding, para arredondar as bordas
- edges para definir quais arestas vão ser arredondadas

### Esfera

Comando para adicionar uma esfera.

```scad
sphere(r = 10);
```

Ele recebe o valor r, para definir o tamanho do raio da esfera. Basta usar r = [valor]

Quando se trabalha com objetos arredondados é possivel definir a qunatidade de faces que esse objeto vai ter, para aumentar a perfeição dele.

O $fn é uma variável especial do OpenSCAD que define quantos segmentos serão usados para aproximar curvas e círculos.

```
$fn = 120;
```

| `$fn` | Resultado                                            |
| ----: | ---------------------------------------------------- |
|     6 | Hexágono                                             |
|     8 | Octógono                                             |
|    16 | Baixa qualidade                                      |
|    32 | Boa qualidade                                        |
|    64 | Alta qualidade                                       |
|   100 | Muito alta qualidade                                 |
|  200+ | Quase imperceptível a diferença na maioria dos casos |

### Cilindro

Comando para adicionar um cilindro

```scad
cylinder(h = 10, r = 5);
```

Além do valor de r o cilindro também recebe o valor de h, representando a altura do cilindro.

### Modelos 2d

Os modelos 2d podem se transformar em modelos 3d, importando um svg com import

```scad
import("caminho-do-arquivo.svg");
```

para adicionar uma altura a esse model é utilizado

```scad
linear_extrude(height = 10)
```

### Texto

Para aplicar texto no openScad é utilizado o seguinte comando

```scad
linear_extrude(height = 2)
    text(texto, size = 10, font = "Arial", halign = "center", valign = "center");

```

O linear_extrude é utilizado para dar uma altura ao texto

- Utilizando o Bosl2 ficaria assim

```scad
include <BOSL2/std.scad>

$fn = 120;

texto = "Hello World";

text3d(texto,
    h = 2,
    size = 10,
    font = "Arial",
    anchor = CENTER
);

```
