## Filetes

O filete é uma transição suave em um canto.

É parecido com o arredondamento, mas o objetivo é diferente: o filete existe principalmente para reduzir a concentração de tensão em cantos, muito comum em peças mecânicas.

Existem várias formas de criar filetes no OpenSCAD. Abaixo estão as opções mais usadas, da mais simples à mais próxima de uma peça real.

Os códigos de exemplo estão em [`src/modeling-techniques/fillets`](../src/modeling-techniques/fillets).

### Opção 1 - hull() (mais simples)

Imagine duas esferas separadas no espaço.

```scad
$fn = 50;

hull() {
    translate([0, 0, 0])
        sphere(r = 5);

    translate([20, 0, 0])
        sphere(r = 5);
}
```

O `hull()` cria uma transição suave entre elas, gerando o menor volume convexo que envolve as duas esferas.

Arquivo: [`hull.scad`](../src/modeling-techniques/fillets/hull.scad)

### Opção 2 - minkowski() (arredonda tudo)

```scad
$fn = 50;

minkowski() {
    cube([30, 30, 10]);
    sphere(r = 2);
}
```

Resultado:

- todos os cantos externos ficam arredondados;
- é equivalente a aplicar um raio de 2 mm em todas as arestas.

Desvantagem: é uma operação pesada para renderizar.

Arquivo: [`minkowski.scad`](../src/modeling-techniques/fillets/minkowski.scad)

### Opção 3 - Criando um filete interno manualmente

Suponha que você tenha um canto interno de 90°.

Sem filete:

```
│
│
└──────
```

Podemos preencher esse canto com um quarto de círculo.

```scad
$fn = 80;

difference() {

    square([40,40]);

    translate([10,10])
        square([30,30]);

    // adiciona o filete
    translate([10,10])
        intersection() {
            circle(r=10);
            square([10,10]);
        }
}
```

Depois basta extrudar:

```scad
linear_extrude(height=5)
difference() {

    square([40,40]);

    translate([10,10])
        square([30,30]);

    translate([10,10])
        intersection() {
            circle(r=10);
            square([10,10]);
        }
}
```

Esse é um dos métodos clássicos para criar filetes internos em OpenSCAD puro.

Arquivo: [`internal-fillet.scad`](../src/modeling-techniques/fillets/internal-fillet.scad)

### Como seria no BOSL2

A mesma ideia fica muito mais simples.

```scad
include <BOSL2/std.scad>

cuboid(
    [40,40,20],
    rounding=5
);
```

Ou apenas em algumas arestas:

```scad
include <BOSL2/std.scad>

cuboid(
    [40,40,20],
    rounding=5,
    edges=TOP
);
```

Arquivo: [`bosl2.scad`](../src/modeling-techniques/fillets/bosl2.scad)

### Um exemplo mais próximo de uma peça mecânica

Imagine um suporte em "L".

Sem reforço:

```scad
linear_extrude(10)
polygon([
    [0,0],
    [40,0],
    [40,5],
    [5,5],
    [5,40],
    [0,40]
]);
```

Esse canto interno concentra tensão.

Você pode suavizá-lo adicionando um quarto de círculo:

```scad
$fn = 100;

linear_extrude(10)
union() {
    difference() {
        square([40,40]);
        translate([5,5])
            square([35,35]);
    }

    translate([5,5])
        intersection() {
            circle(r=5);
            square([5,5]);
        }
}
```

O resultado é um canto interno arredondado, reduzindo a concentração de tensão.

Arquivo: [`l-bracket.scad`](../src/modeling-techniques/fillets/l-bracket.scad)
