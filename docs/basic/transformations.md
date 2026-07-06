## Transformações

transformações são o assunto mais importante do OpenSCAD. Você pode pensar nelas como o equivalente ao sistema de coordenadas de uma engine 3D (como Unity ou Blender): elas não alteram a geometria do objeto, apenas sua posição, orientação ou tamanho.

### Translation

O comando translation move o objeto 3d no sistema de coordenadas dos eixos x,y,z

```scad
translate([30,0,0])
    cube(10);
```

### Rotate

O Comando rotate faz com que o objeto rotacione pelos seus eixos

```scad
rotate([45,-45,45])
    cube(20);
```

### Scale

O comando scale permite aumentar ou diminuir a escala do objeto

```scad
scale([2,1,1])
    cube(10);
```

Como reultado dessa transformação, ocorre a multplica os valores das domensões do objeto, sendo assim o resultado será um cubo com as dimensões:

```
20 × 10 × 10
```

Utilizar valores menores que 0 fazem com que o objeto diminua de tamanho

### Mirror

O comando mirror espelha o objeto em que ele está sendo aplicado

```scad
mirror([1,0,0])
    text("A");
```

### Resize

Diferente do scale, o resize muda diretamente os valores de demoensões do objeto, não há uma multiplicação, há apenas uma troca de valores

```scad
resize([20,40,60])
    cube(10);
```

### Multimatrix

É uma transformação poderosa

É aplicada em uma matriz 4x4

Com ela você consegue fazer qualquer transformação:

- mover
- girar
- escalar
- cisalhar (shear)
- combinar tudo

Entretanto, é um recurso avançado e raramente necessário em modelagem comum.

```scad
multmatrix([
    [...],
    [...],
    [...],
    [...]
])
```

### Color

O color é o mais simples, ele aplica uma cor ao objeto.

```scad
color("red")
    cube(20);
```

ele também aceita hexadecimal

```scad
color("#2196F3")
```

ou rgba

```scad
color([1,0,0,0.5])
```

### Encadeamento de transformações

As transformações podem ser encadeadas um atras da outra de modo que todas sejam aplciadas em um mesmo objeto

```scad
translate([20,0,0])
rotate([0,0,45])
scale(2)

cube(10);
```

Isso significa:

1. Escalar o cubo.
2. Rotacionar o cubo.
3. Mover o cubo.

### Ordem das transformações

As transformações são aplicadas na ordem que declaradas.
Pegando o exemplo do item anterior o item irá serguir a seguinte ordem de transformações:

1. Mover o cubo.
2. Rotacionar o cubo.
3. Escalar o cubo.

### Hierarquia

A hierarquia das transformações implica que as transformações feitas em objetos pais afetam, também, os objetos filhos

```scad
translate([50,0,0]) {

    cube(10);

    translate([20,0,0])
        sphere(5);

}
```

O resultado será:

- O cubo em x = 50.
- A esfera em x = 70 (20 da transformação interna + 50 da externa).
