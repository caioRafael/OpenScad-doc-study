include <BOSL2/std.scad>

// Arredondamento e chanfro
// cuboid([100,80,60], rounding=20);
// cuboid([100,80,60], chamfer=10);

// Arredondar arestas de uma face / canto / aresta
// cuboid([100,80,60], rounding=20, edges=TOP);
// cuboid([100,80,60], rounding=20, edges=RIGHT+FRONT+TOP);
// cuboid([100,80,60], rounding=10, edges=FRONT+TOP);

// Arredondar arestas de um eixo
// cuboid([100,80,60], rounding=10, edges="Z");

// Lista de arestas
// cuboid([100,80,60], rounding=10, edges=[TOP,"Z",BOTTOM+RIGHT]);

// Exceto arestas
// cuboid([100,80,60], rounding=10, except_edges=BOTTOM+RIGHT);
// cuboid([100,80,60], chamfer=10, edges=[TOP,FRONT], except_edges=TOP+FRONT);

cuboid([100,80,60], rounding=20);
