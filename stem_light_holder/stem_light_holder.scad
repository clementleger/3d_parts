include <../common/roundedcube.scad>

Z_STEM_OFFSET = 5;

HANDLE_BAR_DIAMETER = 32;
HANDLE_BAR_STEM_WIDTH = 52;
HANDLE_BAR_STEM_HEIGHT = 54;

STEM_WIDTH = 34;
STEM_HEIGHT = 44;
STEM_LENGTH = 100;

CLAMPING_COLAR_WIDTH = 5;
CLAMPING_COLAR_HEIGHT = 2;

THICKNESS = 4;
SIDE_THICKNESS = 2;

$fn = 20;


/* GENERATED */
UPPER_THICKNESS = (HANDLE_BAR_STEM_HEIGHT - HANDLE_BAR_DIAMETER) / 2 + 3;

SIDE_HOLDER_WIDTH = CLAMPING_COLAR_WIDTH + 2 * SIDE_THICKNESS;
SIDE_HOLDER_HEIGHT = HANDLE_BAR_DIAMETER / 2 + UPPER_THICKNESS;

/* Modelize headset */
module headset_model() {
    color("blue") union () {
        rotate([90, 0, 0]) cylinder(d = HANDLE_BAR_DIAMETER, h = 300, center = true);
        hull() {
        /* handle bar stem dimensions */
        roundedcube([HANDLE_BAR_STEM_HEIGHT, HANDLE_BAR_STEM_WIDTH, HANDLE_BAR_STEM_HEIGHT], center = true, radius= 5, apply_to = "all");

         translate([-HANDLE_BAR_STEM_WIDTH / 2, 0, 0]) roundedcube([50, STEM_WIDTH, STEM_HEIGHT], center = true, radius= 5, apply_to = "all");  
          
        }
        translate([-HANDLE_BAR_STEM_WIDTH / 2 - 20 , 0, 0]) roundedcube([100, STEM_WIDTH, STEM_HEIGHT], center = true, radius= 5, apply_to = "all");
    }
}

module side_holder() {
    color("orange")
    translate([0, HANDLE_BAR_STEM_WIDTH /2 + SIDE_HOLDER_WIDTH / 2 + 1,  SIDE_HOLDER_HEIGHT / 2 - 2]) 
    difference() {
    cube ([HANDLE_BAR_DIAMETER + 2 * THICKNESS, CLAMPING_COLAR_WIDTH + 2 * SIDE_THICKNESS, SIDE_HOLDER_HEIGHT], center = true );
    translate([0, 0, - SIDE_HOLDER_HEIGHT / 2 + HANDLE_BAR_DIAMETER / 2 + CLAMPING_COLAR_HEIGHT]) cube([HANDLE_BAR_DIAMETER + 2 * THICKNESS, CLAMPING_COLAR_WIDTH, CLAMPING_COLAR_HEIGHT], center = true);
    }
}

translate([-60, 0, HANDLE_BAR_STEM_HEIGHT / 4]) 
difference() {
    cube([SIDE_HOLDER_WIDTH, STEM_WIDTH + 2 * THICKNESS, HANDLE_BAR_STEM_HEIGHT / 2 + 2], center = true);
    translate([0, 0, HANDLE_BAR_STEM_HEIGHT / 4 - THICKNESS / 2])cube([CLAMPING_COLAR_WIDTH, STEM_WIDTH + 2 * THICKNESS, CLAMPING_COLAR_HEIGHT], center = true);
}

headset_model();
side_holder();
mirror([0, 1,  0]) side_holder();
