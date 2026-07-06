include <BOSL2/std.scad>

// cylinder_radius = 5;
// cylinder_height = 10;

// cylinder(h = cylinder_height, r = cylinder_radius, anchor = BOTTOM);

// texto = "Olá mundo";
// echo(texto);

lado = 20;
lacuna = 5;
qtd_cubos = 5;
passo = 2;


module cubo(lado) {
    cube([lado, lado, lado]);
}

module lista_cubos(qtd_cubos, lado, lacuna, passo) {
    for (i = [qtd_cubos-1:-passo:0]) {
        translate([i * (lado + lacuna), 0, 0])
            cubo(lado);
    }
}

lista_cubos(qtd_cubos, lado, lacuna, passo);