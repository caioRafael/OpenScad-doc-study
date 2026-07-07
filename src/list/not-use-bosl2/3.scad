// Não usar BOSL2
// Projeto porta lápis parametricos

// Dimenssões do porta lápis redondo

diameter = 80;

height = 100;

lid_thickness = 3;

$fn = 100;
difference() {
    cylinder(h = height, d = diameter);
    translate([0, 0, lid_thickness])
        cylinder(h = height + 2, d = diameter - 2 * lid_thickness);
}