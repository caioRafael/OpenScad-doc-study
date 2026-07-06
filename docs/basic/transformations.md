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
