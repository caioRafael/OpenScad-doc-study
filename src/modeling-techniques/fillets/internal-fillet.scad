$fn = 80;

linear_extrude(height=5)
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
