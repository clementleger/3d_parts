include <../common/roundedcube.scad>
include <../common/prism.scad>

HOLE_WIDTH = 6.8;
HOLE_HEIGHT = 5.5;
CORNER_SIZE = 10;
CORNER_THICKNESS = 2;

CLIP_CENTER_OFFSET = 10;

PHONE_WIDTH = 72;
PHONE_THICKNESS = 7;

SUPPORT_WIDTH = PHONE_WIDTH + CORNER_THICKNESS * 2;
SUPPORT_HEIGHT = 80;
SUPPORT_THICKNESS = 4.6;
CLIP_THICKNESS = SUPPORT_THICKNESS / 2;
CLIP_HEIGHT = HOLE_HEIGHT / 2;
CLIP_HOLE_WIDTH = HOLE_WIDTH * 2;

CLIP_X_SPACING = 36.24 - HOLE_HEIGHT;
CLIP_Y_SPACING = 23.75;

module support_hole () {
    cube([HOLE_WIDTH + 0.01, HOLE_HEIGHT, SUPPORT_THICKNESS]);
    translate ([HOLE_WIDTH, 0, CLIP_THICKNESS]) {
             cube([HOLE_WIDTH, HOLE_HEIGHT, SUPPORT_THICKNESS - CLIP_THICKNESS]);   
    }
    
    translate ([HOLE_WIDTH, 0, 0]) {
        cube([HOLE_WIDTH, CLIP_HEIGHT, CLIP_THICKNESS]);   
        translate ([HOLE_WIDTH/2, CLIP_HEIGHT, 0]) scale([1, 0.5, 1]) cylinder(d = 1.5, h = CLIP_THICKNESS);
   }
}

// Main support
module main_backplane() {
difference() {
    roundedcube ([SUPPORT_WIDTH, SUPPORT_HEIGHT, SUPPORT_THICKNESS], center = false, radius = 0.4, apply_to = "zmin");
    translate([- CLIP_HOLE_WIDTH / 4, CLIP_CENTER_OFFSET, 0]) {
        translate([SUPPORT_WIDTH / 2 - CLIP_HOLE_WIDTH / 2 - CLIP_X_SPACING / 2, SUPPORT_HEIGHT / 2 - HOLE_HEIGHT / 2 - CLIP_Y_SPACING / 2, 0]) support_hole();
        translate([SUPPORT_WIDTH / 2 - CLIP_HOLE_WIDTH / 2 + CLIP_X_SPACING / 2, SUPPORT_HEIGHT / 2 - HOLE_HEIGHT / 2 - CLIP_Y_SPACING / 2, 0]) support_hole();

        translate([SUPPORT_WIDTH / 2 - CLIP_HOLE_WIDTH / 2 + CLIP_X_SPACING / 2, SUPPORT_HEIGHT / 2 - HOLE_HEIGHT / 2 + CLIP_Y_SPACING / 2, 0]) mirror([0, 1, 0])support_hole();
        translate([SUPPORT_WIDTH / 2 - CLIP_HOLE_WIDTH / 2 - CLIP_X_SPACING / 2, SUPPORT_HEIGHT / 2 -   HOLE_HEIGHT / 2 + CLIP_Y_SPACING / 2, 0]) mirror([0, 1, 0])support_hole();
    }
}
}
RADIUS = 0.4;
// Corners
module corners() {
    translate([0, 0, SUPPORT_THICKNESS]) {

        roundedcube([CORNER_SIZE, CORNER_THICKNESS, PHONE_THICKNESS + CORNER_THICKNESS], center = false, radius = RADIUS, apply_to = "zmax");

        roundedcube([CORNER_THICKNESS, SUPPORT_HEIGHT, PHONE_THICKNESS + CORNER_THICKNESS], center = false, radius = RADIUS, apply_to = "zmax");
        
                color("blue") translate ([CORNER_THICKNESS - RADIUS, RADIUS, PHONE_THICKNESS]) rotate([90, 0, 90]) prism(SUPPORT_HEIGHT - RADIUS * 2, CORNER_THICKNESS, CORNER_THICKNESS + 0.5);
    }
}
main_backplane();
corners();
translate([SUPPORT_WIDTH, 0 , 0]) mirror([1, 0, 0]) corners();
