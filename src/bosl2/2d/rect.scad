include <BOSL2/std.scad>
linear_extrude(height=1)
// rect([60,40], rounding=10);
// rect([60,40], chamfer=10);
rect([60,40], rounding=[5,0,10,0], chamfer=[0,5,0,15]);