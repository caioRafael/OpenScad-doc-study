include <BOSL2/std.scad>
linear_extrude(height=1)
// square(50, center=true)
//     #square(50, spin=45, center=true);

// square(50, center=true)
//     #square([20,40], anchor=FWD);

square(50, center=true)
    position(BACK)
        #square(25, spin=45, center=true);