include <../common/roundedcube.scad>
include <../common/prism.scad>
include <../common/threads.scad>
include <../common/chamfers.scad>
include <../common/timing_belts.scad>


SMALL_TOLERANCY = 0.2;

BELT_WIDTH = 6;

M3_HEAD_DIAM = 6;
M3_HEAD_THICKNESS = 2;
M3_DIAM = 3;
M3_NUT_DIAM = 7;
M3_NUT_THICKNESS = 2;

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
RAIL_HOLE_DIAM = 2.7;
RAIL_NUT_THICKNESS = M3_NUT_THICKNESS;
RAIL_NUT_DIAM = 7;
RAIL_SUPPORT_HEIGHT = 22;
RAIL_SUPPORT_THICKNESS = 7;
RAIL_FIRST_HOLE_OFFSET = 8;

/* "Board" support */
BOARD_SUPPORT_WIDTH = 25;
BOARD_SUPPORT_HOLE_DIAM = M3_NUT_DIAM;
BOARD_SUPPORT_NUT_DIAM = M3_NUT_DIAM;
BOARD_SUPPORT_NUT_THICKNESS = M3_NUT_THICKNESS;
BOARD_SUPPORT_CHAMFER = 5;
BOARD_SUPPORT_HOLE_COUNT = 8;
BOARD_HOLE_OFFSET = 10;

/* Rail endstop */
RAIL_ES_HOLE_OFFSET = 12;
RAIL_ES_WIDTH = 16;
RAIL_ES_EXTRA = 2;
RAIL_ES_BOLT_DIAM = 3.2;
RAIL_ES_BOLT_HEAD_DIAM = M3_HEAD_DIAM;
RAIL_ES_BOLT_HEAD_THICKNESS = 4;
RAIL_ES_HOLDER_HOLE_SIZE = 10;
RAIL_ES_ENDSTOP_HOLE_OFFSET = 5;
RAIL_ES_ENDSTOP_HOLE_DIAM = 1.5;
RAIL_ES_ENDSTOP_HOLE_SPACING = 6.5;


GANTRY_HEIGHT = 130;
GANTRY_WIDTH = 30;
GANTRY_THICKNESS = 8;
GANTRY_BOTTOM_CHAMFER_SIZE = 10;
GANTRY_BOLT_HOLE_DIAM = M3_DIAM;
GANTRY_BOLT_HEAD_DIAM = M3_HEAD_DIAM;
GANTRY_NUT_HEAD_THICKNESS = 1.5;
GANTRY_CARRIAGE_Y_OFFSET = 22;

/* Middle part */
GANTRY_RAIL_MIDDLE_HOLE_COUNT = 6;
GANTRY_MIDDLE_PART_EXTRA = 3;

/* NEMA stuff */
NEMA_WIDTH = 42.5;
NEMA_HOLE_SPACING = 31;
NEMA_CENTER_DIAM = 25;
NEMA_ATTACHMENT_THICKNESS = 8;
/* Size of belt pulley */
NEMA_BELT_DIAM = 17;
/* Oblong hole size for adjusting belt tension */
NEMA_OBLONG_SIZE = 2;
/* Little part longer than the rest */
NEMA_ATTACHMENT_LENGTH = 15;
NEMA_ROUNDING = 2;
NEMA_HOLE_DIAM = 3;

GANTRY_NEMA_HOLE_Z_OFFSET = NEMA_WIDTH/2 - NEMA_BELT_DIAM/2;

/* Small bearing carriage dimension */
CARRIAGE_WIDTH = 30;
CARRIAGE_HEIGHT = 20.5;
CARRIAGE_NUT_DIAM = M3_DIAM;
CARIAGE_DEPTH = 1;
CARRIAGE_HOLE_OFFSET = 2.75;
CARRIAGE_HOLE_X_OFFSET = 10;
CARRIAGE_HOLE_Y_OFFSET = 15;

FLAT_AL_STRIP_WIDTH = 25 + SMALL_TOLERANCY;
FLAT_AL_STRIP_THICKNESS = 2 + SMALL_TOLERANCY;
FLAT_AL_TIGHTEN_SIZE = 40;

/* Gantry top part */
GANTRY_TOP_WIDTH = NEMA_WIDTH;
GANTRY_TOP_HEIGHT = RAIL_FIRST_HOLE_OFFSET + RAIL_HOLE_SPACING + GANTRY_THICKNESS + RAIL_HOLE_SPACING / 2 ;
GANTRY_TOP_THICKNESS = 8;
GANTRY_TOP_CHAMFER_SIZE = 8;

/* Slope part of gantry */
SLOPE_PART_Y_OFFSET =  GANTRY_CARRIAGE_Y_OFFSET  - CARRIAGE_HOLE_OFFSET + CARRIAGE_HEIGHT;
SLOPE_PART_HEIGHT = GANTRY_HEIGHT - GANTRY_TOP_WIDTH -  SLOPE_PART_Y_OFFSET;
SLOPE_OFFSET = 20;

/* Bottom belt blocker */
BOTTOM_BELT_BLOCKER_THICKNESS = 3;
BOTTOM_BELT_OFFSET = 5;
BOTTOM_BELT_BLOCKER_HEIGHT = BELT_WIDTH + BOTTOM_BELT_BLOCKER_THICKNESS;

/* Derived from constants */
FULL_SUPPORT_LENGTH = RAIL_LENGTH + 2 * FEET_WIDTH;
FULL_FEET_HEIGHT = FEET_HEIGTH + RAIL_SUPPORT_HEIGHT;
BOARD_HOLE_SPACING = (FULL_SUPPORT_LENGTH - (2 * BOARD_HOLE_OFFSET)) / (BOARD_SUPPORT_HOLE_COUNT);
RAIL_ES_LENGTH = RAIL_ES_HOLE_OFFSET + RAIL_ES_EXTRA + 5;
RAIL_ES_FULL_HEIGHT = RAIL_HEIGHT + RAIL_ES_EXTRA;

//rail_end_stop();
//side_support_with_holes();
//support_feet();
//gantry_side();
//mirror([1, 0, 0]) nema_attachment();
//gantry_middle_part();
gantry_bottom_belt_blocker();

/* Modules */

module support_feet() {
    difference() {
        union () {
            cube([FEET_WIDTH, FULL_FEET_HEIGHT, RAIL_SUPPORT_THICKNESS]);
            /* Chamfer between feet and fixation */
            translate([0, FEET_THICKNESS, FEET_GROUND_CHAMFER + RAIL_SUPPORT_THICKNESS]) rotate([-90, 0, 0]) chamfer(FEET_WIDTH, FEET_GROUND_CHAMFER, FEET_GROUND_CHAMFER);
            roundedcube([FEET_WIDTH, FEET_THICKNESS, FEET_SIZE], false, 1, "x");
            
        }
        translate([FEET_WIDTH/2, FEET_THICKNESS, FEET_SIZE / 4 * 3]) rotate([90, 0, 0]) cylinder(d = BOARD_SUPPORT_HOLE_DIAM, h =FEET_THICKNESS);
    }
}

module support_board() {
    /* Support for cutting board */
    translate([0, RAIL_SUPPORT_HEIGHT - RAIL_SUPPORT_THICKNESS, 0])
    difference() {
        roundedcube([FULL_SUPPORT_LENGTH, RAIL_SUPPORT_THICKNESS, BOARD_SUPPORT_WIDTH], false, 1, "x");
        

        for (hole = [0:BOARD_SUPPORT_HOLE_COUNT-1]) {
            translate([FULL_SUPPORT_LENGTH/2 - (BOARD_HOLE_SPACING * (BOARD_SUPPORT_HOLE_COUNT - 1))/2 + hole * BOARD_HOLE_SPACING, 0, BOARD_SUPPORT_WIDTH /3 * 2]) rotate([-90, 0, 0]) {
                cylinder(d = BOARD_SUPPORT_HOLE_DIAM, h = RAIL_SUPPORT_THICKNESS);
                cylinder(d = BOARD_SUPPORT_NUT_DIAM, h = BOARD_SUPPORT_NUT_THICKNESS, $fn=6);
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
                translate([hole * RAIL_HOLE_SPACING, 0, -0.5]) cylinder(d = RAIL_HOLE_DIAM, h = RAIL_SUPPORT_THICKNESS + 1);
                translate([hole * RAIL_HOLE_SPACING, 0, RAIL_SUPPORT_THICKNESS - RAIL_NUT_THICKNESS]) cylinder(d = RAIL_NUT_DIAM, h = RAIL_NUT_THICKNESS, $fn = 6);
            }
        }
    }
}

module rail_end_stop() {
    difference() {
        roundedcube([RAIL_ES_LENGTH, RAIL_ES_WIDTH + 2 * + RAIL_ES_EXTRA, RAIL_ES_FULL_HEIGHT], true, 1, "zmax");
translate([RAIL_ES_LENGTH/2 - RAIL_ES_EXTRA/2, 0, -RAIL_ES_FULL_HEIGHT/2 + (RAIL_HEIGHT + SMALL_TOLERANCY)/2]) cube([RAIL_ES_EXTRA, RAIL_WIDTH, RAIL_HEIGHT + SMALL_TOLERANCY], true);
        translate([RAIL_ES_LENGTH/2 - RAIL_ES_HOLE_OFFSET - RAIL_ES_EXTRA, 0, -RAIL_ES_FULL_HEIGHT/2]) cylinder(d = RAIL_ES_BOLT_DIAM, h = RAIL_ES_FULL_HEIGHT);
        translate([RAIL_ES_LENGTH/2 - RAIL_ES_HOLE_OFFSET - RAIL_ES_EXTRA, 0, RAIL_ES_FULL_HEIGHT/2 - RAIL_ES_BOLT_HEAD_THICKNESS]) cylinder(d = RAIL_ES_BOLT_HEAD_DIAM, h = RAIL_ES_BOLT_HEAD_THICKNESS);
        
        /* Holes for endstop */
        translate([RAIL_ES_LENGTH/2 -RAIL_ES_ENDSTOP_HOLE_OFFSET , RAIL_ES_ENDSTOP_HOLE_SPACING/2, 0]) cylinder(d = RAIL_ES_ENDSTOP_HOLE_DIAM, h = RAIL_ES_FULL_HEIGHT, center = true);
        translate([RAIL_ES_LENGTH/2 -RAIL_ES_ENDSTOP_HOLE_OFFSET , -RAIL_ES_ENDSTOP_HOLE_SPACING/2, 0]) cylinder(d = RAIL_ES_ENDSTOP_HOLE_DIAM, h = RAIL_ES_FULL_HEIGHT, center = true);
    }
    
}


module gantry_bottom_holes() {
        translate([GANTRY_WIDTH/2 - (FLAT_AL_STRIP_WIDTH /2) / 4 * 2, 0, 0]) rotate([-90, 0, 0])cylinder(d = GANTRY_BOLT_HOLE_DIAM, h = GANTRY_THICKNESS);
        translate([GANTRY_WIDTH/2 + (FLAT_AL_STRIP_WIDTH /2) / 4 * 2, 0, 0]) rotate([-90, 0, 0])cylinder(d = GANTRY_BOLT_HOLE_DIAM, h = GANTRY_THICKNESS);
}

module gantry_carriage_holes(diam) {
    cylinder(d = diam, h = GANTRY_THICKNESS);
    translate([CARRIAGE_HOLE_X_OFFSET, 0, 0]) cylinder(d = diam, h = GANTRY_THICKNESS);
    translate([CARRIAGE_HOLE_X_OFFSET, CARRIAGE_HOLE_Y_OFFSET, 0]) cylinder(d = diam, h = GANTRY_THICKNESS);
    translate([0, CARRIAGE_HOLE_Y_OFFSET, 0]) cylinder(d = diam, h = GANTRY_THICKNESS);
}

module gantry_bottom_part()
{
    difference() {
        union() {
            cube([GANTRY_WIDTH, GANTRY_THICKNESS, FLAT_AL_TIGHTEN_SIZE]);
            translate([0, ,GANTRY_BOTTOM_CHAMFER_SIZE + GANTRY_THICKNESS, GANTRY_THICKNESS]) mirror([0, 1, 0]) chamfer(GANTRY_WIDTH, GANTRY_BOTTOM_CHAMFER_SIZE, GANTRY_BOTTOM_CHAMFER_SIZE);
        }
        translate([GANTRY_WIDTH/2-FLAT_AL_STRIP_WIDTH/2, GANTRY_THICKNESS / 2 - FLAT_AL_STRIP_THICKNESS / 2, 0]) cube([FLAT_AL_STRIP_WIDTH, FLAT_AL_STRIP_THICKNESS, FLAT_AL_TIGHTEN_SIZE]);
        translate([0, 0,  FLAT_AL_TIGHTEN_SIZE / 6 * 5]) gantry_bottom_holes();
        translate([0, 0,  FLAT_AL_TIGHTEN_SIZE / 6 * 3]) gantry_bottom_holes();
    }
}


module slope_part(w, h, thickness, offset)
{
    a = [[0,0],[w,0],[w + offset, h],[offset,h]];
    linear_extrude(height = thickness) polygon(a);
}

module gantry_top_part()
{
    difference() {
        union () {
            translate([-GANTRY_TOP_CHAMFER_SIZE, GANTRY_TOP_WIDTH, GANTRY_THICKNESS]) rotate([0, 0, -90]) chamfer(GANTRY_TOP_WIDTH, GANTRY_TOP_CHAMFER_SIZE, GANTRY_TOP_CHAMFER_SIZE);
            cube([GANTRY_TOP_THICKNESS, GANTRY_TOP_WIDTH, GANTRY_TOP_HEIGHT]);
        }
        translate([GANTRY_TOP_THICKNESS/2 - FLAT_AL_STRIP_THICKNESS/2, GANTRY_TOP_WIDTH/2- FLAT_AL_STRIP_WIDTH/2 , GANTRY_THICKNESS]) cube([FLAT_AL_STRIP_THICKNESS, FLAT_AL_STRIP_WIDTH, FLAT_AL_TIGHTEN_SIZE]);
        
        translate([0, GANTRY_TOP_WIDTH/2, GANTRY_THICKNESS + RAIL_FIRST_HOLE_OFFSET]) rotate([0, 90, 0]) cylinder(d = GANTRY_BOLT_HOLE_DIAM, h = GANTRY_TOP_THICKNESS); 
        translate([0, GANTRY_TOP_WIDTH/2, GANTRY_THICKNESS + RAIL_FIRST_HOLE_OFFSET + RAIL_HOLE_SPACING]) rotate([0, 90, 0]) cylinder(d = GANTRY_BOLT_HOLE_DIAM, h = GANTRY_TOP_THICKNESS);
        
        /* Rail footprint */
        translate([-RAIL_HEIGHT, GANTRY_TOP_WIDTH/2- RAIL_WIDTH/2, 0]) cube([RAIL_HEIGHT, RAIL_WIDTH, 100]);
        /* Hole for NEMA attachment */
        translate([0, GANTRY_NEMA_HOLE_Z_OFFSET/2, GANTRY_THICKNESS + NEMA_ATTACHMENT_LENGTH]) rotate([0, 90, 0]) {
           cylinder(d = M3_DIAM, h = GANTRY_TOP_THICKNESS);
           translate([0, 0, -GANTRY_TOP_THICKNESS + M3_NUT_THICKNESS]) cylinder(d = M3_NUT_DIAM, h = GANTRY_TOP_THICKNESS, $fn = 6);
        }
    }
}

module gantry_side()
{
    difference() {
        union() { 
            difference() {
                union () {       
                    cube([GANTRY_WIDTH, SLOPE_PART_Y_OFFSET, GANTRY_THICKNESS]);
                    translate([SLOPE_OFFSET, SLOPE_PART_Y_OFFSET + SLOPE_PART_HEIGHT, 0]) cube([GANTRY_WIDTH, GANTRY_TOP_WIDTH, GANTRY_THICKNESS]);
                    
                    translate([0, SLOPE_PART_Y_OFFSET, 0]) slope_part(GANTRY_WIDTH, SLOPE_PART_HEIGHT, GANTRY_THICKNESS, SLOPE_OFFSET);
                }
                translate([GANTRY_WIDTH/2 - CARRIAGE_HOLE_X_OFFSET/2, GANTRY_CARRIAGE_Y_OFFSET, 0]) gantry_carriage_holes(GANTRY_BOLT_HOLE_DIAM);
                /* Holes for bolt head */
                //translate([GANTRY_WIDTH/2 - CARRIAGE_HOLE_X_OFFSET/2, GANTRY_CARRIAGE_Y_OFFSET, - GANTRY_THICKNESS + GANTRY_NUT_HEAD_THICKNESS]) gantry_carriage_holes(GANTRY_BOLT_HEAD_DIAM);
                translate([0, GANTRY_CARRIAGE_Y_OFFSET - CARRIAGE_HOLE_OFFSET, GANTRY_THICKNESS - CARIAGE_DEPTH])  cube([CARRIAGE_WIDTH, CARRIAGE_HEIGHT, CARIAGE_DEPTH]);

            }
            /* Top and bottom parts */
            gantry_bottom_part();
            translate([GANTRY_WIDTH + SLOPE_OFFSET - GANTRY_TOP_THICKNESS, GANTRY_HEIGHT - GANTRY_TOP_WIDTH, 0]) gantry_top_part();
        }
            /* Holes for nema attachment */
        translate([SLOPE_OFFSET, GANTRY_HEIGHT, GANTRY_THICKNESS/2]) rotate([90, 0, 0]) {
            translate([GANTRY_WIDTH/4, 0, 0]) cylinder(d = M3_DIAM, h = GANTRY_TOP_WIDTH /2 - RAIL_WIDTH/2);
            translate([GANTRY_WIDTH/4 * 3, 0, 0]) cylinder(d = M3_DIAM, h = GANTRY_TOP_WIDTH /2 - RAIL_WIDTH/2);
        }
        
        /* Hole for belt idler */ 
        translate([SLOPE_OFFSET + GANTRY_WIDTH - GANTRY_WIDTH/2, GANTRY_HEIGHT - GANTRY_TOP_WIDTH/2, GANTRY_THICKNESS/2]) rotate([0, 90, 0])  # cylinder(d = M3_DIAM, h = GANTRY_WIDTH/2);
    }
}

module gantry_middle_part() {
    MIDDLE_PART_LENGTH = GANTRY_RAIL_MIDDLE_HOLE_COUNT * RAIL_HOLE_SPACING;
    MIDDLE_PART_WIDTH = FLAT_AL_STRIP_WIDTH + 2 * GANTRY_MIDDLE_PART_EXTRA + SMALL_TOLERANCY;
    MIDDLE_PART_THICKNESS = GANTRY_THICKNESS /2  + FLAT_AL_STRIP_THICKNESS / 2;
    difference() {
        cube([MIDDLE_PART_LENGTH, MIDDLE_PART_WIDTH, MIDDLE_PART_THICKNESS]);
        translate([0, MIDDLE_PART_WIDTH/2  - FLAT_AL_STRIP_WIDTH/2]) #cube([MIDDLE_PART_LENGTH, FLAT_AL_STRIP_WIDTH, FLAT_AL_STRIP_THICKNESS]);
        for (i = [0:GANTRY_RAIL_MIDDLE_HOLE_COUNT - 1] ) {
            translate([RAIL_HOLE_SPACING / 2 + i * RAIL_HOLE_SPACING, MIDDLE_PART_WIDTH/2, 0]) cylinder(d = M3_DIAM, h = MIDDLE_PART_THICKNESS );
        }
    }
}

module gantry_bottom_belt_blocker () {
    BELT_BLOCKER_WIDTH = 2 * BOTTOM_BELT_BLOCKER_THICKNESS + FLAT_AL_STRIP_WIDTH;
 
    difference() {
        cube([BELT_BLOCKER_WIDTH, BOTTOM_BELT_BLOCKER_HEIGHT, FLAT_AL_STRIP_THICKNESS + 2 * BOTTOM_BELT_BLOCKER_THICKNESS]);
         translate([BELT_BLOCKER_WIDTH/2 - FLAT_AL_STRIP_WIDTH/2, 0, BOTTOM_BELT_BLOCKER_THICKNESS])cube([FLAT_AL_STRIP_WIDTH, BOTTOM_BELT_BLOCKER_HEIGHT, FLAT_AL_STRIP_THICKNESS]);
        translate([BELT_BLOCKER_WIDTH/2, BOTTOM_BELT_BLOCKER_HEIGHT/2, 0]) cylinder(d = M3_DIAM - SMALL_TOLERANCY, h = BOTTOM_BELT_BLOCKER_HEIGHT);
    }
    difference() {
       translate([0, 0, -BOTTOM_BELT_OFFSET]) cube([BELT_BLOCKER_WIDTH, BOTTOM_BELT_BLOCKER_HEIGHT, BOTTOM_BELT_OFFSET]);
       translate([0, BELT_WIDTH/2, -BOTTOM_BELT_OFFSET + 2]) scale([1, 1.1, 1.2]) rotate([-90, 0, 0])  belt_len(profile = tGT2_2, belt_width = BELT_WIDTH, len = BELT_BLOCKER_WIDTH);
    }
}


module oblong_hole(d, h, w) {
    hull() {
        cylinder(d = d, h = h);
        translate([0, -w, 0]) cylinder(d = d, h = h);
    }
}

module upper_nema_part () {
    UPPER_NEMA_PART_WIDTH = GANTRY_WIDTH + NEMA_ATTACHMENT_THICKNESS;

    difference() {
        cube([NEMA_ATTACHMENT_THICKNESS, GANTRY_THICKNESS, UPPER_NEMA_PART_WIDTH]);
        translate([0, GANTRY_THICKNESS - GANTRY_THICKNESS/2, GANTRY_TOP_THICKNESS + GANTRY_WIDTH/4]) rotate([0, 90, 0]) {
            cylinder(d = M3_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
            translate([0, 0, NEMA_ATTACHMENT_THICKNESS - M3_HEAD_THICKNESS]) cylinder(d = M3_HEAD_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
        }
        translate([0, GANTRY_THICKNESS - GANTRY_THICKNESS/2, GANTRY_TOP_THICKNESS + GANTRY_WIDTH/4 * 3]) rotate([0, 90, 0]) {
             cylinder(d = M3_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
            translate([0, 0, NEMA_ATTACHMENT_THICKNESS - M3_HEAD_THICKNESS]) cylinder(d = M3_HEAD_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
        }
    }
}

module nema_attachment()
{
    difference() {
        union() {
            cube([NEMA_WIDTH + NEMA_ATTACHMENT_THICKNESS, NEMA_WIDTH + GANTRY_THICKNESS, NEMA_ATTACHMENT_THICKNESS]);
            /* Longer part */
            cube([NEMA_WIDTH / 2, NEMA_WIDTH + NEMA_ATTACHMENT_LENGTH + GANTRY_THICKNESS, NEMA_ATTACHMENT_THICKNESS]);
            /* Longer part end rounding */
            translate([GANTRY_NEMA_HOLE_Z_OFFSET/2, NEMA_WIDTH + GANTRY_THICKNESS + NEMA_ATTACHMENT_LENGTH, 0]) cylinder (d = GANTRY_NEMA_HOLE_Z_OFFSET, h = NEMA_ATTACHMENT_THICKNESS);
            /* Upper part */
            translate([NEMA_WIDTH, NEMA_WIDTH, 0]) upper_nema_part();
             translate([NEMA_WIDTH, 0, NEMA_ATTACHMENT_THICKNESS]) prism(NEMA_ATTACHMENT_THICKNESS, NEMA_WIDTH, GANTRY_WIDTH);
        }
        for(i = [0:1]) {          
            for(j = [0:1]) {
                offset_h = NEMA_WIDTH/2 - NEMA_HOLE_SPACING/2;
                translate([offset_h + i * NEMA_HOLE_SPACING, offset_h+ j * NEMA_HOLE_SPACING, 0])  {
                    oblong_hole(d = NEMA_HOLE_DIAM, h = NEMA_ATTACHMENT_THICKNESS, w = NEMA_OBLONG_SIZE);
                    translate([0, 0,- NEMA_ATTACHMENT_THICKNESS + M3_HEAD_THICKNESS ]) oblong_hole(d = M3_HEAD_DIAM, h = NEMA_ATTACHMENT_THICKNESS, w = NEMA_OBLONG_SIZE);
                }
            }
        }
        /* Longer part end hole */
            translate([GANTRY_NEMA_HOLE_Z_OFFSET/2, NEMA_WIDTH + GANTRY_THICKNESS + NEMA_ATTACHMENT_LENGTH, 0]) cylinder (d = M3_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
            translate([GANTRY_NEMA_HOLE_Z_OFFSET/2, NEMA_WIDTH + GANTRY_THICKNESS + NEMA_ATTACHMENT_LENGTH, - NEMA_ATTACHMENT_THICKNESS + M3_HEAD_THICKNESS]) cylinder (d = M3_HEAD_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
        
        /* Hole for NEMA motor */
        translate([NEMA_WIDTH/2, NEMA_WIDTH/2, 0]) cylinder (d = NEMA_CENTER_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
        translate([NEMA_WIDTH/2 - NEMA_BELT_DIAM/2, NEMA_WIDTH/2, 0]) cube([NEMA_BELT_DIAM, NEMA_CENTER_DIAM + NEMA_ATTACHMENT_LENGTH + GANTRY_THICKNESS, NEMA_ATTACHMENT_THICKNESS]);
    }
}