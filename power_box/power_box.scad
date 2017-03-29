include <../common/roundedcube.scad>
include <../common/prism.scad>

PLUG_WIDTH = 27;
PLUG_HEIGHT = 19;
PLUG_SCREW_DIAMETER = 3;
PLUG_SCREW_SPACE = 42 - PLUG_SCREW_DIAMETER; 

TOLERANCE = 0.2;

BUTTON_WIDTH = 29;
BUTTON_HEIGHT = 22;

BOX_WIDTH = BUTTON_WIDTH + 24;
BOX_HEIGHT = BUTTON_HEIGHT + 10;
BOX_LENGTH = 70;

BOX_RADIUS = 2;

FIX_WIDTH = 15;
FIX_HEIGHT = 10;

CABLE_DIAMETER = 6;

BOX_WALL_THICKNESS = 2;


module cable_hole () {
    color("green") translate([0,BOX_LENGTH / 2,CABLE_DIAMETER/2]) rotate([0, 90, 0]) 
    union () {
        cylinder(d = CABLE_DIAMETER, h = BOX_WALL_THICKNESS * 2);
        translate([0, -CABLE_DIAMETER/2, -1]) cube([CABLE_DIAMETER, CABLE_DIAMETER, BOX_WALL_THICKNESS * 2]);
    }
}


module fix_part() {
    color("blue") {
        difference () {
            cube([FIX_WIDTH, FIX_HEIGHT, BOX_WALL_THICKNESS]);
            translate ([FIX_WIDTH / 2, FIX_HEIGHT / 2, -0.2]) cylinder(d = PLUG_SCREW_DIAMETER, h = BOX_WALL_THICKNESS);
        }
        translate([0, 0, BOX_WALL_THICKNESS]) prism(BOX_WALL_THICKNESS, FIX_HEIGHT, FIX_HEIGHT / 3 * 2);
        translate([FIX_WIDTH - BOX_WALL_THICKNESS, 0, BOX_WALL_THICKNESS]) prism(BOX_WALL_THICKNESS, FIX_HEIGHT, FIX_HEIGHT / 3 * 2);
    }
}


module main_box() {
    difference () {
        roundedcube([BOX_WIDTH, BOX_LENGTH, BOX_HEIGHT], center = false, radius = BOX_RADIUS, apply_to = "zmax");
        translate([BOX_WALL_THICKNESS, BOX_WALL_THICKNESS, 0]) cube([BOX_WIDTH - 2 * BOX_WALL_THICKNESS, BOX_LENGTH - 2 * BOX_WALL_THICKNESS, BOX_HEIGHT - BOX_WALL_THICKNESS] );
        
        translate([BOX_WIDTH/2 - BUTTON_WIDTH / 2, BOX_LENGTH - BOX_WALL_THICKNESS, BOX_HEIGHT/2 - BUTTON_HEIGHT / 2]) cube([BUTTON_WIDTH, BOX_WALL_THICKNESS, BUTTON_HEIGHT]);

        translate([BOX_WIDTH/2 - PLUG_WIDTH / 2, 0, BOX_HEIGHT/2 - PLUG_HEIGHT / 2]) cube([PLUG_WIDTH, BOX_WALL_THICKNESS, PLUG_HEIGHT]);
        
        translate([0, BOX_WALL_THICKNESS, BOX_HEIGHT / 2]) {
        translate ([PLUG_SCREW_SPACE / 2 + BOX_WIDTH/2, 0, 0]) rotate ([90, 0, 0])color("green") cylinder(d = PLUG_SCREW_DIAMETER + TOLERANCE, h = BOX_WALL_THICKNESS);
        translate ([BOX_WIDTH/2 - PLUG_SCREW_SPACE / 2, 0, 0]) rotate ([90, 0, 0])color("green") cylinder(d = PLUG_SCREW_DIAMETER + TOLERANCE, h = BOX_WALL_THICKNESS);
        }
    }
}


union () {
    difference () {
        main_box();
        cable_hole();
    }
    translate ([-FIX_HEIGHT, FIX_WIDTH + BOX_RADIUS, 0]) rotate([0, 0, -90]) fix_part();
    translate ([-FIX_HEIGHT, FIX_WIDTH + BOX_WIDTH, 0]) rotate([0, 0, -90]) fix_part();
    translate ([BOX_WIDTH + FIX_HEIGHT, BOX_WIDTH, 0]) rotate([0, 0, 90]) fix_part();
    translate ([BOX_WIDTH + FIX_HEIGHT,  BOX_RADIUS, 0]) rotate([0, 0, 90]) fix_part();
}

