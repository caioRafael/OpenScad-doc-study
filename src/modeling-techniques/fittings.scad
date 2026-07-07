folga = 0.25;

encaixe = 20;

cube(encaixe);

translate([encaixe + folga,0,0])
difference() {
    cube(encaixe + folga*2);
    cube(encaixe);
}