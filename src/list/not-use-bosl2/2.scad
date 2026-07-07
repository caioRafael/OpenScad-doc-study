// Não usar BOSL2
// Projeto organizador de gaveta

// Dimensões da gaveta
//x
width = 180;
//z
height = 50;
//y
depth = 180;

// Espessura da gaveta
thickness_wall = 2;

horizontal_qtd_boxes = 6;
vertical_qtd_boxes = 3;

min_box_width = width / horizontal_qtd_boxes;
min_box_depth = depth / vertical_qtd_boxes;
min_box_height = height;

module box(width, depth, height) {
    difference() {
        cube([width, depth, height]);
        translate([thickness_wall, thickness_wall, thickness_wall])
            cube([
                width - 2 * thickness_wall, 
                depth - 2 * thickness_wall, 
                height - thickness_wall
            ]);
    }
}

// organizador comum
for(i = [0:horizontal_qtd_boxes-1]) {
    for(j = [0:vertical_qtd_boxes-1]) {
        translate([i * min_box_width, j * min_box_depth, 0])
            box(min_box_width, min_box_depth, min_box_height);
    }
}

// espaço entre os dois organizadores só para visualização
gap_between_layouts = 40;

// organizador com caixas de tamanhos variados
// cada caixa é definida em unidades da grade: [coluna, linha, colunas_ocupadas, linhas_ocupadas]
// a grade tem horizontal_qtd_boxes colunas x vertical_qtd_boxes linhas,
// então o tamanho total da gaveta continua o mesmo
mixed_boxes = [
    [0, 0, 2, 2], // caixa grande (dobro na largura e na profundidade)
    [2, 0, 2, 1], // dobro só na largura
    [4, 0, 2, 1], // dobro só na largura
    [2, 1, 1, 1], // padrão
    [3, 1, 1, 1], // padrão
    [4, 1, 2, 1], // dobro só na largura
    [0, 2, 3, 1], // triplo na largura
    [3, 2, 3, 1]  // triplo na largura
];

translate([0, depth + gap_between_layouts, 0])
for(b = mixed_boxes) {
    translate([b[0] * min_box_width, b[1] * min_box_depth, 0])
        box(
            b[2] * min_box_width,
            b[3] * min_box_depth,
            min_box_height
        );
}