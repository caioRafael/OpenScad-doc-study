include <BOSL2/std.scad>

cuboid(
    [40,40,20],
    rounding=5
);

// apenas em algumas arestas:
// cuboid(
//     [40,40,20],
//     rounding=5,
//     edges=TOP
// );
