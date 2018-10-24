include <../common/roundedcube.scad>
include <../common/prism.scad>
include <../common/threads.scad>
include <../common/chamfers.scad>


FEET_WIDTH = 25;
FEET_HEIGTH = 40;
FEET_CHAMFER = 10;
FEET_SIZE = 30;
FEET_THICKNESS = 8;
FEET_GROUND_CHAMFER = 8;

/* Rail stuff */
RAIL_LENGTH = 205;
RAIL_HOLE_SPACING = 30;
RAIL_HOLE_DIAMETER = 4;
RAIL_SUPPORT_HEIGHT = 30;
RAIL_SUPPORT_THICKNESS = 7;

/* "Board" support */
BOARD_SUPPORT_WIDTH = 25;
BOARD_SUPPORT_HOLE_DIAMETER = 5;
BOARD_SUPPORT_CHAMFER = 5;

/* Derived from constants */
FULL_SUPPORT_LENGTH = RAIL_LENGTH + 2 * FEET_WIDTH;
FULL_FEET_HEIGHT = FEET_HEIGTH + RAIL_SUPPORT_HEIGHT;
/* Modules */

module support_feet() {
    difference() {
        union () {
            cube([FEET_WIDTH, FULL_FEET_HEIGHT, RAIL_SUPPORT_THICKNESS]);
            /* Chamfer between feet and fixation */
            translate([0, FEET_THICKNESS, FEET_GROUND_CHAMFER + RAIL_SUPPORT_THICKNESS]) rotate([-90, 0, 0]) chamfer(FEET_WIDTH, FEET_GROUND_CHAMFER, FEET_GROUND_CHAMFER);
            cube([FEET_WIDTH, FEET_THICKNESS, FEET_SIZE]);
        }
        translate([FEET_WIDTH/2, FEET_THICKNESS, FEET_SIZE / 4 * 3]) rotate([90, 0, 0]) cylinder(d = BOARD_SUPPORT_HOLE_DIAMETER, h =FEET_THICKNESS);
    }
}

module side_support() {
    /* Main "beam" */
    cube([FULL_SUPPORT_LENGTH, RAIL_SUPPORT_HEIGHT, RAIL_SUPPORT_THICKNESS]);
    translate([0, RAIL_SUPPORT_HEIGHT - RAIL_SUPPORT_THICKNESS, 0]) cube([FULL_SUPPORT_LENGTH, RAIL_SUPPORT_THICKNESS, BOARD_SUPPORT_WIDTH]);
   translate([0, RAIL_SUPPORT_HEIGHT - RAIL_SUPPORT_THICKNESS -  BOARD_SUPPORT_CHAMFER, RAIL_SUPPORT_THICKNESS])  chamfer(FULL_SUPPORT_LENGTH, BOARD_SUPPORT_CHAMFER, BOARD_SUPPORT_CHAMFER);
    /* Feets */
    translate([0, - FEET_HEIGTH, 0]) {
        /*  First feet */
        translate([FEET_WIDTH, FEET_HEIGTH - FEET_CHAMFER, RAIL_SUPPORT_THICKNESS]) rotate([0, 90, 0]) chamfer(RAIL_SUPPORT_THICKNESS, FEET_CHAMFER, FEET_CHAMFER);
        support_feet();
        
        /*  Second feet (most far from origin)*/
        translate([RAIL_LENGTH + FEET_WIDTH, FEET_HEIGTH - FEET_CHAMFER, RAIL_SUPPORT_THICKNESS]) mirror(0, 1, 0) rotate([0, 90, 0])     chamfer(RAIL_SUPPORT_THICKNESS, FEET_CHAMFER, FEET_CHAMFER);
        translate([FULL_SUPPORT_LENGTH - FEET_WIDTH, 0, 0])  support_feet();
    }
}

side_support();