module L(){
    union(){
    cube([20,10,10]);
        cube([10,25,10]);
    }
}

difference(){
    L();
    cube([10,5,10]);
}