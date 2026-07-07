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
