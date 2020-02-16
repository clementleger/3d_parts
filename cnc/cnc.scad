include <../common/roundedcube.scad>
include <../common/prism.scad>
include <../common/threads.scad>
include <../common/chamfers.scad>
include <../common/timing_belts.scad>

//y_endstop();
//y_rail_support();
//y_gantry_side();
//mirror([1, 0, 0]) x_motor_holder();
//x_gantry_middle_part();
//y_belt_blocker();
//y_motor_holder();
//x_rail_stopper();
//x_belt_attachment();
//z_carriage_fixed_base();
//z_carriage_moving_base();
//z_carriage_tool_support();
//laser_tool_support();
//laser_power_support();
//pen_tool_support();
//flex_dremel_support();
flex_dremel_mount_blocks();
//flex_dremel_mount_bottom_block();
//z_carriage_motor_holder();
//x_endstop_holder();
//y_pulley_idler();
//x_pulley_idler();
//gantry_side_cable_holder();
//gantry_side_90_cable_holder();
//flat_al_cable_holder();

SMALL_TOLERANCY = 0.2;

BELT_WIDTH = 6;
BELT_THICKNESS = 1.5;

M3_HEAD_DIAM = 6;
M3_HEAD_THICKNESS = 2;
M3_DIAM = 3;
M3_NUT_DIAM = 6.6;
M3_NUT_THICKNESS = 2.5;
M3_NUT_SIDE_TO_SIDE_THICKNESS = 6;
M3_WASHER_DIAM = 7;
M3_WASHER_THICKNESS= 0.4;

M2_DIAM = 2;
M2_HEAD_DIAM = 3;
M2_HEAD_THICKNESS = 1.5;
M2_NUT_DIAM = 5;
M2_NUT_THICKNESS = 1.5;


M6_NUT_THICKNESS = 4.7;
/* Width across flats */
M6_NUT_SIDE_TO_SIDE_WIDTH = 10;

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

/* MGN7 stuff */
MGN7_RAIL_HOLE_SPACING = 15;
MGN7_RAIL_CARRIAGE_THICKNESS = 8;
MGN7_HOLE_DIAMETER = M2_DIAM;
MGN7_RAIL_HEIGHT = 5;

MGN7H_HOLE_Y_OFFSET = 13;
MGN7H_HOLE_X_OFFSET = 12;
MGN7H_HOLE_DIAMETER = M2_DIAM;
MGN7H_WIDTH=17;
MGN7H_HEIGHT=30;

/* + 2 for end stop holes */
Y_RAIL_HOLE_COUNT = 10 + 2;
RAIL_HOLE_DIAM = M3_DIAM;
RAIL_NUT_THICKNESS = M3_NUT_THICKNESS;
RAIL_NUT_DIAM = M3_NUT_DIAM;
Y_RAIL_SUPPORT_HEIGHT = 22;
Y_RAIL_SUPPORT_THICKNESS = 7;
Y_RAIL_FIRST_HOLE_OFFSET = 8;

/* "Board" support */
BOARD_SUPPORT_WIDTH = 25;
BOARD_SUPPORT_HOLE_DIAM = M3_NUT_DIAM;
BOARD_SUPPORT_NUT_DIAM = M3_NUT_DIAM;
BOARD_SUPPORT_NUT_THICKNESS = M3_NUT_THICKNESS;
BOARD_SUPPORT_CHAMFER = 5;
BOARD_SUPPORT_HOLE_COUNT = 8;
BOARD_HOLE_OFFSET = 10;

/* Rail endstop */
RAIL_RS_HOLE_OFFSET = 12;
RAIL_ES_WIDTH = 16;
RAIL_RS_EXTRA = 2;
RAIL_RS_BOLT_DIAM = 3.2;
RAIL_ES_BOLT_HEAD_DIAM = M3_HEAD_DIAM;
RAIL_RS_BOLT_HEAD_THICKNESS = 4;
RAIL_ES_HOLDER_HOLE_SIZE = 10;

/* Microswitch parameters */
MICROSWITCH_HOLE_OFFSET = 5;
MICROSWITCH_HOLE_DIAM = 1.5;
MICROSWITCH_HOLE_SPACING = 6.5;
MICROSWITCH_WIDTH = 13;
MICROSWITCH_HEIGHT = 8;

/* Endstop holder length */
X_ESH_LENGTH = 25;
/* Size of microswitch mount */
X_ESH_MICROSWITCH_MOUNT_WIDTH = MICROSWITCH_WIDTH + 4;
X_ESH_MICROSWITCH_MOUNT_HEIGHT = 10;
/* Thickness */
X_ESH_THICKNESS = 5;
/* Bolt offset from start of endstop holder */
X_ESH_BOLT_X_OFFSET = 10;
/* End stop holder adjustment hole length */
X_ESH_OBLONG_SIZE = 5;

GANTRY_HEIGHT = 140;
GANTRY_WIDTH = 30;
GANTRY_THICKNESS = 8;
GANTRY_BOTTOM_CHAMFER_SIZE = 10;
GANTRY_BOLT_HOLE_DIAM = M3_DIAM;
GANTRY_BOLT_HEAD_DIAM = M3_HEAD_DIAM;
GANTRY_NUT_HEAD_THICKNESS = 1.5;
GANTRY_CARRIAGE_Y_OFFSET = 22;

/* Middle part */
GANTRY_RAIL_MIDDLE_HOLE_COUNT = 8;
GANTRY_MIDDLE_PART_EXTRA = 3;
/* How much is the gantry into the MG carriage */
GANTRY_MGN9C_DEPTH = 1;

/* NEMA stuff */
NEMA17_THICKNESS = 33;
NEMA17_WIDTH = 42.5;
NEMA17_HOLE_SPACING = 31;
NEMA17_CENTER_DIAM = 25;
NEMA17_ATTACHMENT_THICKNESS = 8;
/* Size of hole for belt pulley (maximize to allow some slack) */
NEMA17_BELT_HOLE_DIAM = 20;
/* Space between both side of the belt when tensionned */
BELT_PULLEY_DIAM = 12;
BELT_PULLEY_THICKNESS = 10;
/* Oblong hole size for adjusting belt tension */
NEMA17_OBLONG_SIZE = 2;
/* Little part longer than the rest */
NEMA17_ATTACHMENT_LENGTH = 15;
NEMA17_ROUNDING = 2;
NEMA17_HOLE_DIAM = 3;

NEMA14_THICKNESS = 28;
NEMA14_WIDTH = 35.2;
NEMA14_HOLE_SPACING = 26;
NEMA14_CENTER_DIAM = 26;
NEMA14_BELT_HOLE_DIAM = 16;

GANTRY_NEMA17_HOLE_Z_OFFSET = NEMA17_WIDTH/2 - NEMA17_BELT_HOLE_DIAM/2;

/* Small bearing carriage dimension */
MGN9C_WIDTH = 30;
MGN9C_HEIGHT = 20.5;
MGN9C_NUT_DIAM = M3_DIAM;
MGN9C_HOLE_OFFSET = 2.75;
MGN9C_HOLE_X_OFFSET = 10;
MGN9C_HOLE_Y_OFFSET = 15;

FLAT_AL_STRIP_WIDTH = 25 + SMALL_TOLERANCY;
FLAT_AL_STRIP_THICKNESS = 2 + SMALL_TOLERANCY;
FLAT_AL_TIGHTEN_SIZE = 40;

/* Gantry top part */
GANTRY_TOP_WIDTH = NEMA17_WIDTH;
GANTRY_TOP_HEIGHT = Y_RAIL_FIRST_HOLE_OFFSET + RAIL_HOLE_SPACING + GANTRY_THICKNESS + RAIL_HOLE_SPACING / 2 ;
GANTRY_TOP_THICKNESS = 8;
GANTRY_TOP_CHAMFER_SIZE = 8;

/* Slope part of gantry */
SLOPE_PART_Y_OFFSET =  GANTRY_CARRIAGE_Y_OFFSET  - MGN9C_HOLE_OFFSET + MGN9C_HEIGHT;
SLOPE_PART_HEIGHT = GANTRY_HEIGHT - GANTRY_TOP_WIDTH -  SLOPE_PART_Y_OFFSET;
SLOPE_OFFSET = 20;

/* Bottom belt blocker */
Y_BELT_BLOCKER_THICKNESS = 3;
Y_BELT_Z_OFFSET = 16;
Y_BELT_BLOCKER_HEIGHT = 25;

/* Derived from constants */
FULL_SUPPORT_LENGTH = RAIL_LENGTH + 2 * FEET_WIDTH;
FULL_FEET_HEIGHT = FEET_HEIGTH + Y_RAIL_SUPPORT_HEIGHT;
BOARD_HOLE_SPACING = (FULL_SUPPORT_LENGTH - (2 * BOARD_HOLE_OFFSET)) / (BOARD_SUPPORT_HOLE_COUNT);
RAIL_RS_LENGTH = RAIL_RS_HOLE_OFFSET + RAIL_RS_EXTRA + 5;
RAIL_RS_FULL_HEIGHT = RAIL_HEIGHT + RAIL_RS_EXTRA;

/* Belt blocker top part thickness */
X_BELT_BLOCKER_TOP_THICKNESS = 8;
/* Width between x belt and gantry top part */
BELT_PULLEY_MOTOR_OFFSET = 4;
/* Height between y belt and gantry top */
X_BELT_EXTRA_WIDTH_FROM_TOP = 4;
/* Space between carriage and rail support */
CARRIAGE_SPACE_BETWEEN_SUPPORT = 10;
/* Thickness added around belt */
X_BELT_BLOCKER_EXTRA_THICKNESS = 2;
/* Small offset from x to allow belt being in the part */
X_BELT_BLOCKER_BELT_Y_OFFSET = 3;
/* Width of belt blocker */
X_BELT_BLOCKER_WIDTH = 20;
/* Radius of reserve of belt blocker */
X_BELT_BLOCKER_BELT_RESERVE_DIAM = 10;

X_BELT_BLOCKER_THICKNESS  = BELT_WIDTH + X_BELT_BLOCKER_EXTRA_THICKNESS;
/* Height between top of belt and top y blocker part */
X_BELT_HEIGHT_FROM_GANTRY_TOP = GANTRY_TOP_WIDTH/2  - BELT_PULLEY_DIAM/2 + X_BELT_EXTRA_WIDTH_FROM_TOP;
X_BELT_BLOCKER_HEIGHT =  2 * X_BELT_BLOCKER_EXTRA_THICKNESS ;

/* total width from external part of the belt to external part of the carriage */
X_BELT_WIDTH_TO_CARRIAGE = BELT_WIDTH + BELT_PULLEY_MOTOR_OFFSET + GANTRY_TOP_THICKNESS + CARRIAGE_SPACE_BETWEEN_SUPPORT;
/* Hole attachment spacing */
X_BELT_HOLE_SPACING = X_BELT_BLOCKER_WIDTH / 2;

/* Carriage holder */
Z_AXIS_SIDE_WIDTH = 10;
/* Carriage holder thickness */
Z_AXIS_THICKNESS = 6;
/* Depth of carriage dimension into this  */
Z_AXIS_CARRIAGE_DEPTH = 0.6;
/* Full M3 head thickness to sunk it in the layer */
Z_AXIS_M3_HEAD_THICKNESS = 3;

/* Additionnal height on the top */
Z_AXIS_FB_TOP_HEIGHT = 30;
/* Additionnal height on the bottom */
Z_AXIS_FB_BOTTOM_HEIGHT = 10;

Z_AXIS_FB_HEIGHT = Z_AXIS_FB_BOTTOM_HEIGHT + Z_AXIS_FB_TOP_HEIGHT + MGN9C_HEIGHT;
Z_AXIS_FB_WIDTH = MGN9C_WIDTH + 2 * Z_AXIS_SIDE_WIDTH;

/* Guide for real carriage (width ) */
Z_AXIS_GUIDE_WIDTH = 2;
/* Guide for real carriage (thickness) */
Z_AXIS_GUIDE_THICKNESS = 1;

/* offset from each side of carriage holder */
Z_AXIS_FB_HOLE_OFFSET_FROM_SIDE = 4;
/* Space between the two long holes to attach carriage */
Z_AXIS_FB_SPACE_BETWEEN_HOLES = 4;

/* Oblong holes for real carriage */
Z_AXIS_FB_OBLONG_HOLE_LENGTH = Z_AXIS_FB_HEIGHT/2 - Z_AXIS_FB_HOLE_OFFSET_FROM_SIDE - Z_AXIS_FB_SPACE_BETWEEN_HOLES / 2 -  M3_WASHER_DIAM/2;

/* Offset between the two belts for end of belt */
SECOND_BELT_OFFSET = 3;

/* Thickness of side of motor holder */
Y_MOTOR_HOLDER_THICKNESS = 5;
/* Little side width (where the screws are) */
Y_MOTOR_HOLDER_SIDE_WIDTH = 20;


/* Ziptie width */
ZIPTIE_WIDTH = 3.5;
/* Ziptie thickness */
ZIPTIE_THICKNESS = 1.4;
/* Sizeof side mount */
ZIPTIE_MOUNT_SIDE_WIDTH = 6;
/* Height of mouting base */
ZIPTIE_MOUNT_HEIGHT = 6;
/* Added thickness on top of ziptie hole */
ZIPTIE_MOUNT_ADD_THICKNESS = 1.5;
/* Full ziptie mount thickness */
ZIPTIE_MOUNT_THICKNESS = ZIPTIE_MOUNT_ADD_THICKNESS + ZIPTIE_THICKNESS;

module sliding_rails(width1, width2, height, thickness) {
    linear_extrude(height = thickness)  polygon(points = [[-width1/2, 0],[width1/2, 0],[width2/2, height],[-width2/2, height]]);
}

module ziptie_mount() {
    difference() {
        union () {
            difference() {
                cube([ZIPTIE_WIDTH, ZIPTIE_MOUNT_HEIGHT , ZIPTIE_MOUNT_THICKNESS]);
                cube([ZIPTIE_WIDTH, ZIPTIE_MOUNT_HEIGHT , ZIPTIE_THICKNESS]);
            }
            translate([ZIPTIE_WIDTH + ZIPTIE_MOUNT_SIDE_WIDTH, 0, 0]) rotate([0, 0, 90]) prism(ZIPTIE_MOUNT_HEIGHT, ZIPTIE_MOUNT_SIDE_WIDTH,ZIPTIE_MOUNT_THICKNESS);
            translate([-ZIPTIE_MOUNT_SIDE_WIDTH, ZIPTIE_MOUNT_HEIGHT, 0]) rotate([0, 0, -90]) prism(ZIPTIE_MOUNT_HEIGHT, ZIPTIE_MOUNT_SIDE_WIDTH,ZIPTIE_MOUNT_THICKNESS);
        }
        translate([-ZIPTIE_MOUNT_SIDE_WIDTH, ZIPTIE_MOUNT_HEIGHT/2 - ZIPTIE_WIDTH/2, 0]) cube([ZIPTIE_WIDTH + 2 * ZIPTIE_MOUNT_SIDE_WIDTH, ZIPTIE_WIDTH , ZIPTIE_THICKNESS + SMALL_TOLERANCY]);
    }
}


module half_cylinder(diam, t, h) {
    translate([diam/2, diam/2, 0])
    difference() {
        cylinder(d = diam, h = h);
        translate([0, -diam/2, 0]) cube([diam/2, diam, h]);

        cylinder(d = diam - 2 * t, h = h);
    }
}

module support_feet() {
    difference() {
        union () {
            cube([FEET_WIDTH, FULL_FEET_HEIGHT, Y_RAIL_SUPPORT_THICKNESS]);
            /* Chamfer between feet and fixation */
            translate([0, FEET_THICKNESS, FEET_GROUND_CHAMFER + Y_RAIL_SUPPORT_THICKNESS]) rotate([-90, 0, 0]) chamfer(FEET_WIDTH, FEET_GROUND_CHAMFER, FEET_GROUND_CHAMFER);
            roundedcube([FEET_WIDTH, FEET_THICKNESS, FEET_SIZE], false, 1, "x");

        }
        translate([FEET_WIDTH/2, FEET_THICKNESS, FEET_SIZE / 4 * 3]) rotate([90, 0, 0]) cylinder(d = BOARD_SUPPORT_HOLE_DIAM, h =FEET_THICKNESS);
    }
}

module support_board() {
    /* Support for cutting board */
    translate([0, Y_RAIL_SUPPORT_HEIGHT - Y_RAIL_SUPPORT_THICKNESS, 0])
    difference() {
        roundedcube([FULL_SUPPORT_LENGTH, Y_RAIL_SUPPORT_THICKNESS, BOARD_SUPPORT_WIDTH], false, 1, "x");


        for (hole = [0:BOARD_SUPPORT_HOLE_COUNT-1]) {
            translate([FULL_SUPPORT_LENGTH/2 - (BOARD_HOLE_SPACING * (BOARD_SUPPORT_HOLE_COUNT - 1))/2 + hole * BOARD_HOLE_SPACING, 0, BOARD_SUPPORT_WIDTH /3 * 2]) rotate([-90, 0, 0]) {
                cylinder(d = BOARD_SUPPORT_HOLE_DIAM, h = Y_RAIL_SUPPORT_THICKNESS);
                cylinder(d = BOARD_SUPPORT_NUT_DIAM, h = BOARD_SUPPORT_NUT_THICKNESS, $fn=6);
            }

        }
    }

    translate([0, Y_RAIL_SUPPORT_HEIGHT - Y_RAIL_SUPPORT_THICKNESS -  BOARD_SUPPORT_CHAMFER, Y_RAIL_SUPPORT_THICKNESS])  chamfer(FULL_SUPPORT_LENGTH, BOARD_SUPPORT_CHAMFER, BOARD_SUPPORT_CHAMFER);
}

module side_support() {
    /* Main "beam" */
    cube([FULL_SUPPORT_LENGTH, Y_RAIL_SUPPORT_HEIGHT, Y_RAIL_SUPPORT_THICKNESS]);

    support_board();

    /* Feets */
    translate([0, - FEET_HEIGTH, 0]) {
        /*  First feet */
        translate([FEET_WIDTH, FEET_HEIGTH - FEET_CHAMFER, Y_RAIL_SUPPORT_THICKNESS]) rotate([0, 90, 0]) chamfer(Y_RAIL_SUPPORT_THICKNESS, FEET_CHAMFER, FEET_CHAMFER);
        support_feet();

        /*  Second feet (most far from origin)*/
        translate([RAIL_LENGTH + FEET_WIDTH, FEET_HEIGTH - FEET_CHAMFER, Y_RAIL_SUPPORT_THICKNESS]) mirror(0, 1, 0) rotate([0, 90, 0]) chamfer(Y_RAIL_SUPPORT_THICKNESS, FEET_CHAMFER, FEET_CHAMFER);
        translate([FULL_SUPPORT_LENGTH - FEET_WIDTH, 0, 0])  support_feet();
    }
}

module y_rail_support() {
    difference() {

        side_support();
        translate([FULL_SUPPORT_LENGTH / 2 - (((Y_RAIL_HOLE_COUNT-1) / 2) * RAIL_HOLE_SPACING), Y_RAIL_SUPPORT_HEIGHT / 3, 0]) {
            for (hole = [0:Y_RAIL_HOLE_COUNT-1]) {
                translate([hole * RAIL_HOLE_SPACING, 0, -0.5]) cylinder(d = RAIL_HOLE_DIAM, h = Y_RAIL_SUPPORT_THICKNESS + 1);
                translate([hole * RAIL_HOLE_SPACING, 0, Y_RAIL_SUPPORT_THICKNESS - RAIL_NUT_THICKNESS]) cylinder(d = RAIL_NUT_DIAM, h = RAIL_NUT_THICKNESS, $fn = 6);
            }
        }
    }
}

module y_endstop() {
    difference() {
        roundedcube([RAIL_RS_LENGTH, RAIL_ES_WIDTH + 2 * + RAIL_RS_EXTRA, RAIL_RS_FULL_HEIGHT], true, 1, "zmax");
translate([RAIL_RS_LENGTH/2 - RAIL_RS_EXTRA/2, 0, -RAIL_RS_FULL_HEIGHT/2 + (RAIL_HEIGHT + SMALL_TOLERANCY)/2]) cube([RAIL_RS_EXTRA, RAIL_WIDTH, RAIL_HEIGHT + SMALL_TOLERANCY], true);
        translate([RAIL_RS_LENGTH/2 - RAIL_RS_HOLE_OFFSET - RAIL_RS_EXTRA, 0, -RAIL_RS_FULL_HEIGHT/2]) cylinder(d = RAIL_RS_BOLT_DIAM, h = RAIL_RS_FULL_HEIGHT);
        translate([RAIL_RS_LENGTH/2 - RAIL_RS_HOLE_OFFSET - RAIL_RS_EXTRA, 0, RAIL_RS_FULL_HEIGHT/2 - RAIL_RS_BOLT_HEAD_THICKNESS]) cylinder(d = RAIL_ES_BOLT_HEAD_DIAM, h = RAIL_RS_BOLT_HEAD_THICKNESS);

        /* Holes for endstop */
        translate([RAIL_RS_LENGTH/2 -MICROSWITCH_HOLE_OFFSET , MICROSWITCH_HOLE_SPACING/2, 0]) cylinder(d = MICROSWITCH_HOLE_DIAM, h = RAIL_RS_FULL_HEIGHT, center = true);
        translate([RAIL_RS_LENGTH/2 -MICROSWITCH_HOLE_OFFSET , -MICROSWITCH_HOLE_SPACING/2, 0]) cylinder(d = MICROSWITCH_HOLE_DIAM, h = RAIL_RS_FULL_HEIGHT, center = true);
    }

}


module gantry_bottom_holes() {
        translate([GANTRY_WIDTH/2 - (FLAT_AL_STRIP_WIDTH /2) / 4 * 2, 0, 0]) rotate([-90, 0, 0])cylinder(d = GANTRY_BOLT_HOLE_DIAM, h = GANTRY_THICKNESS);
        translate([GANTRY_WIDTH/2 + (FLAT_AL_STRIP_WIDTH /2) / 4 * 2, 0, 0]) rotate([-90, 0, 0])cylinder(d = GANTRY_BOLT_HOLE_DIAM, h = GANTRY_THICKNESS);
}

module gantry_carriage_holes(diam, thickness) {
    cylinder(d = diam, h = thickness);
    translate([MGN9C_HOLE_X_OFFSET, 0, 0]) cylinder(d = diam, h = thickness);
    translate([MGN9C_HOLE_X_OFFSET, MGN9C_HOLE_Y_OFFSET, 0]) cylinder(d = diam, h = thickness);
    translate([0, MGN9C_HOLE_Y_OFFSET, 0]) cylinder(d = diam, h = thickness);
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

        translate([0, GANTRY_TOP_WIDTH/2, GANTRY_THICKNESS + Y_RAIL_FIRST_HOLE_OFFSET]) rotate([0, 90, 0]) cylinder(d = GANTRY_BOLT_HOLE_DIAM, h = GANTRY_TOP_THICKNESS);
        translate([0, GANTRY_TOP_WIDTH/2, GANTRY_THICKNESS + Y_RAIL_FIRST_HOLE_OFFSET + RAIL_HOLE_SPACING]) rotate([0, 90, 0]) cylinder(d = GANTRY_BOLT_HOLE_DIAM, h = GANTRY_TOP_THICKNESS);

        /* Rail footprint */
        translate([-RAIL_HEIGHT, GANTRY_TOP_WIDTH/2- RAIL_WIDTH/2, 0]) cube([RAIL_HEIGHT, RAIL_WIDTH, 100]);
        /* Hole for NEMA attachment */
        translate([0, GANTRY_NEMA17_HOLE_Z_OFFSET/2, GANTRY_THICKNESS + NEMA17_ATTACHMENT_LENGTH]) rotate([0, 90, 0]) {
           #cylinder(d = M3_DIAM, h = GANTRY_TOP_THICKNESS);
           translate([0, 0, -GANTRY_TOP_THICKNESS + M3_NUT_THICKNESS]) cylinder(d = M3_NUT_DIAM, h = GANTRY_TOP_THICKNESS, $fn = 6);
        }
        /* Hole to attach x endstop holder */
        translate([GANTRY_TOP_THICKNESS/2, GANTRY_TOP_WIDTH, GANTRY_THICKNESS + X_ESH_BOLT_X_OFFSET]) rotate([90, 0, 0]) cylinder(d = M3_DIAM - SMALL_TOLERANCY, h = GANTRY_TOP_WIDTH/2 - FLAT_AL_STRIP_WIDTH/2);
    }
}

module y_gantry_side()
{
    difference() {
        union() {
            difference() {
                union () {
                    cube([GANTRY_WIDTH, SLOPE_PART_Y_OFFSET, GANTRY_THICKNESS]);
                    translate([SLOPE_OFFSET, SLOPE_PART_Y_OFFSET + SLOPE_PART_HEIGHT, 0]) cube([GANTRY_WIDTH, GANTRY_TOP_WIDTH, GANTRY_THICKNESS]);

                    translate([0, SLOPE_PART_Y_OFFSET, 0]) slope_part(GANTRY_WIDTH, SLOPE_PART_HEIGHT, GANTRY_THICKNESS, SLOPE_OFFSET);
                }
                translate([GANTRY_WIDTH/2 - MGN9C_HOLE_X_OFFSET/2, GANTRY_CARRIAGE_Y_OFFSET, 0]) gantry_carriage_holes(GANTRY_BOLT_HOLE_DIAM, GANTRY_THICKNESS);
                /* Holes for bolt head */
                //translate([GANTRY_WIDTH/2 - MGN9C_HOLE_X_OFFSET/2, GANTRY_CARRIAGE_Y_OFFSET, - GANTRY_THICKNESS + GANTRY_NUT_HEAD_THICKNESS]) gantry_carriage_holes(GANTRY_BOLT_HEAD_DIAM);
                translate([0, GANTRY_CARRIAGE_Y_OFFSET - MGN9C_HOLE_OFFSET, GANTRY_THICKNESS - GANTRY_MGN9C_DEPTH])  cube([MGN9C_WIDTH, MGN9C_HEIGHT, GANTRY_MGN9C_DEPTH]);

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
        translate([SLOPE_OFFSET + GANTRY_WIDTH - GANTRY_WIDTH/2, GANTRY_HEIGHT - GANTRY_TOP_WIDTH/2, GANTRY_THICKNESS/2]) rotate([0, 90, 0])  cylinder(d = M3_DIAM, h = GANTRY_WIDTH/2);
    }
}

module x_gantry_middle_part() {
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

module y_belt_blocker () {
    BELT_BLOCKER_WIDTH = 2 * Y_BELT_BLOCKER_THICKNESS + FLAT_AL_STRIP_WIDTH;
    BELT_BLOCKER_THICKNESS = FLAT_AL_STRIP_THICKNESS + 2 * Y_BELT_BLOCKER_THICKNESS;
    MIDDLE_BLOCK_THICKNESS = Y_BELT_BLOCKER_THICKNESS * 2 + SECOND_BELT_OFFSET + 2;
    MIDDLE_BLOCK_HEIGHT = Y_BELT_Z_OFFSET - Y_BELT_BLOCKER_THICKNESS + BELT_WIDTH;

    difference() {
        cube([BELT_BLOCKER_WIDTH, Y_BELT_BLOCKER_HEIGHT, BELT_BLOCKER_THICKNESS]);
        translate([BELT_BLOCKER_WIDTH/2 - FLAT_AL_STRIP_WIDTH/2, 0, Y_BELT_BLOCKER_THICKNESS])cube([FLAT_AL_STRIP_WIDTH, Y_BELT_BLOCKER_HEIGHT, FLAT_AL_STRIP_THICKNESS]);
        translate([BELT_BLOCKER_WIDTH/2, Y_BELT_BLOCKER_HEIGHT/2, 0]) cylinder(d = M3_DIAM - SMALL_TOLERANCY, h = FLAT_AL_STRIP_THICKNESS + Y_BELT_BLOCKER_THICKNESS );
    }
    translate([0, 0, BELT_BLOCKER_THICKNESS]) { 
        chamfer(BELT_BLOCKER_WIDTH, Y_BELT_BLOCKER_HEIGHT/2 - MIDDLE_BLOCK_THICKNESS/2, Y_BELT_Z_OFFSET, $fn = 50);
        translate([0, Y_BELT_BLOCKER_HEIGHT, 0]) mirror([0, 1, 0]) chamfer(BELT_BLOCKER_WIDTH, Y_BELT_BLOCKER_HEIGHT/2 - MIDDLE_BLOCK_THICKNESS/2, Y_BELT_Z_OFFSET, $fn = 50);
    }
    difference() {
        translate([0, Y_BELT_BLOCKER_HEIGHT/2 - MIDDLE_BLOCK_THICKNESS/2 , BELT_BLOCKER_THICKNESS]) cube([BELT_BLOCKER_WIDTH, MIDDLE_BLOCK_THICKNESS , MIDDLE_BLOCK_HEIGHT]);
 
       translate([0, Y_BELT_BLOCKER_HEIGHT/2 - SECOND_BELT_OFFSET/2 - 0.5,  BELT_WIDTH/2 + Y_BELT_BLOCKER_THICKNESS + FLAT_AL_STRIP_THICKNESS + Y_BELT_Z_OFFSET]) scale([1, 1.2, 1.1]) {
            belt_len(profile = tGT2_2, belt_width = BELT_WIDTH, len = BELT_BLOCKER_WIDTH);
            translate([0, SECOND_BELT_OFFSET, 0]) belt_len(profile = tGT2_2, belt_width = BELT_WIDTH, len = BELT_BLOCKER_WIDTH);
       }
       }
}


module oblong_hole(d, h, w) {
    hull() {
        cylinder(d = d, h = h);
        translate([0, -w, 0]) cylinder(d = d, h = h);
    }
}

module upper_nema17_part () {
    UPPER_NEMA17_PART_WIDTH = GANTRY_WIDTH + NEMA17_ATTACHMENT_THICKNESS;

    difference() {
        cube([NEMA17_ATTACHMENT_THICKNESS, GANTRY_THICKNESS, UPPER_NEMA17_PART_WIDTH]);
        translate([0, GANTRY_THICKNESS - GANTRY_THICKNESS/2, GANTRY_TOP_THICKNESS + GANTRY_WIDTH/4]) rotate([0, 90, 0]) {
            cylinder(d = M3_DIAM, h = NEMA17_ATTACHMENT_THICKNESS);
            translate([0, 0, NEMA17_ATTACHMENT_THICKNESS - M3_HEAD_THICKNESS]) cylinder(d = M3_HEAD_DIAM, h = NEMA17_ATTACHMENT_THICKNESS);
        }
        translate([0, GANTRY_THICKNESS - GANTRY_THICKNESS/2, GANTRY_TOP_THICKNESS + GANTRY_WIDTH/4 * 3]) rotate([0, 90, 0]) {
             cylinder(d = M3_DIAM, h = NEMA17_ATTACHMENT_THICKNESS);
            translate([0, 0, NEMA17_ATTACHMENT_THICKNESS - M3_HEAD_THICKNESS]) cylinder(d = M3_HEAD_DIAM, h = NEMA17_ATTACHMENT_THICKNESS);
        }
    }
}


module nema_support(part_width, part_height, thickness, nema_width, hole_spacing, center_diam, belt_hole_diam, extra_bottom_size = 0, nema_head_diameter = M3_HEAD_DIAM)
{
    difference() {
        union() {
            translate([0, -extra_bottom_size, 0]) cube([part_width, part_height + extra_bottom_size, thickness]);
        }
        for(i = [0:1]) {
            for(j = [0:1]) {
                offset_h = nema_width/2 - hole_spacing/2;
                translate([offset_h + i * hole_spacing, offset_h+ j * hole_spacing, 0])  {
                    oblong_hole(d = NEMA17_HOLE_DIAM, h = thickness, w = NEMA17_OBLONG_SIZE);
                    translate([0, 0,- thickness + M3_HEAD_THICKNESS ]) oblong_hole(d = nema_head_diameter, h = thickness, w = NEMA17_OBLONG_SIZE);
                }
            }
        }
        /* Hole for NEMA motor */
        translate([nema_width/2, nema_width/2, 0]) cylinder (d = center_diam, h = thickness);
        translate([nema_width/2 - belt_hole_diam/2, nema_width/2, 0]) cube([belt_hole_diam, center_diam + NEMA17_ATTACHMENT_LENGTH + GANTRY_THICKNESS, thickness]);
    }
}

module nema17_support(part_width, part_height, thickness)
{
    nema_support(part_width, part_height, thickness, NEMA17_WIDTH, NEMA17_HOLE_SPACING, NEMA17_CENTER_DIAM, NEMA17_BELT_HOLE_DIAM);
}

module x_motor_holder()
{
    nema17_support(NEMA17_WIDTH + NEMA17_ATTACHMENT_THICKNESS, NEMA17_WIDTH + GANTRY_THICKNESS, NEMA17_ATTACHMENT_THICKNESS);
    difference() {
        union() {
            /* Longer part */

            translate( [0, NEMA17_WIDTH + GANTRY_THICKNESS, 0]) cube([NEMA17_WIDTH / 2, NEMA17_ATTACHMENT_LENGTH, NEMA17_ATTACHMENT_THICKNESS]);
            /* Longer part end rounding */
            translate([GANTRY_NEMA17_HOLE_Z_OFFSET/2, NEMA17_WIDTH + GANTRY_THICKNESS + NEMA17_ATTACHMENT_LENGTH, 0]) cylinder (d = GANTRY_NEMA17_HOLE_Z_OFFSET, h = NEMA17_ATTACHMENT_THICKNESS);
                   /* Upper part */
            translate([NEMA17_WIDTH, NEMA17_WIDTH, 0]) upper_nema17_part();
             translate([NEMA17_WIDTH, 0, NEMA17_ATTACHMENT_THICKNESS]) prism(NEMA17_ATTACHMENT_THICKNESS, NEMA17_WIDTH, GANTRY_WIDTH);
        }

        /* Longer part end hole */
            translate([GANTRY_NEMA17_HOLE_Z_OFFSET/2, NEMA17_WIDTH + GANTRY_THICKNESS + NEMA17_ATTACHMENT_LENGTH, 0]) cylinder (d = M3_DIAM, h = NEMA17_ATTACHMENT_THICKNESS);
            translate([GANTRY_NEMA17_HOLE_Z_OFFSET/2, NEMA17_WIDTH + GANTRY_THICKNESS + NEMA17_ATTACHMENT_LENGTH, - NEMA17_ATTACHMENT_THICKNESS + M3_HEAD_THICKNESS]) cylinder (d = M3_HEAD_DIAM, h = NEMA17_ATTACHMENT_THICKNESS);

        /* Hole for NEMA motor */
        translate([NEMA17_WIDTH/2, NEMA17_WIDTH/2, 0]) cylinder (d = NEMA17_CENTER_DIAM, h = NEMA17_ATTACHMENT_THICKNESS);
        translate([NEMA17_WIDTH/2 - NEMA17_BELT_HOLE_DIAM/2, NEMA17_WIDTH/2, 0]) cube([NEMA17_BELT_HOLE_DIAM, NEMA17_CENTER_DIAM + NEMA17_ATTACHMENT_LENGTH + GANTRY_THICKNESS, NEMA17_ATTACHMENT_THICKNESS]);
    }
}

module y_motor_holder_side()
{
    difference() {
        union () {
            cube([Y_MOTOR_HOLDER_THICKNESS, NEMA17_WIDTH, NEMA17_THICKNESS + NEMA17_ATTACHMENT_THICKNESS]);
            cube([Y_MOTOR_HOLDER_SIDE_WIDTH + Y_MOTOR_HOLDER_THICKNESS, NEMA17_WIDTH, Y_MOTOR_HOLDER_THICKNESS]);
               
            /* Side prism */
            translate([Y_MOTOR_HOLDER_SIDE_WIDTH + Y_MOTOR_HOLDER_THICKNESS, 0, Y_MOTOR_HOLDER_THICKNESS]) rotate([0, 0, 90]) {
                prism(Y_MOTOR_HOLDER_THICKNESS, Y_MOTOR_HOLDER_SIDE_WIDTH, NEMA17_THICKNESS + NEMA17_ATTACHMENT_THICKNESS - Y_MOTOR_HOLDER_THICKNESS);
          
                translate([NEMA17_WIDTH - Y_MOTOR_HOLDER_THICKNESS, 0, 0]) prism(Y_MOTOR_HOLDER_THICKNESS, Y_MOTOR_HOLDER_SIDE_WIDTH, NEMA17_THICKNESS + NEMA17_ATTACHMENT_THICKNESS - Y_MOTOR_HOLDER_THICKNESS);
            }
        }
        translate([Y_MOTOR_HOLDER_SIDE_WIDTH / 4 * 3, NEMA17_WIDTH/3, 0]) cylinder(d = M3_DIAM, h = Y_MOTOR_HOLDER_THICKNESS);
        translate([Y_MOTOR_HOLDER_SIDE_WIDTH / 4 * 3, NEMA17_WIDTH/3 * 2, 0]) cylinder(d = M3_DIAM, h = Y_MOTOR_HOLDER_THICKNESS);
    }
}


module y_motor_holder()
{
    nema17_support(NEMA17_WIDTH, NEMA17_WIDTH, NEMA17_ATTACHMENT_THICKNESS);
    translate([0, 0, NEMA17_THICKNESS + NEMA17_ATTACHMENT_THICKNESS])rotate([0, 180, 0]) y_motor_holder_side();
    translate([NEMA17_WIDTH, NEMA17_WIDTH, NEMA17_THICKNESS + NEMA17_ATTACHMENT_THICKNESS])rotate([0, 180, 180]) y_motor_holder_side();
}

module x_rail_stopper()
{
        difference() {
            union () {
                translate([RAIL_RS_LENGTH/4, 0, 0]) roundedcube([RAIL_RS_LENGTH/2, RAIL_ES_WIDTH + 2 * + RAIL_RS_EXTRA, RAIL_RS_FULL_HEIGHT], true, 1, "zmax");
                roundedcube([RAIL_RS_LENGTH, RAIL_WIDTH, RAIL_RS_FULL_HEIGHT], true, 1, "zmax");

            }
    translate([RAIL_RS_LENGTH/2 - RAIL_RS_EXTRA/2, 0, -RAIL_RS_FULL_HEIGHT/2 + (RAIL_HEIGHT + SMALL_TOLERANCY)/2]) cube([RAIL_RS_EXTRA, RAIL_WIDTH, RAIL_HEIGHT + SMALL_TOLERANCY], true);
        translate([RAIL_RS_LENGTH/2 - RAIL_RS_HOLE_OFFSET - RAIL_RS_EXTRA, 0, -RAIL_RS_FULL_HEIGHT/2]) cylinder(d = RAIL_RS_BOLT_DIAM, h = RAIL_RS_FULL_HEIGHT);
        translate([RAIL_RS_LENGTH/2 - RAIL_RS_HOLE_OFFSET - RAIL_RS_EXTRA, 0, RAIL_RS_FULL_HEIGHT/2 - RAIL_RS_BOLT_HEAD_THICKNESS]) cylinder(d = RAIL_ES_BOLT_HEAD_DIAM, h = RAIL_RS_BOLT_HEAD_THICKNESS);
    }
}

module x_endstop_holder()
{
        difference() {
            union () {
                translate([X_ESH_LENGTH - X_ESH_MICROSWITCH_MOUNT_HEIGHT/2, 0, 0]) roundedcube([X_ESH_MICROSWITCH_MOUNT_HEIGHT, X_ESH_MICROSWITCH_MOUNT_WIDTH, X_ESH_THICKNESS], true, 0.5, "zmax");
                translate([X_ESH_LENGTH/2, 0, 0]) roundedcube([X_ESH_LENGTH, GANTRY_TOP_THICKNESS, X_ESH_THICKNESS], true, 0.5, "zmax");
            }
     /* Screw hole */
        translate([X_ESH_BOLT_X_OFFSET, 0, -X_ESH_THICKNESS/2]) rotate([0, 0, -90]) oblong_hole(d = M3_DIAM, w = X_ESH_OBLONG_SIZE, h =X_ESH_THICKNESS);
        translate([X_ESH_BOLT_X_OFFSET, 0, X_ESH_THICKNESS/2 - M3_HEAD_THICKNESS]) rotate([0, 0, -90]) oblong_hole(d = M3_HEAD_DIAM, w = X_ESH_OBLONG_SIZE, h =X_ESH_THICKNESS);

        /* Holes for endstop */
         translate([X_ESH_LENGTH - MICROSWITCH_HOLE_OFFSET, 0, 0]) {
            translate([0 , MICROSWITCH_HOLE_SPACING/2, 0]) cylinder(d = MICROSWITCH_HOLE_DIAM, h = RAIL_RS_FULL_HEIGHT, center = true);
            translate([0 , -MICROSWITCH_HOLE_SPACING/2, 0]) cylinder(d = MICROSWITCH_HOLE_DIAM, h = RAIL_RS_FULL_HEIGHT, center = true);
         }
    }
}

module y_belt_bolt_nut_hole() {
    cylinder(d = M3_DIAM, h  = X_BELT_WIDTH_TO_CARRIAGE, center = true);
    translate([0, 0, X_BELT_WIDTH_TO_CARRIAGE/2 - 7]) cube([M3_NUT_SIDE_TO_SIDE_THICKNESS, X_BELT_BLOCKER_TOP_THICKNESS, M3_NUT_THICKNESS], center = true);
}

module x_belt_attachment() {
   X_BELT_BLOCKER_BELT_PART_HEIGHT =  X_BELT_HEIGHT_FROM_GANTRY_TOP +X_BELT_BLOCKER_TOP_THICKNESS + X_BELT_BLOCKER_BELT_Y_OFFSET;
    difference() {
        union () {
           translate([0, X_BELT_BLOCKER_BELT_PART_HEIGHT / 2, X_BELT_BLOCKER_THICKNESS/2 ])color("green") roundedcube([X_BELT_BLOCKER_WIDTH,X_BELT_BLOCKER_BELT_PART_HEIGHT, X_BELT_BLOCKER_THICKNESS], true, 1, "z");
        }
       /* Belt */
        translate([-X_BELT_BLOCKER_WIDTH/2, X_BELT_BLOCKER_BELT_Y_OFFSET, BELT_WIDTH/2])
        scale([1, 1.1, 1]) mirror([0, 1, 0]) belt_len(profile = tGT2_2, belt_width = BELT_WIDTH, len = X_BELT_BLOCKER_WIDTH);

        translate([-X_BELT_BLOCKER_WIDTH/2, X_BELT_BLOCKER_BELT_Y_OFFSET + SECOND_BELT_OFFSET, BELT_WIDTH/2])
        scale([1, 1.1, 1]) mirror([0, 1, 0]) belt_len(profile = tGT2_2, belt_width = BELT_WIDTH, len = X_BELT_BLOCKER_WIDTH);
    }
    /* Top attachment part */
    translate([0, X_BELT_BLOCKER_BELT_PART_HEIGHT - X_BELT_BLOCKER_TOP_THICKNESS/2, X_BELT_WIDTH_TO_CARRIAGE/2])
    difference () {
    roundedcube([X_BELT_BLOCKER_WIDTH,X_BELT_BLOCKER_TOP_THICKNESS, X_BELT_WIDTH_TO_CARRIAGE ], true, 1, "z");
        /* Holes to attach to carriage */
        translate([X_BELT_BLOCKER_WIDTH/2 - X_BELT_HOLE_SPACING/2, 0, 0]){
            y_belt_bolt_nut_hole();
        }
        translate([- X_BELT_BLOCKER_WIDTH/2 + X_BELT_HOLE_SPACING/2, 0, 0]) {
            y_belt_bolt_nut_hole();
        }
    }
    //translate([-X_BELT_BLOCKER_WIDTH/2, X_BELT_BLOCKER_BELT_PART_HEIGHT - X_BELT_BLOCKER_TOP_THICKNESS + 1, X_BELT_WIDTH_TO_CARRIAGE/2]) rotate([0, -90, 0]) ziptie_mount();
}

module x_carriage_holder_mg_footprint()
{
    translate([MGN9C_WIDTH/2 - MGN9C_HOLE_X_OFFSET/2, MGN9C_HEIGHT/2 - MGN9C_HOLE_Y_OFFSET/2, 0]) {
          gantry_carriage_holes(M3_DIAM, Z_AXIS_THICKNESS);
          translate([0, 0, Z_AXIS_THICKNESS - Z_AXIS_M3_HEAD_THICKNESS]) gantry_carriage_holes(M3_HEAD_DIAM, Z_AXIS_M3_HEAD_THICKNESS);
    }
}

module m3_with_head(h = Z_AXIS_THICKNESS)
{
    cylinder(d = M3_DIAM, h = h);
    translate([0, 0, h - Z_AXIS_M3_HEAD_THICKNESS]) cylinder(d = M3_HEAD_DIAM, h = Z_AXIS_M3_HEAD_THICKNESS);
}

module x_ch_holes()
{
    translate([M3_DIAM/2, Z_AXIS_FB_OBLONG_HOLE_LENGTH + M3_WASHER_DIAM/2 + Z_AXIS_FB_HOLE_OFFSET_FROM_SIDE/2,  0]) {
            oblong_hole(M3_DIAM, Z_AXIS_THICKNESS, Z_AXIS_FB_OBLONG_HOLE_LENGTH);
            oblong_hole(M3_WASHER_DIAM, M3_NUT_THICKNESS + M3_WASHER_THICKNESS, Z_AXIS_FB_OBLONG_HOLE_LENGTH);
        }
    translate([M3_DIAM/2, Z_AXIS_FB_HEIGHT - M3_WASHER_DIAM/2 - Z_AXIS_FB_HOLE_OFFSET_FROM_SIDE/2,  0]) {
            oblong_hole(M3_DIAM, Z_AXIS_THICKNESS, Z_AXIS_FB_OBLONG_HOLE_LENGTH);
            oblong_hole(M3_WASHER_DIAM, M3_NUT_THICKNESS + M3_WASHER_THICKNESS, Z_AXIS_FB_OBLONG_HOLE_LENGTH);
        }
}

module z_carriage_fixed_base()
{
    difference() {
        roundedcube([Z_AXIS_FB_WIDTH, Z_AXIS_FB_HEIGHT, Z_AXIS_THICKNESS], false, 2, "z");
        /* MG carriage holes */
        translate([Z_AXIS_FB_WIDTH/2 - MGN9C_WIDTH/2, Z_AXIS_FB_BOTTOM_HEIGHT, 0]) {
            /* MG carriage footprint hole */
            //cube([MGN9C_WIDTH, MGN9C_HEIGHT, Z_AXIS_CARRIAGE_DEPTH]);
            x_carriage_holder_mg_footprint();
        }
        /* Holes for belt attachment */
        translate([Z_AXIS_FB_WIDTH/2, Z_AXIS_FB_BOTTOM_HEIGHT + MGN9C_HEIGHT/2 + GANTRY_TOP_WIDTH/2  + X_BELT_EXTRA_WIDTH_FROM_TOP + X_BELT_BLOCKER_TOP_THICKNESS/2, 0]) {
            translate([-X_BELT_HOLE_SPACING/2, 0, 0]) m3_with_head();
            translate([X_BELT_HOLE_SPACING/2, 0, 0]) m3_with_head();
        }
        /* Oblong holes for real carriage */
            translate([Z_AXIS_FB_HOLE_OFFSET_FROM_SIDE, 0, 0]) x_ch_holes();
            translate([Z_AXIS_FB_WIDTH - Z_AXIS_FB_HOLE_OFFSET_FROM_SIDE - M3_WASHER_DIAM/2, 0, 0]) x_ch_holes();
     }
     /* Guide */
     translate([Z_AXIS_FB_WIDTH/2 -Z_AXIS_GUIDE_WIDTH/2, 0, Z_AXIS_THICKNESS])  cube([Z_AXIS_GUIDE_WIDTH, Z_AXIS_FB_HEIGHT, Z_AXIS_GUIDE_THICKNESS]);
}

Y_PULLEY_IDLER_WIDTH = 20;
Y_PULLEY_IDLER_DEPTH = 20;
Y_PULLEY_IDLER_THICKNESS = 5;
Y_PULLEY_IDLER_SMALL_SIZE_WIDTH = 20;
Y_PULLEY_IDLER_SMALL_SIZE_DEPTH = 15;

Y_PULLEY_IDLER_HEIGHT = BELT_PULLEY_MOTOR_OFFSET + NEMA17_THICKNESS + BELT_PULLEY_THICKNESS + Y_PULLEY_IDLER_THICKNESS;
IDLER_PULLEY_CENTER_DIAM = 4;

module y_pulley_idler_side(w, d, h, t)
{
    difference() {
        union () {
            cube([t, w, h]);
            cube([d + t, w, t]);
               
            /* Side prism */
            translate([d + t, 0, t]) rotate([0, 0, 90]) {
                prism(t, d, h - t);
          
                translate([w - t, 0, 0]) prism(t, d, h - t);
            }
        }
        translate([d / 4 * 3, w / 2, 0]) cylinder(d = M3_DIAM, h = t);
    }
}

module y_pulley_idler()
{
    y_pulley_idler_side(Y_PULLEY_IDLER_WIDTH, Y_PULLEY_IDLER_DEPTH, Y_PULLEY_IDLER_HEIGHT, Y_PULLEY_IDLER_THICKNESS);
    difference () {
        union() {
            translate([-BELT_PULLEY_DIAM, 0, 0]) translate([0, 0, 0 ])  cube([BELT_PULLEY_DIAM, Y_PULLEY_IDLER_WIDTH, Y_PULLEY_IDLER_HEIGHT]);
            translate([-BELT_PULLEY_DIAM, Y_PULLEY_IDLER_WIDTH/2, 0]) cylinder(d = Y_PULLEY_IDLER_WIDTH, h = Y_PULLEY_IDLER_HEIGHT);
        }
            translate([-BELT_PULLEY_DIAM, Y_PULLEY_IDLER_WIDTH/2, Y_PULLEY_IDLER_HEIGHT/2]) cylinder(d = IDLER_PULLEY_CENTER_DIAM, h = Y_PULLEY_IDLER_HEIGHT);
            translate([-BELT_PULLEY_DIAM * 2, 0, BELT_PULLEY_MOTOR_OFFSET + NEMA17_THICKNESS]) cube([BELT_PULLEY_DIAM * 2, Y_PULLEY_IDLER_WIDTH, BELT_PULLEY_THICKNESS]);
    }
    
    translate([-Y_PULLEY_IDLER_SMALL_SIZE_WIDTH/2, Y_PULLEY_IDLER_THICKNESS, 0]) rotate([0, 0, -90]) y_pulley_idler_side(Y_PULLEY_IDLER_SMALL_SIZE_WIDTH, Y_PULLEY_IDLER_SMALL_SIZE_DEPTH, Y_PULLEY_IDLER_HEIGHT/2, Y_PULLEY_IDLER_THICKNESS);
    translate([Y_PULLEY_IDLER_SMALL_SIZE_WIDTH/2, Y_PULLEY_IDLER_WIDTH - Y_PULLEY_IDLER_THICKNESS, 0]) rotate([0, 0, 90]) y_pulley_idler_side( Y_PULLEY_IDLER_SMALL_SIZE_WIDTH, Y_PULLEY_IDLER_SMALL_SIZE_DEPTH, Y_PULLEY_IDLER_HEIGHT/2, Y_PULLEY_IDLER_THICKNESS);
}
 
Z_AXIS_NEMA_HOLDER_THICKNESS = 6;
Z_AXIS_MB_SIDE_WIDTH = 10;
Z_AXIS_MB_BOTTOM_HEIGHT = 15;
Z_AXIS_MB_TOP_HEIGHT = 65;
Z_AXIS_MB_HEIGHT = Z_AXIS_MB_BOTTOM_HEIGHT + Z_AXIS_MB_TOP_HEIGHT + MGN9C_HEIGHT;
Z_AXIS_MB_WIDTH = MGN9C_WIDTH + 2 * Z_AXIS_MB_SIDE_WIDTH;
Z_AXIS_MOTOR_SIDE_HEIGHT = NEMA14_THICKNESS;

/* Holes for bolts (top and bottom hole) */
Z_AXIS_MOTOR_HOLDER_TOP_HOLE_OFFSET = 2;
Z_AXIS_MOTOR_HOLDER_BOTTOM_HOLE_OFFSET = 12;


/* Negative offset of rod holder to have less height */
ROD_HOLDER_Z_OFFSET = 1;
/* Count of holes in the rail */
Z_RAIL_MGN7_HOLES_COUNT = 7;
/* Spacing between the two Z rails */
Z_RAIL_SPACING  = 32;
/* Offset from x axis */
Z_RAIL_X_OFFSET = Z_AXIS_MB_HEIGHT /2 - ((Z_RAIL_MGN7_HOLES_COUNT - 1) * MGN7_RAIL_HOLE_SPACING) / 2;

module z_axis_base_support()
{
    difference() {
        roundedcube([Z_AXIS_MB_WIDTH, Z_AXIS_MB_HEIGHT, Z_AXIS_THICKNESS], false, 2, "z");
        /* MG carriage holes */
        translate([Z_AXIS_MB_WIDTH/2 - MGN9C_WIDTH/2, Z_AXIS_MB_BOTTOM_HEIGHT, 0]) {
            /* MG carriage footprint hole */
            //cube([MGN9C_WIDTH, MGN9C_HEIGHT, Z_AXIS_CARRIAGE_DEPTH]);
            x_carriage_holder_mg_footprint();
        }
        /* Holes for belt attachment */
        translate([Z_AXIS_MB_WIDTH/2, Z_AXIS_MB_BOTTOM_HEIGHT + MGN9C_HEIGHT/2 + GANTRY_TOP_WIDTH/2  + X_BELT_EXTRA_WIDTH_FROM_TOP + X_BELT_BLOCKER_TOP_THICKNESS/2, 0]) {
            translate([-X_BELT_HOLE_SPACING/2, 0, 0]) m3_with_head();
            translate([X_BELT_HOLE_SPACING/2, 0, 0]) m3_with_head();
        }
        
        /* cutout for the belt */
        //translate([Z_AXIS_MB_WIDTH/2 - NEMA14_BELT_HOLE_DIAM/2, Z_AXIS_MB_HEIGHT - Z_AXIS_NEMA_HOLDER_THICKNESS, 0]) cube([NEMA14_BELT_HOLE_DIAM, Z_AXIS_NEMA_HOLDER_THICKNESS, Z_AXIS_THICKNESS]);
     }
}

Z_AXIS_SUPPORT_EXTRA_BOTTOM = 3;
Z_AXIS_MOTOR_HOLDER_WIDTH = NEMA14_WIDTH + Z_AXIS_SUPPORT_EXTRA_BOTTOM;

module z_nema14_support(part_width, part_height, thickness)
{
    nema_support(part_width, part_height, thickness, NEMA14_WIDTH, NEMA14_HOLE_SPACING, NEMA14_CENTER_DIAM, 0, Z_AXIS_SUPPORT_EXTRA_BOTTOM, M3_DIAM);
}

module prism_with_base(w, l, h, bw)
{
    translate([0, 0, bw]) prism(w, l, h);
    cube([w, l, bw]);
}

Z_MOTOR_HOLDER_WIDTH = NEMA14_WIDTH + 2 * Z_AXIS_NEMA_HOLDER_THICKNESS;

Z_AXIS_ROD_OFFSET_FROM_BASE = 6;
Z_AXIS_ROD_DIAM= 6.2;
686ZZ_OUTER_DIAMETER = 13;
686ZZ_THICKNESS = 5;
Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS = 4;
Z_AXIS_ROD_HOLDER_EXTRA_DIAM = 2;
Z_AXIS_ROD_HOLDER_THICKNESS = 686ZZ_THICKNESS + Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS;
Z_AXIS_ROD_HOLDER_DIAM= 686ZZ_OUTER_DIAMETER + 2 * Z_AXIS_ROD_HOLDER_EXTRA_DIAM;

Z_AXIS_BOLT_HOLES_LENGTH = 20;

Z_MOTOR_HOLDER_ES_WIDTH  = 3;
Z_MOTOR_HOLDER_ES_HEIGHT = MICROSWITCH_HEIGHT;
Z_MOTOR_HOLDER_ES_HEIGHT_Z_OFFSET = 26;
Z_MOTOR_CABLE_HOLDER_WIDTH = 10;

module z_motor_holder()
{
    translate ([0, Z_AXIS_SUPPORT_EXTRA_BOTTOM, 0]) z_nema14_support(NEMA14_WIDTH, NEMA14_WIDTH, Z_AXIS_NEMA_HOLDER_THICKNESS);
    translate([-Z_AXIS_NEMA_HOLDER_THICKNESS, 0, 0]) prism_with_base(Z_AXIS_NEMA_HOLDER_THICKNESS, Z_AXIS_MOTOR_HOLDER_WIDTH, Z_AXIS_MOTOR_SIDE_HEIGHT, Z_AXIS_NEMA_HOLDER_THICKNESS);
    translate([NEMA14_WIDTH, 0, 0]) prism_with_base(Z_AXIS_NEMA_HOLDER_THICKNESS, Z_AXIS_MOTOR_HOLDER_WIDTH, Z_AXIS_MOTOR_SIDE_HEIGHT, Z_AXIS_NEMA_HOLDER_THICKNESS);
    /* Endstop support */
    translate([NEMA14_WIDTH + Z_AXIS_NEMA_HOLDER_THICKNESS, NEMA14_WIDTH + Z_AXIS_SUPPORT_EXTRA_BOTTOM - Z_MOTOR_HOLDER_ES_HEIGHT, 0]) difference() {
            cube([Z_MOTOR_HOLDER_ES_WIDTH, Z_MOTOR_HOLDER_ES_HEIGHT, Z_MOTOR_HOLDER_ES_HEIGHT_Z_OFFSET]);
            /* microswitch holes */
            translate([0, Z_MOTOR_HOLDER_ES_HEIGHT - MICROSWITCH_HOLE_OFFSET, Z_MOTOR_HOLDER_ES_HEIGHT_Z_OFFSET - MICROSWITCH_WIDTH/2 ]) rotate([0, 90, 0])  {
                #translate([-MICROSWITCH_HOLE_SPACING/2, 0, 0]) cylinder(d = MICROSWITCH_HOLE_DIAM, h = Z_MOTOR_HOLDER_ES_WIDTH);
                #translate([MICROSWITCH_HOLE_SPACING/2, 0, 0]) cylinder(d = MICROSWITCH_HOLE_DIAM, h = Z_MOTOR_HOLDER_ES_WIDTH);
            }
    }
    /* Support + Hole for cable */
    ROUND = 1;
    translate([NEMA14_WIDTH + Z_AXIS_NEMA_HOLDER_THICKNESS, 0, 0]) difference() {
        translate([-ROUND, 0, 0]) roundedcube([Z_MOTOR_CABLE_HOLDER_WIDTH + ROUND, NEMA14_WIDTH + Z_AXIS_SUPPORT_EXTRA_BOTTOM , Z_AXIS_NEMA_HOLDER_THICKNESS], false, ROUND, "z");
        translate([Z_MOTOR_CABLE_HOLDER_WIDTH/2, NEMA14_WIDTH/2, 0]) scale([0.8, 1.2, 1])cylinder (d = Z_MOTOR_CABLE_HOLDER_WIDTH - ROUND, h  = Z_AXIS_NEMA_HOLDER_THICKNESS);
    }
}

module z_axis_bearing_holes(thickness = 686ZZ_THICKNESS)
{
    translate([Z_AXIS_ROD_HOLDER_DIAM/2, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_DIAM/2]) rotate([90, 0, 0]) cylinder(d = 686ZZ_OUTER_DIAMETER, h = thickness);
}

module z_axis_rod_holder()
{
    difference() {
            union() {
                cube([Z_AXIS_ROD_HOLDER_DIAM, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_DIAM/2]);
                translate([Z_AXIS_ROD_HOLDER_DIAM/2, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_DIAM/2]) rotate([90, 0, 0]) cylinder(d = Z_AXIS_ROD_HOLDER_DIAM, h = Z_AXIS_ROD_HOLDER_THICKNESS);
            }
            translate([Z_AXIS_ROD_HOLDER_DIAM/2, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_DIAM/2]) rotate([90, 0, 0]) cylinder(d = Z_AXIS_ROD_DIAM, h = Z_AXIS_ROD_HOLDER_THICKNESS);
            translate([0, 0, Z_AXIS_ROD_HOLDER_DIAM - Z_AXIS_ROD_HOLDER_EXTRA_DIAM / 2 ]) cube([Z_AXIS_ROD_HOLDER_DIAM, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_EXTRA_DIAM]);
    }
}

module z_axis_motor_holder_holes(x_offset)
{
    /* Top hole */
    translate([x_offset, Z_AXIS_MB_HEIGHT - Z_AXIS_NEMA_HOLDER_THICKNESS - Z_AXIS_MOTOR_HOLDER_TOP_HOLE_OFFSET, Z_AXIS_THICKNESS - Z_AXIS_BOLT_HOLES_LENGTH]) {
        m3_with_head(h = Z_AXIS_BOLT_HOLES_LENGTH);
        translate([0, 0, 8]) cube([X_BELT_BLOCKER_TOP_THICKNESS, M3_NUT_SIDE_TO_SIDE_THICKNESS, M3_NUT_THICKNESS], center = true);
    }

    /* Bottom hole */
    translate([x_offset, Z_AXIS_MB_HEIGHT - Z_AXIS_NEMA_HOLDER_THICKNESS - Z_AXIS_MOTOR_SIDE_HEIGHT + Z_AXIS_MOTOR_HOLDER_BOTTOM_HOLE_OFFSET, Z_AXIS_THICKNESS - Z_AXIS_BOLT_HOLES_LENGTH]) {
        m3_with_head(h = Z_AXIS_BOLT_HOLES_LENGTH);
    
        translate([0, 0, 8]) cube([X_BELT_BLOCKER_TOP_THICKNESS, M3_NUT_SIDE_TO_SIDE_THICKNESS, M3_NUT_THICKNESS], center = true);
    }
}

module z_rail_hole()
{
          for (hole = [0:Z_RAIL_MGN7_HOLES_COUNT-1]) {
                translate([Z_AXIS_MB_WIDTH/2, Z_RAIL_X_OFFSET + MGN7_RAIL_HOLE_SPACING * hole, 0]) cylinder(d = MGN7_HOLE_DIAMETER, h = 100);
                translate([Z_AXIS_MB_WIDTH/2, Z_RAIL_X_OFFSET + MGN7_RAIL_HOLE_SPACING * hole, 0]) cylinder(d = M2_NUT_DIAM, h = M2_NUT_THICKNESS, $fn = 6);
            }
}

module z_rail_holes()
{
            translate([Z_RAIL_SPACING/2, 0, 0]) z_rail_hole();
            translate([-Z_RAIL_SPACING/2, 0, 0]) z_rail_hole();
}


/* Bottom rod holder y offset */
BOTTOM_ROD_HOLDER_Y_OFFSET = 4;

module z_carriage_moving_base(motor_holder_only = false)
{
    difference() {
        union () {
            if (motor_holder_only == true) {
            translate([Z_AXIS_MB_WIDTH/2 - NEMA14_WIDTH/2, Z_AXIS_MB_HEIGHT, -NEMA14_WIDTH - Z_AXIS_SUPPORT_EXTRA_BOTTOM]) rotate([90, 0, 0]) z_motor_holder();
            }
            if (motor_holder_only == false) {
                 z_axis_base_support();
                translate([Z_AXIS_MB_WIDTH/2 - Z_AXIS_ROD_HOLDER_DIAM/2, 0, Z_AXIS_THICKNESS - Z_AXIS_ROD_HOLDER_EXTRA_DIAM - ROD_HOLDER_Z_OFFSET]) {
                    translate([0, Z_AXIS_ROD_HOLDER_THICKNESS + BOTTOM_ROD_HOLDER_Y_OFFSET, 0]) mirror([0, 180, 0])  #z_axis_rod_holder();
                    translate([0, Z_AXIS_MB_HEIGHT - Z_AXIS_ROD_HOLDER_THICKNESS, 0]) z_axis_rod_holder();
                }
            }
        }
         translate([Z_AXIS_MB_WIDTH/2 - Z_AXIS_ROD_HOLDER_DIAM/2, 0, Z_AXIS_THICKNESS - Z_AXIS_ROD_HOLDER_EXTRA_DIAM - ROD_HOLDER_Z_OFFSET]) {
                translate([0, Z_AXIS_ROD_HOLDER_THICKNESS - ROD_HOLDER_Z_OFFSET, 0]) mirror([0, 180, 0])  z_axis_bearing_holes(10);
                translate([0, Z_AXIS_MB_HEIGHT - Z_AXIS_ROD_HOLDER_THICKNESS, 0]) z_axis_bearing_holes();
            }
            z_axis_motor_holder_holes(x_offset = Z_AXIS_MB_WIDTH / 2 - NEMA14_WIDTH/2 - Z_AXIS_NEMA_HOLDER_THICKNESS/2);
            z_axis_motor_holder_holes(x_offset = Z_AXIS_MB_WIDTH / 2 + NEMA14_WIDTH/2 + Z_AXIS_NEMA_HOLDER_THICKNESS/2);

        z_rail_holes();
    }
}

module z_carriage_motor_holder()
{
    z_carriage_moving_base(true);
}

/* Z tools support width */
ZTS_WIDTH = Z_AXIS_MB_WIDTH;
/* Z tools support height*/
ZTS_HEIGHT = 80;
/* Z tools support thickness */
ZTS_THICKNESS = 4;
/* Y offset from bottom of support */
ZTS_HOLE_Y_OFFSET = 25;

/* Offset from MGN7H carriage */
ZTS_MGN7H_OFFSET = 6;

module m2_screw(height = ZTS_THICKNESS + ZTS_MGN7H_OFFSET) {
    cylinder(d = M2_HEAD_DIAM, h = M2_HEAD_THICKNESS);
    cylinder(d = M2_DIAM, h = height);
}

module mgn7_holes(height = ZTS_THICKNESS) {
    translate([MGN7H_HOLE_X_OFFSET/2, - MGN7H_HOLE_Y_OFFSET/2, 0]) m2_screw();
    translate([MGN7H_HOLE_X_OFFSET/2, MGN7H_HOLE_Y_OFFSET/2, 0]) m2_screw();
    translate([-MGN7H_HOLE_X_OFFSET/2, - MGN7H_HOLE_Y_OFFSET/2, 0]) m2_screw();
    translate([-MGN7H_HOLE_X_OFFSET/2, MGN7H_HOLE_Y_OFFSET/2, 0]) m2_screw();
}

ZTS_Z_NUT_HOLDER_THICKNESS = 2;

/* Nut holder depth (should be based on threaded rod)*/
ZTS_Z_NUT_HOLDER_DEPTH = 12;

/* Width and height of the nut holder for threaded rod */
ZTS_Z_NUT_HOLDER_WIDTH = Z_RAIL_SPACING - MGN7H_WIDTH;
ZTS_Z_NUT_HOLDER_HEIGHT = M6_NUT_THICKNESS + 2 * ZTS_Z_NUT_HOLDER_THICKNESS;

/* Sliding rail offset from both side */
ZTS_RAIL_OFFSET_FROM_SIDE = 12;

ZTS_SLIDE_RAIL_HEIGHT = 2;
ZTS_SLIDE_RAIL_WIDTH_BOTTOM = 4;
ZTS_SLIDE_RAIL_WIDTH_TOP = 5;
//
module z_nut_holder()
{
    difference() {
        roundedcube([ZTS_Z_NUT_HOLDER_WIDTH, ZTS_Z_NUT_HOLDER_HEIGHT,  ZTS_Z_NUT_HOLDER_DEPTH], true, 0.7, "zmax");
         cube([M6_NUT_SIDE_TO_SIDE_WIDTH, M6_NUT_THICKNESS, ZTS_Z_NUT_HOLDER_DEPTH], center = true);
         cube([6, ZTS_Z_NUT_HOLDER_HEIGHT, ZTS_Z_NUT_HOLDER_DEPTH], center = true);
    }
}

/* Holes for tool attachment */
ZTS_HOLES_ATTACHMENT_COUNT = 3;
ZTS_HOLES_OFFSET_FROM_SIDE = 8;
ZTS_HOLES_SPACING = (ZTS_WIDTH - ZTS_HOLES_OFFSET_FROM_SIDE * 2) / (ZTS_HOLES_ATTACHMENT_COUNT - 1);
ZTS_HOLES_BOTTOM_OFFSET = 5;
ZTS_HOLES_MIDDLE_OFFSET = ZTS_HEIGHT - 35;
ZTS_HOLES_TOP_OFFSET = ZTS_HEIGHT - 5;

module zts_m3_hole_with_nut(nut = true, h = ZTS_THICKNESS)
{
    cylinder(d = M3_DIAM, h = h);
    if (nut == true) {
        translate([0, 0, h - M3_NUT_THICKNESS]) cylinder(d = M3_NUT_DIAM, h = M3_NUT_THICKNESS, $fn = 6);
    }
}

module zts_attachment_hole(nut = true, y_offset = 0, h = ZTS_THICKNESS)
{
        for (hole = [0:ZTS_HOLES_ATTACHMENT_COUNT-1]) {
            translate([ZTS_HOLES_OFFSET_FROM_SIDE + hole * ZTS_HOLES_SPACING, y_offset, 0]) zts_m3_hole_with_nut(nut, h);
        }
}

module zts_attachment_holes(nut = true)
{
    zts_attachment_hole(nut, y_offset =ZTS_HOLES_BOTTOM_OFFSET);
    zts_attachment_hole(nut, y_offset =ZTS_HOLES_MIDDLE_OFFSET);
    zts_attachment_hole(nut, y_offset =ZTS_HOLES_TOP_OFFSET);
}


/* Thickness of prism that will trigger the Z endstop */
ZTS_ES_TRIGGER_THICKNESS = ZTS_THICKNESS + ZTS_MGN7H_OFFSET;

ZTS_ES_TRIGGER_HEIGHT = 6;
ZTS_SCREW_SIDE_OFFSET = 5;

ZTS_ES_TRIGGER_HOLE_DIAM = M3_DIAM;

/* Enstop trigger for Z will contain a hole to add a screw to set the 
 * triggering limit */
module zts_side_endstop() {
    difference() {
        union() {
            cylinder(d = ZTS_ES_TRIGGER_HEIGHT, h = ZTS_ES_TRIGGER_THICKNESS);
            translate([0, -ZTS_ES_TRIGGER_HEIGHT/2, 0]) cube([ZTS_SCREW_SIDE_OFFSET + ZTS_WIDTH/2 - Z_RAIL_SPACING/2 - MGN7H_WIDTH/2, ZTS_ES_TRIGGER_HEIGHT, ZTS_ES_TRIGGER_THICKNESS]);
        }
        cylinder(d = M3_DIAM, h = ZTS_ES_TRIGGER_THICKNESS);
    }
}

module z_carriage_tool_support()
{
    difference() {
        union() {
           roundedcube([ZTS_WIDTH, ZTS_HEIGHT, ZTS_THICKNESS], false, 2, "z");
            translate([ZTS_WIDTH/2 - Z_RAIL_SPACING/2, ZTS_HOLE_Y_OFFSET, ZTS_THICKNESS + ZTS_MGN7H_OFFSET/2]) cube([MGN7H_WIDTH, MGN7H_HEIGHT, ZTS_MGN7H_OFFSET], center = true);
            translate([ZTS_WIDTH/2 + Z_RAIL_SPACING/2, ZTS_HOLE_Y_OFFSET, ZTS_THICKNESS + ZTS_MGN7H_OFFSET/2]) cube([MGN7H_WIDTH, MGN7H_HEIGHT, ZTS_MGN7H_OFFSET], center = true);
        }
        /* Holes fro mgn7h carriage */
        translate([ZTS_WIDTH/2 + Z_RAIL_SPACING/2, ZTS_HOLE_Y_OFFSET, 0]) mgn7_holes();
        translate([ZTS_WIDTH/2 - Z_RAIL_SPACING/2, ZTS_HOLE_Y_OFFSET, 0]) mgn7_holes();
        /* Sliding rails */
        /* Bottom rail */
        translate([0, ZTS_RAIL_OFFSET_FROM_SIDE, 0]) rotate([90, 0, 90]) #sliding_rails(ZTS_SLIDE_RAIL_WIDTH_BOTTOM, ZTS_SLIDE_RAIL_WIDTH_TOP, ZTS_SLIDE_RAIL_HEIGHT, ZTS_WIDTH);
        translate([0, ZTS_HEIGHT - ZTS_RAIL_OFFSET_FROM_SIDE, 0]) rotate([90, 0, 90]) #sliding_rails(ZTS_SLIDE_RAIL_WIDTH_BOTTOM, ZTS_SLIDE_RAIL_WIDTH_TOP, ZTS_SLIDE_RAIL_HEIGHT, ZTS_WIDTH);
        zts_attachment_holes();
    }
    translate([ZTS_WIDTH/2 , ZTS_HOLE_Y_OFFSET, ZTS_THICKNESS + ZTS_Z_NUT_HOLDER_HEIGHT/2]) z_nut_holder();

    /* Side endstop trigger */
    translate([- ZTS_SCREW_SIDE_OFFSET, ZTS_HOLE_Y_OFFSET, 0]) zts_side_endstop();
}

LASER_MODULE_X_SPACING = 20;
LASER_MODULE_Y_SPACING = 40;
LASER_MODULE_Y_OFFSET = 5;

LASER_SUPPORT_THICKNESS = 4;
LASER_SUPPORT_WIDTH = ZTS_WIDTH;
LASER_SUPPORT_HEIGHT = ZTS_HEIGHT;
    
module laser_holes() 
{
    translate([0, 0, LASER_SUPPORT_THICKNESS]) mirror([0, 0, 1]) {
        translate([LASER_MODULE_X_SPACING/2, LASER_MODULE_Y_SPACING/2, 0]) m3_with_head(h = LASER_SUPPORT_THICKNESS);
        translate([LASER_MODULE_X_SPACING/2, -LASER_MODULE_Y_SPACING/2, 0]) m3_with_head(h = LASER_SUPPORT_THICKNESS);
        translate([-LASER_MODULE_X_SPACING/2, -LASER_MODULE_Y_SPACING/2, 0]) m3_with_head(h = LASER_SUPPORT_THICKNESS);
        translate([-LASER_MODULE_X_SPACING/2, LASER_MODULE_Y_SPACING/2, 0]) m3_with_head(h = LASER_SUPPORT_THICKNESS);
    }
}

module laser_tool_support()
{
    difference() {
       roundedcube([LASER_SUPPORT_WIDTH, LASER_SUPPORT_HEIGHT, LASER_SUPPORT_THICKNESS], false, 2, "z");
        zts_attachment_hole(nut = false, y_offset =ZTS_HOLES_TOP_OFFSET, h  = LASER_SUPPORT_THICKNESS);
        translate([LASER_SUPPORT_WIDTH /2, LASER_MODULE_Y_SPACING/2  + LASER_MODULE_Y_OFFSET, 0]) #laser_holes();
    }
    
    translate([0, ZTS_RAIL_OFFSET_FROM_SIDE, 0]) rotate([90, 180, 90]) sliding_rails(ZTS_SLIDE_RAIL_WIDTH_BOTTOM, ZTS_SLIDE_RAIL_WIDTH_TOP, ZTS_SLIDE_RAIL_HEIGHT, ZTS_WIDTH);
    translate([0, ZTS_HEIGHT - ZTS_RAIL_OFFSET_FROM_SIDE, 0]) rotate([90, 180, 90]) sliding_rails(ZTS_SLIDE_RAIL_WIDTH_BOTTOM, ZTS_SLIDE_RAIL_WIDTH_TOP, ZTS_SLIDE_RAIL_HEIGHT, ZTS_WIDTH);
}

module cable_holder(diam,  thickness, border_thickness, bottom_thickness)
{
    cable_holder_height = diam + 2 * border_thickness;

    translate([0, - (bottom_thickness + diam/2), 0])
    difference() {
        union() {
            cube([cable_holder_height, bottom_thickness + diam/2 , thickness]);
            translate([cable_holder_height /2, 0, 0]) cylinder(d = cable_holder_height , h = thickness);
        }
        translate([cable_holder_height /2, 0, 0]) cylinder(d = diam , h = thickness);
        translate([cable_holder_height /2, 0, thickness/2 - ZIPTIE_WIDTH/2]) difference() {
             cylinder(d = diam +  2 * border_thickness - 1 , h = ZIPTIE_WIDTH);
             cylinder(d = diam + 1.5 , h = ZIPTIE_WIDTH);
            
        }
        translate([0, -(diam/2 + border_thickness), 0]) cube([cable_holder_height, diam/2 + border_thickness, thickness]);
    }  
}


PTS_PEN_DIAM = 9;
PTS_PEN_HOLDER_THICKNESS = 8;
PTS_PEN_HOLDER_BORDER_THICKNESS = 3;
PTS_PEN_HOLDER_BOTTOM_THICKNESS = 3;
PTS_PEN_HOLDER_WIDTH = 2 * PTS_PEN_HOLDER_BORDER_THICKNESS + PTS_PEN_DIAM;
PTS_WIDTH = PTS_PEN_HOLDER_WIDTH;
PTS_HEIGHT = ZTS_HEIGHT;
PTS_THICKNESS = ZTS_THICKNESS;

PEN_SPRING_HOLDER_HEIGHT = 30;

module pen_tool_support()
{
    
    difference() {
       roundedcube([PTS_WIDTH, PTS_HEIGHT + PEN_SPRING_HOLDER_HEIGHT, LASER_SUPPORT_THICKNESS], false, 2, "z");
        translate([PTS_PEN_HOLDER_WIDTH/2 , ZTS_HOLES_TOP_OFFSET, 0 ]) cylinder(d = M3_DIAM, h = LASER_SUPPORT_THICKNESS);
        translate([PTS_PEN_HOLDER_WIDTH/2 , ZTS_HOLES_BOTTOM_OFFSET, 0 ]) cylinder(d = M3_DIAM, h = LASER_SUPPORT_THICKNESS);
    }

    /* Pen holder with ziptie */
    translate([0, ZTS_RAIL_OFFSET_FROM_SIDE - PTS_PEN_HOLDER_THICKNESS/2 , PTS_THICKNESS]) rotate([ -90, 0, 0]) cable_holder(PTS_PEN_DIAM, PTS_PEN_HOLDER_THICKNESS, PTS_PEN_HOLDER_BORDER_THICKNESS, PTS_PEN_HOLDER_BOTTOM_THICKNESS);

    translate([0, ZTS_HEIGHT - ZTS_RAIL_OFFSET_FROM_SIDE - PTS_PEN_HOLDER_THICKNESS/2, PTS_THICKNESS]) rotate([ -90, 0, 0]) cable_holder(PTS_PEN_DIAM, PTS_PEN_HOLDER_THICKNESS, PTS_PEN_HOLDER_BORDER_THICKNESS, PTS_PEN_HOLDER_BOTTOM_THICKNESS);

    /* Rails */
    translate([0, ZTS_RAIL_OFFSET_FROM_SIDE, 0]) rotate([90, 180, 90]) sliding_rails(ZTS_SLIDE_RAIL_WIDTH_BOTTOM, ZTS_SLIDE_RAIL_WIDTH_TOP, ZTS_SLIDE_RAIL_HEIGHT, PTS_PEN_HOLDER_WIDTH);
    translate([0, ZTS_HEIGHT - ZTS_RAIL_OFFSET_FROM_SIDE, 0]) rotate([90, 180, 90]) sliding_rails(ZTS_SLIDE_RAIL_WIDTH_BOTTOM, ZTS_SLIDE_RAIL_WIDTH_TOP, ZTS_SLIDE_RAIL_HEIGHT, PTS_PEN_HOLDER_WIDTH);
    
    /* pen spring holder */
    translate([0, PTS_HEIGHT, 0]) 
    difference() {
    roundedcube([PTS_PEN_HOLDER_WIDTH, PEN_SPRING_HOLDER_HEIGHT, LASER_SUPPORT_THICKNESS + PTS_PEN_HOLDER_WIDTH], false, 2, "ymax");
        translate([PTS_PEN_HOLDER_WIDTH/2, 0, LASER_SUPPORT_THICKNESS + PTS_PEN_HOLDER_BOTTOM_THICKNESS + PTS_PEN_DIAM/2]) rotate([-90, 0, 0]) #cylinder(d = PTS_PEN_DIAM, h = PEN_SPRING_HOLDER_HEIGHT - 5);
    }
}

FD_SUPPORT_WIDTH = ZTS_WIDTH;
FD_SUPPORT_HEIGHT = 110;
FD_SUPPORT_THICKNESS = 4;
FD_HOLE_SPACING = 20;
FD_HOLE_TOP_MARGIN = 10;
FD_HOLE_BOTTOM_MARGIN = 10;

FD_BASE_OFFSET = 15;

module fd_holes()
{
    translate([0, 0, LASER_SUPPORT_THICKNESS]) mirror([0, 0, 1]) {
        translate([FD_HOLE_SPACING/2, 0, 0]) m3_with_head(h = LASER_SUPPORT_THICKNESS);
        translate([-FD_HOLE_SPACING/2, 0, 0]) m3_with_head(h = LASER_SUPPORT_THICKNESS);
    }
}

module flex_dremel_support()
{
    difference() {
       roundedcube([FD_SUPPORT_WIDTH, FD_SUPPORT_HEIGHT, FD_SUPPORT_THICKNESS], false, 2, "z");
        translate([0, FD_BASE_OFFSET, 0]) zts_attachment_holes(nut = false);
        translate([FD_SUPPORT_WIDTH /2, FD_HOLE_BOTTOM_MARGIN, 0]) fd_holes();
        translate([FD_SUPPORT_WIDTH/2, FD_SUPPORT_HEIGHT - FD_HOLE_TOP_MARGIN, 0]) fd_holes();
    }
    translate([0, FD_BASE_OFFSET, 0]) {
        translate([0, ZTS_RAIL_OFFSET_FROM_SIDE, 0]) rotate([90, 180, 90]) sliding_rails(ZTS_SLIDE_RAIL_WIDTH_BOTTOM, ZTS_SLIDE_RAIL_WIDTH_TOP, ZTS_SLIDE_RAIL_HEIGHT, ZTS_WIDTH);
        translate([0, ZTS_HEIGHT - ZTS_RAIL_OFFSET_FROM_SIDE, 0]) rotate([90, 180, 90]) sliding_rails(ZTS_SLIDE_RAIL_WIDTH_BOTTOM, ZTS_SLIDE_RAIL_WIDTH_TOP, ZTS_SLIDE_RAIL_HEIGHT, ZTS_WIDTH);
    }
}

/* Flex dremel holder */
FLEX_DREMEL_TOP_MIN_DIAM = 19;
FLEX_DREMEL_TOP_MAX_DIAM = 22;

FD_MOUNT_BLOCK_SIDE_THICKNESS = 8;
FD_MOUNT_BLOCK_WIDTH = FLEX_DREMEL_TOP_MAX_DIAM + FD_MOUNT_BLOCK_SIDE_THICKNESS * 2;
FD_MOUNT_BLOCK_EXTRA_THICKNESS = 2;
FD_MOUNT_BLOCK_HEIGHT = FLEX_DREMEL_TOP_MAX_DIAM/2 + FD_MOUNT_BLOCK_EXTRA_THICKNESS;
FD_MOUNT_BLOCK_THICKNESS = 12;
FD_MOUNT_BLOCK_HOLE_OFFSET_FROM_SIDE = 4;

module m3_with_nut(spacing, nut_offset, length = FD_MOUNT_BLOCK_HEIGHT/2)
{
    EXTRA_M3_NUT_DIAM = (FD_MOUNT_BLOCK_WIDTH - spacing) / 2;
    NUT_X_OFFSET = (M3_NUT_DIAM + EXTRA_M3_NUT_DIAM)/2;
    translate([ -spacing/2, 0, 0]) {
        cylinder(d = M3_DIAM, h = length);
        translate ([-NUT_X_OFFSET + M3_NUT_DIAM/2, 0, nut_offset]) cube([M3_NUT_DIAM + EXTRA_M3_NUT_DIAM, M3_NUT_DIAM, M3_NUT_THICKNESS], center = true); 
    }
    translate([ spacing/2, 0, 0]) {
        cylinder(d = M3_DIAM, h = length);
        translate ([NUT_X_OFFSET - M3_NUT_DIAM/2, 0, nut_offset]) cube([M3_NUT_DIAM + EXTRA_M3_NUT_DIAM, M3_NUT_DIAM, M3_NUT_THICKNESS], center = true); 
    }   
}

module flex_dremel_mount_block_lower()
{
    difference() {
        cube([FD_MOUNT_BLOCK_WIDTH, FD_MOUNT_BLOCK_THICKNESS, FD_MOUNT_BLOCK_HEIGHT]);
        translate([FD_MOUNT_BLOCK_WIDTH/2, FD_MOUNT_BLOCK_THICKNESS, FD_MOUNT_BLOCK_HEIGHT]) rotate([90, 0, 0]) cylinder(d1 = FLEX_DREMEL_TOP_MAX_DIAM, d2 = FLEX_DREMEL_TOP_MIN_DIAM, h = FD_MOUNT_BLOCK_THICKNESS);
        
        /* Bottom holes to attach the block on the mount */
        translate([FD_MOUNT_BLOCK_WIDTH/2, FD_MOUNT_BLOCK_THICKNESS/2, 0]) {
            m3_with_nut(FD_HOLE_SPACING, FD_MOUNT_BLOCK_EXTRA_THICKNESS + M3_NUT_THICKNESS/2);
        }

        /* Top holes to attach the block on the mount */
        translate([FD_MOUNT_BLOCK_WIDTH/2, FD_MOUNT_BLOCK_THICKNESS/2, FD_MOUNT_BLOCK_HEIGHT - FD_MOUNT_BLOCK_HEIGHT/2 - 1]) {
            m3_with_nut(FD_MOUNT_BLOCK_WIDTH - FD_MOUNT_BLOCK_HOLE_OFFSET_FROM_SIDE*2, FD_MOUNT_BLOCK_EXTRA_THICKNESS + M3_NUT_THICKNESS/2, 10);
        }
    }
}

module m3_spaced_holes(spacing)
{
    translate([ -spacing/2, 0, 0]) {
        cylinder(d = M3_DIAM, h = FD_MOUNT_BLOCK_HEIGHT);
        cylinder(d = M3_HEAD_DIAM, h = M3_HEAD_THICKNESS);
    }
    translate([ spacing/2, 0, 0]) {
        cylinder(d = M3_DIAM, h = FD_MOUNT_BLOCK_HEIGHT);
        cylinder(d = M3_HEAD_DIAM, h = M3_HEAD_THICKNESS);
    }   
}

module flex_dremel_mount_block_upper()
{
    difference() {
        cube([FD_MOUNT_BLOCK_WIDTH, FD_MOUNT_BLOCK_THICKNESS, FD_MOUNT_BLOCK_HEIGHT]);
        translate([FD_MOUNT_BLOCK_WIDTH/2, FD_MOUNT_BLOCK_THICKNESS, FD_MOUNT_BLOCK_HEIGHT]) rotate([90, 0, 0]) cylinder(d1 = FLEX_DREMEL_TOP_MAX_DIAM, d2 = FLEX_DREMEL_TOP_MIN_DIAM, h = FD_MOUNT_BLOCK_THICKNESS);
        
        /* Bottom holes to attach the block on the mount */
        translate([FD_MOUNT_BLOCK_WIDTH/2, FD_MOUNT_BLOCK_THICKNESS/2, 0]) {
            m3_spaced_holes(FD_MOUNT_BLOCK_WIDTH - FD_MOUNT_BLOCK_HOLE_OFFSET_FROM_SIDE*2);
        }
    }
}


module flex_dremel_mount_blocks()
{
    flex_dremel_mount_block_lower();
    translate([0, 20, 0]) flex_dremel_mount_block_upper(); 
}

FD_MOUNT_BOTTOM_RADIUS = 4;
FLEX_DREMEL_BOTTOM_MIN_DIAM = 17;
FLEX_DREMEL_BOTTOM_MAX_DIAM = 21;

module flex_dremel_mount_bottom_block()
{
        difference() {
            union () {
                cube([FLEX_DREMEL_BOTTOM_MAX_DIAM + FD_MOUNT_BLOCK_SIDE_THICKNESS * 2, FD_MOUNT_BLOCK_THICKNESS, FLEX_DREMEL_BOTTOM_MAX_DIAM ]);
                roundedcube([FD_MOUNT_BLOCK_WIDTH, FD_MOUNT_BLOCK_THICKNESS, FLEX_DREMEL_BOTTOM_MAX_DIAM + FD_MOUNT_BOTTOM_RADIUS], false, FD_MOUNT_BOTTOM_RADIUS, "y" );
            }
        translate([FD_MOUNT_BLOCK_WIDTH/2, FD_MOUNT_BLOCK_THICKNESS, FD_MOUNT_BLOCK_HEIGHT]) rotate([90, 0, 0]) cylinder(d1 = FLEX_DREMEL_BOTTOM_MAX_DIAM, d2 = FLEX_DREMEL_BOTTOM_MIN_DIAM, h = FD_MOUNT_BLOCK_THICKNESS);
        
        /* Bottom holes to attach the block on the mount */
        translate([FD_MOUNT_BLOCK_WIDTH/2, FD_MOUNT_BLOCK_THICKNESS/2, 0]) {
            m3_with_nut(FD_HOLE_SPACING, FD_MOUNT_BLOCK_EXTRA_THICKNESS + M3_NUT_THICKNESS/2);
        }
    }
}

X_PULLEY_IDLER_BEARING_THICKNESS = 13;
X_PULLEY_IDLER_OUTER_THICKNESS = 3;
X_PULLEY_IDLER_INNER_THICKNESS = 2;
X_PULLEY_IDLER_TOP_THICKNESS = 6;
X_PULLEY_IDLER_OVERHANG = 7;
X_PULLEY_HEIGHT = GANTRY_TOP_WIDTH + X_PULLEY_IDLER_TOP_THICKNESS;
X_PULLEY_CAGE_DIAM = BELT_PULLEY_DIAM;

/* Sliding rail */
XPI_SLIDE_RAIL_WIDTH_TOP = 6;
XPI_SLIDE_RAIL_WIDTH_BOTTOM = 5;
XPI_SLIDE_RAIL_HEIGHT = 3;

XPI_FULL_HEIGHT = X_PULLEY_IDLER_BEARING_THICKNESS + X_PULLEY_IDLER_OUTER_THICKNESS + GANTRY_WIDTH;

module x_pulley_idler_gantry_link()
{
    /* Upper part connection */
    translate([X_PULLEY_IDLER_OVERHANG, 0, 0]) {
        difference() {
            cube([GANTRY_THICKNESS, X_PULLEY_IDLER_TOP_THICKNESS, XPI_FULL_HEIGHT]);
            translate([GANTRY_THICKNESS/2, X_PULLEY_IDLER_TOP_THICKNESS,  X_PULLEY_IDLER_BEARING_THICKNESS + X_PULLEY_IDLER_OUTER_THICKNESS])  {
                translate([0, 0, GANTRY_WIDTH/4]) rotate([90, 0, 0]) m3_with_head(X_PULLEY_IDLER_TOP_THICKNESS);
                translate([0, 0, GANTRY_WIDTH/4 * 3]) rotate([90, 0, 0]) m3_with_head(X_PULLEY_IDLER_TOP_THICKNESS);
            }
        }
    }
    /* Lower part connection */
    translate([X_PULLEY_IDLER_OVERHANG, X_PULLEY_HEIGHT - GANTRY_NEMA17_HOLE_Z_OFFSET, X_PULLEY_IDLER_BEARING_THICKNESS + X_PULLEY_IDLER_OUTER_THICKNESS - X_PULLEY_IDLER_TOP_THICKNESS]) difference() {
        union() {
            cube([GANTRY_THICKNESS + NEMA17_ATTACHMENT_LENGTH, GANTRY_NEMA17_HOLE_Z_OFFSET, X_PULLEY_IDLER_TOP_THICKNESS]);
            translate([GANTRY_THICKNESS + NEMA17_ATTACHMENT_LENGTH, GANTRY_NEMA17_HOLE_Z_OFFSET/2, 0]) cylinder(d = GANTRY_NEMA17_HOLE_Z_OFFSET, h = X_PULLEY_IDLER_TOP_THICKNESS);
        }
        translate([GANTRY_THICKNESS + NEMA17_ATTACHMENT_LENGTH, GANTRY_NEMA17_HOLE_Z_OFFSET/2, X_PULLEY_IDLER_TOP_THICKNESS]) mirror([0, 0, 1])m3_with_head(X_PULLEY_IDLER_TOP_THICKNESS);
    }
}

XPI_CABLE_HOLDER_THICKNESS = 5;
/* Hole diameter for cables */
XPI_HOLE_DIAM = 8;
XPI_CABLE_HOLDER_BORDER_THICKNESS = 3;
XPI_CABLE_HOLDER_BOTTOM_THICKNESS = 4;
XPI_CABLE_HOLDER_HEIGHT = 2 * XPI_CABLE_HOLDER_BORDER_THICKNESS + XPI_HOLE_DIAM; 

module xpi_cable_holder()
{
    scale([1, 0.9, 1])
    cable_holder(diam = XPI_HOLE_DIAM, thickness = XPI_CABLE_HOLDER_THICKNESS, border_thickness = XPI_CABLE_HOLDER_BORDER_THICKNESS, bottom_thickness = XPI_CABLE_HOLDER_BOTTOM_THICKNESS);
}

XPI_CLIPING_HOLE_WIDTH = 10;
XPI_CLIPING_HOLE_HEIGHT = 3;
XPI_CLIPING_HOLE_DEPTH = 0.5;

/* Cable holder offset from side*/
XPI_CABLE_HOLDER_SIDE_OFFSET = 3;

module x_pulley_idler()
{
    ROUND = 2;
    /* Outer Pulley shell */
    difference() {
        union() {
             roundedcube([X_PULLEY_IDLER_OVERHANG, X_PULLEY_HEIGHT, XPI_FULL_HEIGHT], false, ROUND, "z");
             translate([ROUND, 0, 0]) cube([X_PULLEY_IDLER_OVERHANG - ROUND, X_PULLEY_HEIGHT,  X_PULLEY_IDLER_BEARING_THICKNESS + X_PULLEY_IDLER_OUTER_THICKNESS  + GANTRY_WIDTH]);
        }
       translate([X_PULLEY_IDLER_OVERHANG, X_PULLEY_HEIGHT/2 + X_PULLEY_IDLER_TOP_THICKNESS / 2, X_PULLEY_IDLER_OUTER_THICKNESS]) scale([1, 1.4, 1]) cylinder(d = X_PULLEY_CAGE_DIAM, h = X_PULLEY_IDLER_BEARING_THICKNESS);
        translate([0, 0, XPI_CABLE_HOLDER_HEIGHT]) {
            translate([0, X_PULLEY_HEIGHT/5, 0]) rotate([0, 0, -90])  sliding_rails(XPI_SLIDE_RAIL_WIDTH_BOTTOM, XPI_SLIDE_RAIL_WIDTH_TOP, XPI_SLIDE_RAIL_HEIGHT, XPI_FULL_HEIGHT);
            translate([0, X_PULLEY_HEIGHT/5 * 4, 0]) rotate([0, 0, -90])  sliding_rails(XPI_SLIDE_RAIL_WIDTH_BOTTOM, XPI_SLIDE_RAIL_WIDTH_TOP, XPI_SLIDE_RAIL_HEIGHT, XPI_FULL_HEIGHT);
        }

        /* Cliping hole */
        translate([0, X_PULLEY_HEIGHT/2 - XPI_CLIPING_HOLE_WIDTH/2, XPI_CABLE_HOLDER_HEIGHT/2]) cube([XPI_CLIPING_HOLE_DEPTH, XPI_CLIPING_HOLE_WIDTH, XPI_CLIPING_HOLE_HEIGHT]);
    }
    /* Cable holder on side */
    translate([0, XPI_CABLE_HOLDER_SIDE_OFFSET , 0]) rotate([0, -90, -90]) xpi_cable_holder();
    translate([0, X_PULLEY_HEIGHT - XPI_CABLE_HOLDER_SIDE_OFFSET  - XPI_CABLE_HOLDER_THICKNESS, 0]) rotate([0, -90, -90]) xpi_cable_holder();
    
    /* Top connection with gantry */
    x_pulley_idler_gantry_link();

    /* Pulley hole for screw */
    translate([X_PULLEY_IDLER_OVERHANG, X_PULLEY_HEIGHT/2 + X_PULLEY_IDLER_TOP_THICKNESS/2, 0]) {
        difference() {
            union() {
                translate([0, -BELT_PULLEY_DIAM/2, 0]) cube([GANTRY_THICKNESS / 2, BELT_PULLEY_DIAM, X_PULLEY_IDLER_OUTER_THICKNESS]);
                translate([GANTRY_THICKNESS/2, 0, 0]) cylinder(d = BELT_PULLEY_DIAM, h = X_PULLEY_IDLER_OUTER_THICKNESS);
            }
            translate([GANTRY_THICKNESS/2, 0, 0]) {
                cylinder(d = M3_DIAM, h = X_PULLEY_IDLER_OUTER_THICKNESS);
                cylinder(d = M3_HEAD_DIAM, h = 1);
            }
        }
    }
}

GCH_THICKNESS = 4;
GCH_SIDE_THICKNESS = 2;
GCH_WIDTH = MGN9C_HOLE_X_OFFSET + M3_HEAD_DIAM + 2 * GCH_SIDE_THICKNESS;
GCH_HEIGHT = M3_HEAD_DIAM + XPI_CABLE_HOLDER_THICKNESS + 2 * GCH_SIDE_THICKNESS;

module gantry_side_cable_holder()
{
    difference() {
        translate([0, 0, 0]) cube([GCH_WIDTH, GCH_THICKNESS, GCH_HEIGHT]);
    
        translate([M3_HEAD_DIAM/2 + GCH_SIDE_THICKNESS, GCH_THICKNESS, GCH_HEIGHT - M3_HEAD_DIAM/2 - GCH_SIDE_THICKNESS]) rotate([90, 0, 0]) m3_with_head(M3_HEAD_THICKNESS + GCH_THICKNESS);
        translate([GCH_WIDTH - M3_HEAD_DIAM/2 - GCH_SIDE_THICKNESS, GCH_THICKNESS, GCH_HEIGHT - M3_HEAD_DIAM/2 - GCH_SIDE_THICKNESS]) rotate([90, 0, 0]) m3_with_head(M3_HEAD_THICKNESS + GCH_THICKNESS);
    }
    translate([GCH_WIDTH/2- XPI_CABLE_HOLDER_HEIGHT/2, 0, 0]) xpi_cable_holder();
}

GS90CH_HEIGHT = XPI_CABLE_HOLDER_HEIGHT + M3_HEAD_DIAM + 2 * GCH_SIDE_THICKNESS;

module gantry_side_90_cable_holder()
{
    difference() {
        translate([0, 0, 0]) cube([GCH_WIDTH, GCH_THICKNESS, GS90CH_HEIGHT]);
    
        translate([0, GCH_THICKNESS/2, -XPI_CABLE_HOLDER_THICKNESS]) rotate([0, -45, 0]) #cube([XPI_CABLE_HOLDER_HEIGHT * 2, GCH_THICKNESS, XPI_CABLE_HOLDER_HEIGHT * 2], center = true);
        translate([0, 0, GS90CH_HEIGHT - M3_HEAD_DIAM/2 - GCH_SIDE_THICKNESS]) {
            translate([M3_HEAD_DIAM/2 + GCH_SIDE_THICKNESS, GCH_THICKNESS, 0]) rotate([90, 0, 0]) m3_with_head(M3_HEAD_THICKNESS + GCH_THICKNESS);
            translate([GCH_WIDTH - M3_HEAD_DIAM/2 - GCH_SIDE_THICKNESS, GCH_THICKNESS, 0]) rotate([90, 0, 0]) m3_with_head(M3_HEAD_THICKNESS + GCH_THICKNESS);
        }
    }
    translate([GCH_WIDTH, 0, 0]) rotate([0, -90, 0])  xpi_cable_holder();
}

GBCH_THICKNESS = 1.5;
GBCH_WIDTH = FLAT_AL_STRIP_WIDTH + GBCH_THICKNESS * 2;
GBCH_CLIP_THICKNESS = 1;
GBCH_CLIP_DEPTH = 1;
FLAT_AL_STRIP_TOLERANCY = 0.6;

module flat_al_cable_holder()
{
    
    difference() {
        cube([GBCH_WIDTH , GBCH_THICKNESS + FLAT_AL_STRIP_THICKNESS + GBCH_CLIP_THICKNESS, XPI_CABLE_HOLDER_THICKNESS]);
        translate([GBCH_WIDTH/2 - (FLAT_AL_STRIP_WIDTH - FLAT_AL_STRIP_TOLERANCY)/2, GBCH_THICKNESS, 0]) cube([FLAT_AL_STRIP_WIDTH - FLAT_AL_STRIP_TOLERANCY, FLAT_AL_STRIP_THICKNESS, XPI_CABLE_HOLDER_THICKNESS]);
        translate([GBCH_WIDTH/2 - FLAT_AL_STRIP_WIDTH/2 + GBCH_CLIP_DEPTH, GBCH_THICKNESS + FLAT_AL_STRIP_THICKNESS, 0]) cube([FLAT_AL_STRIP_WIDTH - 2 * GBCH_CLIP_DEPTH, FLAT_AL_STRIP_THICKNESS, XPI_CABLE_HOLDER_THICKNESS]);
    }
    translate([GBCH_WIDTH/2- XPI_CABLE_HOLDER_HEIGHT/2, 0, 0])  xpi_cable_holder();
}

LPS_HOLE_SPACING = 60;
LPS_HEIGHT = LPS_HOLE_SPACING + 10;
LPS_WIDTH = 20;
LPS_THICKNESS = 5;
LPS_SLIDING_RAIL_SPACING = (X_PULLEY_HEIGHT / 5 * 4) - (X_PULLEY_HEIGHT / 5);

module laser_power_support()
{
    difference()  {
        roundedcube([LPS_WIDTH, LPS_HEIGHT, LPS_THICKNESS], false, 0.70, "zmin");
    translate([LPS_WIDTH/2, LPS_HEIGHT/2 - LPS_HOLE_SPACING/2, 0]) m3_with_head(LPS_THICKNESS);
    translate([LPS_WIDTH/2, LPS_HEIGHT/2 + LPS_HOLE_SPACING/2, 0]) m3_with_head(LPS_THICKNESS);
        
    }
    translate([0, LPS_HEIGHT/2 - LPS_SLIDING_RAIL_SPACING/2, LPS_THICKNESS]) rotate([90, 0, 90]) sliding_rails(XPI_SLIDE_RAIL_WIDTH_BOTTOM - 0.1, XPI_SLIDE_RAIL_WIDTH_TOP - 0.1, XPI_SLIDE_RAIL_HEIGHT - 0.1, LPS_WIDTH);
    translate([0, LPS_HEIGHT/2 + LPS_SLIDING_RAIL_SPACING/2, LPS_THICKNESS]) rotate([90, 0, 90]) sliding_rails(XPI_SLIDE_RAIL_WIDTH_BOTTOM - 0.1, XPI_SLIDE_RAIL_WIDTH_TOP - 0.1, XPI_SLIDE_RAIL_HEIGHT - 0.1, LPS_WIDTH);
}


