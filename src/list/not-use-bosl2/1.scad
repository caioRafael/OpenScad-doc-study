// Não usar BOSL2
// Projeto: Caixa de com tampa

// Dimensões da caixa
//x
width = 100;
//z
height = 100;
//y
depth = 100;

lid_height = 10;
lid_thickness = 2;
lid_width = width + 5 * lid_thickness;
lid_depth = depth + 5 * lid_thickness;

// Espessura da caixa
thickness_wall = 2;

//Caixa
difference() {
    cube([width, depth, height]);
    color("red")
    translate([thickness_wall, thickness_wall, thickness_wall]) 
        cube([
            width - 2 * thickness_wall,
            depth - 2 * thickness_wall,
            height - thickness_wall
        ]);
};

// Tampa
rotate([180, 0, 0])
translate([ 0, 2, -10 ])
difference(){
cube([lid_width, lid_depth, lid_height ]);
color("red")
translate([lid_thickness, lid_thickness, -lid_thickness])
    cube([lid_width-2*lid_thickness, lid_depth-2*lid_thickness, lid_height]);
};