include <BOSL2/std.scad>

// $fn = 120;

// texto = "Hello World";

// text3d(texto,
//     h = 2,
//     size = 10,
//     font = "Arial",
//     anchor = CENTER
// );

// cube([15, 15, 10], anchor = BOTTOM);

cuboid(size = [50, 50, 10], anchor = BOTTOM, rounding = 4, edges = TOP);

// sphere(r = 10, anchor = BOTTOM);

// $fn = 120;
// cylinder(h = 10, r = 5);

// polyhedron(
//     points=[
//         [0,0,0],
//         [20,0,0],
//         [20,20,0],
//         [0,20,0],
//         [10,10,20]
//     ],
//     faces=[
//         [0,1,2,3],
//         [0,1,4],
//         [1,2,4],
//         [2,3,4],
//         [3,0,4]
//     ]
// );

// linear_extrude(height = 10) 
// import("../../assets/models/cube.stl");