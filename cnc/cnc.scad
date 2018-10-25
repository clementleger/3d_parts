include <../common/roundedcube.scad>
include <../common/prism.scad>
include <../common/threads.scad>
include <../common/chamfers.scad>

/* Feet */
FEET_WIDTH = 25;
FEET_HEIGTH = 40;
FEET_CHAMFER = 10;
FEET_SIZE = 30;
FEET_THICKNESS = 8;
FEET_GROUND_CHAMFER = 8;

/* Rail stuff */
RAIL_WIDTH = 9.5;
RAIL_HEIGHT = 7;
RAIL_LENGTH = 195;
RAIL_HOLE_SPACING = 20.1;
/* + 2 for end stop attachments */
RAIL_HOLE_COUNT = 10 + 2;
RAIL_HOLE_DIAMETER = 2.7;
RAIL_NUT_THICKNESS = 2;
RAIL_NUT_DIAMETER = 7;
RAIL_SUPPORT_HEIGHT = 22;
RAIL_SUPPORT_THICKNESS = 7;

/* "Board" support */
BOARD_SUPPORT_WIDTH = 25;
BOARD_SUPPORT_HOLE_DIAMETER = 3;
BOARD_SUPPORT_NUT_DIAMETER = 7;
BOARD_SUPPORT_NUT_THICKNESS = 2;
BOARD_SUPPORT_CHAMFER = 5;
BOARD_SUPPORT_HOLE_COUNT = 8;
BOARD_HOLE_OFFSET = 10;

/* Rail endstop */
RAIL_ES_HOLE_OFFSET = 12;
RAIL_ES_WIDTH = 16;
RAIL_ES_EXTRA = 2;
RAIL_ES_BOLT_DIAMETER = 3.4;
RAIL_ES_BOLT_HEAD_DIAMETER = 5.5;
RAIL_ES_BOLT_HEAD_THICKNESS = 4;

RAIL_ES_HOLDER_HOLE_SIZE = 10;

RAIL_ES_ENDSTOP_HOLE_OFFSET = 5;
RAIL_ES_ENDSTOP_HOLE_DIAMETER = 1.4;
RAIL_ES_ENDSTOP_HOLE_SPACING = 8;

/* Derived from constants */
FULL_SUPPORT_LENGTH = RAIL_LENGTH + 2 * FEET_WIDTH;
FULL_FEET_HEIGHT = FEET_HEIGTH + RAIL_SUPPORT_HEIGHT;
BOARD_HOLE_SPACING = (FULL_SUPPORT_LENGTH - (2 * BOARD_HOLE_OFFSET)) / (BOARD_SUPPORT_HOLE_COUNT);

RAIL_ES_LENGTH = RAIL_ES_HOLE_OFFSET + RAIL_ES_EXTRA + 5;
RAIL_ES_FULL_HEIGHT = RAIL_HEIGHT + RAIL_ES_EXTRA;

/* Modules */

module support_feet() {
    difference() {
        union () {
            cube([FEET_WIDTH, FULL_FEET_HEIGHT, RAIL_SUPPORT_THICKNESS]);
            /* Chamfer between feet and fixation */
            translate([0, FEET_THICKNESS, FEET_GROUND_CHAMFER + RAIL_SUPPORT_THICKNESS]) rotate([-90, 0, 0]) chamfer(FEET_WIDTH, FEET_GROUND_CHAMFER, FEET_GROUND_CHAMFER);
            roundedcube([FEET_WIDTH, FEET_THICKNESS, FEET_SIZE], false, 1, "x");
            
        }
        translate([FEET_WIDTH/2, FEET_THICKNESS, FEET_SIZE / 4 * 3]) rotate([90, 0, 0]) cylinder(d = BOARD_SUPPORT_HOLE_DIAMETER, h =FEET_THICKNESS);
    }
}

module support_board() {
    /* Support for cutting board */
    translate([0, RAIL_SUPPORT_HEIGHT - RAIL_SUPPORT_THICKNESS, 0])
    difference() {
        roundedcube([FULL_SUPPORT_LENGTH, RAIL_SUPPORT_THICKNESS, BOARD_SUPPORT_WIDTH], false, 1, "x");
        

        for (hole = [0:BOARD_SUPPORT_HOLE_COUNT-1]) {
            translate([FULL_SUPPORT_LENGTH/2 - (BOARD_HOLE_SPACING * (BOARD_SUPPORT_HOLE_COUNT - 1))/2 + hole * BOARD_HOLE_SPACING, 0, BOARD_SUPPORT_WIDTH /3 * 2]) rotate([-90, 0, 0]) {
                cylinder(d = BOARD_SUPPORT_HOLE_DIAMETER, h = RAIL_SUPPORT_THICKNESS);
                cylinder(d = BOARD_SUPPORT_NUT_DIAMETER, h = BOARD_SUPPORT_NUT_THICKNESS, $fn=6);
            }

        }
    }
    
    translate([0, RAIL_SUPPORT_HEIGHT - RAIL_SUPPORT_THICKNESS -  BOARD_SUPPORT_CHAMFER, RAIL_SUPPORT_THICKNESS])  chamfer(FULL_SUPPORT_LENGTH, BOARD_SUPPORT_CHAMFER, BOARD_SUPPORT_CHAMFER);
}

module side_support() {
    /* Main "beam" */
    cube([FULL_SUPPORT_LENGTH, RAIL_SUPPORT_HEIGHT, RAIL_SUPPORT_THICKNESS]);

    support_board();

    /* Feets */
    translate([0, - FEET_HEIGTH, 0]) {
        /*  First feet */
        translate([FEET_WIDTH, FEET_HEIGTH - FEET_CHAMFER, RAIL_SUPPORT_THICKNESS]) rotate([0, 90, 0]) chamfer(RAIL_SUPPORT_THICKNESS, FEET_CHAMFER, FEET_CHAMFER);
        support_feet();
        
        /*  Second feet (most far from origin)*/
        translate([RAIL_LENGTH + FEET_WIDTH, FEET_HEIGTH - FEET_CHAMFER, RAIL_SUPPORT_THICKNESS]) mirror(0, 1, 0) rotate([0, 90, 0]) chamfer(RAIL_SUPPORT_THICKNESS, FEET_CHAMFER, FEET_CHAMFER);
        translate([FULL_SUPPORT_LENGTH - FEET_WIDTH, 0, 0])  support_feet();
    }
}

module side_support_with_holes() {
    difference() {
        
        side_support();
        translate([FULL_SUPPORT_LENGTH / 2 - (((RAIL_HOLE_COUNT-1) / 2) * RAIL_HOLE_SPACING), RAIL_SUPPORT_HEIGHT / 3, 0]) {
            for (hole = [0:RAIL_HOLE_COUNT-1]) {
                translate([hole * RAIL_HOLE_SPACING, 0, -0.5]) cylinder(d = RAIL_HOLE_DIAMETER, h = RAIL_SUPPORT_THICKNESS + 1);
                translate([hole * RAIL_HOLE_SPACING, 0, RAIL_SUPPORT_THICKNESS - RAIL_NUT_THICKNESS]) cylinder(d = RAIL_NUT_DIAMETER, h = RAIL_NUT_THICKNESS, $fn = 6);
            }
        }
    }
}

//side_support_with_holes();

module rail_end_stop() {
    difference() {
        roundedcube([RAIL_ES_LENGTH, RAIL_ES_WIDTH + 2 * + RAIL_ES_EXTRA, RAIL_ES_FULL_HEIGHT], true, 1, "zmax");
        translate([RAIL_ES_LENGTH/2 - RAIL_ES_EXTRA/2, 0, -RAIL_ES_FULL_HEIGHT/2 + RAIL_HEIGHT/2]) cube([RAIL_ES_EXTRA, RAIL_WIDTH, RAIL_HEIGHT], true);
        translate([RAIL_ES_LENGTH/2 - RAIL_ES_HOLE_OFFSET - RAIL_ES_EXTRA, 0, -RAIL_ES_FULL_HEIGHT/2]) cylinder(d = RAIL_ES_BOLT_DIAMETER, h = RAIL_ES_FULL_HEIGHT);
        translate([RAIL_ES_LENGTH/2 - RAIL_ES_HOLE_OFFSET - RAIL_ES_EXTRA, 0, RAIL_ES_FULL_HEIGHT/2 - RAIL_ES_BOLT_HEAD_THICKNESS]) cylinder(d = RAIL_ES_BOLT_HEAD_DIAMETER, h = RAIL_ES_BOLT_HEAD_THICKNESS);
        
        /* Holes for endstop */
        translate([RAIL_ES_LENGTH/2 -RAIL_ES_ENDSTOP_HOLE_OFFSET , RAIL_ES_ENDSTOP_HOLE_SPACING/2, 0]) cylinder(d = RAIL_ES_ENDSTOP_HOLE_DIAMETER, h = RAIL_ES_FULL_HEIGHT, center = true);
        translate([RAIL_ES_LENGTH/2 -RAIL_ES_ENDSTOP_HOLE_OFFSET , -RAIL_ES_ENDSTOP_HOLE_SPACING/2, 0]) cylinder(d = RAIL_ES_ENDSTOP_HOLE_DIAMETER, h = RAIL_ES_FULL_HEIGHT, center = true);
    }
    
}

rail_end_stop();