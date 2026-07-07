// Não usar BOSL2
// Molde para brigadeiro

use <../../../fonts/Nunito.ttf>

// A ideia é criar um molde resondular para brigadeiro

diameter = 60;

diameter_border = 15;

text_1 = "F e l i z";
text_2 = "dia dos";
text_3 = "PAIS";

text_size = 12;

module base_border(){
    $fn = 100;
    circle(d = diameter_border);
}


module union_base_border(){
    count = 20;
    radius = diameter / 2;

    for(i = [0:count - 1]){
    angle = i * 360 / count;
    translate([radius * cos(angle), radius * sin(angle), 0])
        base_border();
    }
}

module base(){
    union(){
        union_base_border();
        circle(d = diameter);
    };
}

module border(border_height = 5){
    linear_extrude(height = border_height)
    difference(){
        offset(r = 1){
            base();
        }
        base();
    }
}

module molde(molde_height = 1){
    union(){
    linear_extrude(height = molde_height)
        base();
    border(border_height = molde_height + 5);

    linear_extrude(height = molde_height + 5)
        translate([0, 15, 0])
        text(text_1, font = "Nunito", size = text_size - 1, halign = "center", valign = "center");
    linear_extrude(height = molde_height + 5)
        translate([0, 0, 0])
        text(text_2, font = "Nunito", size = text_size - 2, halign = "center", valign = "center");
    linear_extrude(height = molde_height + 5)
        translate([0, -15, 0])
        difference(){
            offset(r = 1)
                text(text_3, font = "Nunito", size = text_size + 2, halign = "center", valign = "center");
            text(text_3, font = "Nunito", size = text_size + 2, halign = "center", valign = "center");
        }
    }
}

// folga entre o molde e o cortador
cutter_gap = 0.5;
// espessura da parede do cortador
cutter_wall = 1;

module cortador(){
    linear_extrude(height = 60)
    difference(){
        offset(r = 1 + cutter_gap + cutter_wall){
            base();
        }
        offset(r = 1 + cutter_gap){
            base();
        }
    }
}

molde(molde_height = 50);
translate([diameter + 2 * diameter_border + 2 * cutter_gap + 2 * cutter_wall, 0, 0])
cortador();
