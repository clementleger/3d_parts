use <../common/roundedcube.scad>;

SWITCH_WIDTH = 16.5;
SWITCH_HEIGHT = 13.5;
SWITCH_DEPTH= 22;
SWITCH_THICKNESS = 2;
SWITCH_HOLE_DIAM = 6.3;

$fn = 20;

/* Main holder */
difference() {
    roundedcube([SWITCH_WIDTH + 2 * SWITCH_THICKNESS, SWITCH_HEIGHT + 2 * SWITCH_THICKNESS, SWITCH_DEPTH + SWITCH_THICKNESS], false, 2, "z");
    translate([SWITCH_THICKNESS, SWITCH_THICKNESS, 0]) cube([SWITCH_WIDTH, SWITCH_HEIGHT, SWITCH_DEPTH], false);
    
    translate([SWITCH_THICKNESS , SWITCH_THICKNESS + SWITCH_HEIGHT/2, SWITCH_DEPTH]) {
        translate([SWITCH_WIDTH/4, 0, 0]) #cylinder(d = SWITCH_HOLE_DIAM, h = SWITCH_THICKNESS);
        translate([SWITCH_WIDTH/4 * 3, 0, 0]) #cylinder(d = SWITCH_HOLE_DIAM, h = SWITCH_THICKNESS);
    }
}