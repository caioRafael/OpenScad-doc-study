include <BOSL2/std.scad>

linear_extrude(height=1)
right_triangle([40,30]);

linear_extrude(height=1)
xflip() right_triangle([40,30]);

linear_extrude(height=1)
yflip() right_triangle([40,30]);

linear_extrude(height=1)
xflip() yflip() right_triangle([40,30]);