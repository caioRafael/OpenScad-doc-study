include <BOSL2/std.scad>

// cube(100);
// cube(100, center=true);
// cube([50,40,20], center=true);

// Ancoragem em faces, arestas e cantos
// cube([50,40,20], anchor=BOTTOM);
// cube([50,40,20], anchor=TOP+BACK);
// cube([50,40,20], anchor=TOP+FRONT+LEFT);

// Rotacao e orientacao
// cube([50,40,20], anchor=FRONT, spin=30);
// cube([50,40,20], orient=UP+BACK+RIGHT);

cube([50,40,20], anchor=FRONT, spin=45, orient=UP+FWD+RIGHT);
