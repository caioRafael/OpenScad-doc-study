include <BOSL2/std.scad>

// linear_extrude(height=1)
// star(n=3, id=10, d=50);

// linear_extrude(height=1)
// star(n=5, id=15, r=25);

// linear_extrude(height=1)
// star(n=10, id=30, d=50);

// Estrela por passo (step)
// linear_extrude(height=1)
// star(n=7, step=2, d=50);

// linear_extrude(height=1)
// star(n=7, step=3, d=50);

// Realinhamento
// linear_extrude(height=1)
// left(30) star(n=5, step=2, d=50);
// linear_extrude(height=1)
// right(30) star(n=5, step=2, d=50, realign=true);

linear_extrude(height=1)
star(n=5, step=2, d=50);
