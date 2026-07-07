path = "../../../public/3dev.png";

// surface(file = path, invert = true);

union(){

    cube([100,100,2]);

    translate([0,0,2])

        surface(file = path);

}