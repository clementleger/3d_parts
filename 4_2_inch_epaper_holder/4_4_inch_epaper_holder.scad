use <../common/roundedcube.scad>

SCREEN_WIDTH = 86;
SCREEN_HEIGHT  = 64;

BOX_TOP_HEIGHT = 8;
BOX_BOTTOM_HEIGHT = 26; 
BOX_SIDE_WIDTH = 13;
BOX_ANGLE = 7.5;
BOX_DEPTH = 28;

BOX_FULL_HEIGHT =  SCREEN_HEIGHT + BOX_BOTTOM_HEIGHT + BOX_TOP_HEIGHT;
BOX_FULL_WIDTH = SCREEN_WIDTH + 2 * BOX_SIDE_WIDTH;
BOX_THICKNESS = 2;

ROUNDING = 0.7;

RAIL_BOTTOM_WIDTH = 5;
RAIL_TOP_WIDTH = 6;
RAIL_THICKNESS= 3;

FEET_ADDITIONNAL_WIDTH = 5;
FEET_THICKNESS = 6;
FEET_LENGTH = BOX_DEPTH * 2 + FEET_ADDITIONNAL_WIDTH;
FEET_WIDTH = BOX_FULL_WIDTH + 2 * ROUNDING + 2 * FEET_ADDITIONNAL_WIDTH;
BOX_BOTTOM_THICKNESS = FEET_THICKNESS + 5;

BLOCKER_HEIGHT = 3;
BLOCKER_THICKNESS = 0.5;

module clipping_rails(width1, width2, height, thickness) {
    linear_extrude(height = thickness)  polygon(points = [[-width1/2, 0],[width1/2, 0],[width2/2, height],[-width2/2, height]]);
}

module box_feet(rail_offset=0, thickness = FEET_THICKNESS) {
    translate([- FEET_WIDTH/2 + BOX_FULL_WIDTH/2, 0, 0]) roundedcube([FEET_WIDTH, FEET_THICKNESS, FEET_LENGTH], false, ROUNDING, "ymax") ;
    translate([BOX_FULL_WIDTH / 4, FEET_THICKNESS - 0.1, BOX_THICKNESS * 2+ rail_offset]) clipping_rails(RAIL_BOTTOM_WIDTH, RAIL_TOP_WIDTH, RAIL_THICKNESS, BOX_DEPTH);
    translate([BOX_FULL_WIDTH / 4 * 3, FEET_THICKNESS - 0.1, BOX_THICKNESS * 2 + rail_offset]) clipping_rails(RAIL_BOTTOM_WIDTH, RAIL_TOP_WIDTH, RAIL_THICKNESS, BOX_DEPTH);
}

$fn = 30;
module button_full(width, height, thickness) { 
    cube([width, thickness, height/3 * 2]);
    translate([width/2, 0, height/3 * 2]) rotate([-90, 0, 0]) cylinder(d = width, h = thickness);
}

module button_cut(width, height, thickness) {
    difference() {
        button_full(width, height, thickness);
        translate([1/2, 1, 0]) button_full(width - 1, height - 0.5, thickness);
    }
}

module main_box_case_without_rail () {
    roundedcube([BOX_FULL_WIDTH, BOX_BOTTOM_HEIGHT, BOX_THICKNESS], false, ROUNDING, "zmin");
    roundedcube([BOX_SIDE_WIDTH, BOX_FULL_HEIGHT , BOX_THICKNESS], false, ROUNDING, "zmin");
    translate([BOX_FULL_WIDTH - BOX_SIDE_WIDTH, 0, 0]) roundedcube([BOX_SIDE_WIDTH, BOX_FULL_HEIGHT , BOX_THICKNESS], false, ROUNDING, "zmin");
    translate([0, BOX_FULL_HEIGHT - BOX_TOP_HEIGHT, 0]) roundedcube([BOX_FULL_WIDTH, BOX_TOP_HEIGHT, BOX_THICKNESS], false, ROUNDING, "zmin");
 
    /* Bottom side */
    roundedcube([BOX_FULL_WIDTH, BOX_BOTTOM_THICKNESS, BOX_DEPTH], false, ROUNDING, "ymin");
    translate([0, BOX_BOTTOM_THICKNESS, BOX_DEPTH - BLOCKER_HEIGHT - BOX_THICKNESS]) cube([BOX_FULL_WIDTH, BLOCKER_THICKNESS, BLOCKER_HEIGHT]);
       
    /* Left side */
    roundedcube([BOX_THICKNESS, BOX_FULL_HEIGHT, BOX_DEPTH], false, ROUNDING, "xmin");

    /* Right side */
    translate([BOX_FULL_WIDTH - BOX_THICKNESS, 0, 0]) roundedcube([BOX_THICKNESS, BOX_FULL_HEIGHT , BOX_DEPTH], false, ROUNDING, "xmax");
    translate([0, BOX_FULL_HEIGHT - BOX_THICKNESS, 0]) {
        roundedcube([BOX_FULL_WIDTH, BOX_THICKNESS, BOX_DEPTH], false, ROUNDING, "ymax");
        translate([0, -BOX_THICKNESS/2 + BLOCKER_THICKNESS, BOX_DEPTH - BLOCKER_HEIGHT - BOX_THICKNESS]) cube([BOX_FULL_WIDTH, BLOCKER_THICKNESS, BLOCKER_HEIGHT]);
    }
}

BUTTON_WIDTH = 10;
BUTTON_HEIGHT = 15;
BUTTON_THICKNESS = BOX_THICKNESS + 0.1;
BUTTON_SPACING = 5;

BUTTON_BOTTOM_OFFSET = BOX_FULL_HEIGHT/4;

module main_box_case () {
    difference() {
        main_box_case_without_rail();
        rotate([-BOX_ANGLE, 0, 0]) translate([0, -FEET_THICKNESS + ROUNDING, 0]) translate([0, 0, -ROUNDING]) box_feet(0, FEET_THICKNESS);

        translate([BOX_THICKNESS, BUTTON_BOTTOM_OFFSET, BOX_THICKNESS * 4])  rotate([0, 0, 90]) button_cut(BUTTON_WIDTH, BUTTON_HEIGHT, BUTTON_THICKNESS);
        translate([BOX_THICKNESS, BUTTON_BOTTOM_OFFSET + BUTTON_WIDTH + BUTTON_SPACING, BOX_THICKNESS * 4]) rotate([0, 0, 90]) button_cut(BUTTON_WIDTH, BUTTON_HEIGHT, BUTTON_THICKNESS);
        translate([BOX_THICKNESS, BUTTON_BOTTOM_OFFSET + 2 * BUTTON_WIDTH + 2 * BUTTON_SPACING, BOX_THICKNESS * 4]) rotate([0, 0, 90]) button_cut(BUTTON_WIDTH, BUTTON_HEIGHT, BUTTON_THICKNESS);
        translate([BOX_THICKNESS, BUTTON_BOTTOM_OFFSET + 3 * BUTTON_WIDTH + 3 * BUTTON_SPACING, BOX_THICKNESS * 4]) rotate([0, 0, 90]) button_cut(BUTTON_WIDTH, BUTTON_HEIGHT, BUTTON_THICKNESS);

    }
}

BACKCOVER_WIDTH = BOX_FULL_WIDTH - 2 * BOX_THICKNESS;
BACKCOVER_HEIGHT = BOX_FULL_HEIGHT - BOX_THICKNESS - BOX_BOTTOM_THICKNESS;

BC_CLIP_THICKNESS = 1;
BC_CLIP_ADD_HEIGHT= 1;

module back_cover (){
    cube([BACKCOVER_WIDTH , BACKCOVER_HEIGHT, BOX_THICKNESS]);
    
    /* Clipping part */
    translate([0, BLOCKER_THICKNESS, BOX_THICKNESS]) cube([BACKCOVER_WIDTH, BC_CLIP_THICKNESS , BLOCKER_HEIGHT + BC_CLIP_ADD_HEIGHT]);
    translate([0, BLOCKER_THICKNESS, BLOCKER_HEIGHT + BOX_THICKNESS + BLOCKER_THICKNESS/2]) rotate([0, 90, 0]) cylinder(d = BLOCKER_THICKNESS,h = BACKCOVER_WIDTH);
    translate([0, BACKCOVER_HEIGHT - BLOCKER_THICKNESS - BC_CLIP_THICKNESS, BOX_THICKNESS]) cube([BACKCOVER_WIDTH, BC_CLIP_THICKNESS , BLOCKER_HEIGHT + BC_CLIP_ADD_HEIGHT]); 
    translate([0, BACKCOVER_HEIGHT - BLOCKER_THICKNESS, BLOCKER_HEIGHT + BOX_THICKNESS + BLOCKER_THICKNESS/2]) rotate([0, 90, 0]) cylinder(d = BLOCKER_THICKNESS,h = BACKCOVER_WIDTH);
}

back_cover();
//main_box_case();
//box_feet(5);