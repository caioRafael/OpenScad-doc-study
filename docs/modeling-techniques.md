## Técnicocas de modelagem

Nesse módulo vamos focar em modelar peças por meio dos comandos do OpenScad.

### Paredes

Quase nenhuma peça é um bloco maciço.

Em vez disso(um bloco maciço):

```
██████████
██████████
██████████
```

Criamos uma casca.

```
██████████
██      ██
██      ██
██████████
```

No OpenSCAD:

```scad
difference() {

    cube([100,80,40]);

    translate([2,2,2])
        cube([96,76,38]);

}
```

Esse padrão aparece em:

- caixas
- porta-lápis
- organizadores
- vasos
- embalagens

### Cantos arredondados

Em impressão 3D quase nunca fazemos:

```
┌────┐
│    │
└────┘
```

Preferimos

```
╭────╮
│    │
╰────╯
```

Por quê?

- mais resistente
- mais bonito
- imprime melhor
- menos concentração de tensão

No OpenSCAD puro:

- minkowski()
- hull()

No BOSL2:

```scad
cuboid(
    [100,80,30],
    rounding=5
);
```

Muito mais eficiente.

### Furos paramétricos

Nunca faça:

```
cylinder(r=2);
```

Faça:

```
parafuso_m4 = 4.3;

difference() {

    cube(20);

    cylinder(
        h=30,
        d=parafuso_m4
    );

}
```

Assim você pode trocar um único valor e toda a peça se adapta.

### Encaixes

Essa é uma habilidade muito importante.

Imagine duas peças.

```
Peça A

█████

Peça B

█████
```

Elas nunca devem ter exatamente o mesmo tamanho.

Sempre existe folga.

```
Peça A

20 mm

Peça B

20.25 mm
```

Essa folga depende da impressora.

Normalmente:

```
0.15

0.20

0.25

0.30 mm
```

Exemplo

```
folga = 0.25;

encaixe = 20;

cube(encaixe);

cube(encaixe + folga);
```

### Nervuras

Ao invés de aumentar toda a espessura da peça.

Faça isso.

```
██████████

██████████

██│││││██

██│││││██
```

As nervuras aumentam muito a rigidez usando pouco material.

Exemplo

```scad
cube([100,2,20]);
```

Colocado na parte interna de uma caixa.

### Reforços (Gussets)

Imagine isso.

```

│

│

└──────
```

Esse canto quebra facilmente.

Agora:

```
│

│\

│ \

└───
```

Muito mais resistente.

É chamado de gusset.

Pode ser feito com:

```
hull()
```

ou

```
polygon()

linear_extrude()
```

Um exemplo de reforço

```scad
hull() {
cube([5,5,30]);
cube([30,5,5]);
}
```

### Chanfros

Ao invés de

```
┌
```

fazemos

```
╱
```

Serve para:

Serve para:

- facilitar encaixe
- melhorar estética
- reduzir material

No BOSL2:

```
cuboid(
chamfer=2
);
```

### Filetes

É parecido com arredondamento.

Mas o objetivo é diferente.

Imagine:

```

│

│

└────
```

Esse canto concentra tensão.

Com filete:

```
│

│)

└────
```

A distribuição da força melhora.

Muito usado em peças mecânicas.

Existem várias formas de criar filetes no OpenSCAD (`hull()`, `minkowski()`, filetes internos manuais e BOSL2). Veja todas as opções com exemplos em [Filetes](./fillets.md).

### Modelagem paramétrica

Esse é o mais importante.

Nunca escreva:

```
cube([84,52,30]);
```

Prefira:

```
largura = 84;
altura = 30;
profundidade = 52;

cube([
    largura,
    profundidade,
    altura
]);
```

Melhor ainda:

```
espessura = 2;

largura = 84;

altura = 30;

profundidade = 52;

cube([
    largura,
    profundidade,
    altura
]);

translate([
    espessura,
    espessura,
    espessura
])

cube([
    largura-espessura*2,
    profundidade-espessura*2,
    altura
]);
```

Agora basta alterar:

```
largura = 120;
```

e toda a peça continua funcionando.

### O pensamento de um modelador

Quando você vê um objeto, em vez de pensar:

"Como faço esse formato?"

Pense:

1. Qual é a forma base?
   1.1 Cubo?
   1.2 Cilindro?
   1.3 Extrusão de um SVG?

2. O que precisa ser removido?
   2.1 Furos?
   2.2 Cavidades?
   2.3 Rasgos?

3. O que precisa ser adicionado?
   3.1 Nervuras?
   3.2 Guias?
   3.4 Encaixes?

4. O que deve ser parametrizado?
   4.1 Espessura
   4.2 Altura
   4.3 Folga
   4.4 Raio
   4.5 Quantidade

Esse raciocínio torna seus modelos muito mais reutilizáveis.
