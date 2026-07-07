include <BOSL2/std.scad>

// linear_extrude(height=1)
// glued_circles(d=30, spread=40);

// linear_extrude(height=1)
// glued_circles(d=30, spread=30, tangent=45);

// linear_extrude(height=1)
// glued_circles(d=30, spread=30, tangent=-20);

// Parede com nervuras
// $fn=36;  s=10;
// linear_extrude(height=50,convexity=16,center=true)
//     xcopies(s*sqrt(2),n=3)
//         glued_circles(d=s, spread=s*sqrt(2), tangent=45);

linear_extrude(height=1)
glued_circles(d=30, spread=40, tangent=45);
