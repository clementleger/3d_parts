include <../common/roundedcube.scad>
include <../common/prism.scad>
include <../common/threads.scad>
include <../common/chamfers.scad>
include <../common/timing_belts.scad>


SMALL_TOLERANCY = 0.2;

BELT_WIDTH = 6;
BELT_THICKNESS = 1.5;

M3_HEAD_DIAM = 6;
M3_HEAD_THICKNESS = 2;
M3_DIAM = 3;
M3_NUT_DIAM = 7;
M3_NUT_THICKNESS = 2.5;
M3_NUT_SIDE_TO_SIDE_THICKNESS = 6;
M3_WASHER_DIAM = 7;
M3_WASHER_THICKNESS= 0.4;

M2_DIAM = 2;
M2_HEAD_DIAM = 3;
M2_NUT_DIAM = 5;
M2_NUT_THICKNESS = 1.5;


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
GANTRY_MG_CARRIAGE_DEPTH = 1;

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
MG_CARRIAGE_WIDTH = 30;
MG_CARRIAGE_HEIGHT = 20.5;
MG_CARRIAGE_NUT_DIAM = M3_DIAM;
MG_CARRIAGE_HOLE_OFFSET = 2.75;
MG_CARRIAGE_HOLE_X_OFFSET = 10;
MG_CARRIAGE_HOLE_Y_OFFSET = 15;

FLAT_AL_STRIP_WIDTH = 25 + SMALL_TOLERANCY;
FLAT_AL_STRIP_THICKNESS = 2 + SMALL_TOLERANCY;
FLAT_AL_TIGHTEN_SIZE = 40;

/* Gantry top part */
GANTRY_TOP_WIDTH = NEMA17_WIDTH;
GANTRY_TOP_HEIGHT = Y_RAIL_FIRST_HOLE_OFFSET + RAIL_HOLE_SPACING + GANTRY_THICKNESS + RAIL_HOLE_SPACING / 2 ;
GANTRY_TOP_THICKNESS = 8;
GANTRY_TOP_CHAMFER_SIZE = 8;

/* Slope part of gantry */
SLOPE_PART_Y_OFFSET =  GANTRY_CARRIAGE_Y_OFFSET  - MG_CARRIAGE_HOLE_OFFSET + MG_CARRIAGE_HEIGHT;
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

Z_AXIS_FB_HEIGHT = Z_AXIS_FB_BOTTOM_HEIGHT + Z_AXIS_FB_TOP_HEIGHT + MG_CARRIAGE_HEIGHT;
Z_AXIS_FB_WIDTH = MG_CARRIAGE_WIDTH + 2 * Z_AXIS_SIDE_WIDTH;

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
ZIPTIE_WIDTH = 3;
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
z_carriage_motor_holder();
//x_endstop_holder();
//y_pulley_idler();


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
    translate([MG_CARRIAGE_HOLE_X_OFFSET, 0, 0]) cylinder(d = diam, h = thickness);
    translate([MG_CARRIAGE_HOLE_X_OFFSET, MG_CARRIAGE_HOLE_Y_OFFSET, 0]) cylinder(d = diam, h = thickness);
    translate([0, MG_CARRIAGE_HOLE_Y_OFFSET, 0]) cylinder(d = diam, h = thickness);
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
           cylinder(d = M3_DIAM, h = GANTRY_TOP_THICKNESS);
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
                translate([GANTRY_WIDTH/2 - MG_CARRIAGE_HOLE_X_OFFSET/2, GANTRY_CARRIAGE_Y_OFFSET, 0]) gantry_carriage_holes(GANTRY_BOLT_HOLE_DIAM, GANTRY_THICKNESS);
                /* Holes for bolt head */
                //translate([GANTRY_WIDTH/2 - MG_CARRIAGE_HOLE_X_OFFSET/2, GANTRY_CARRIAGE_Y_OFFSET, - GANTRY_THICKNESS + GANTRY_NUT_HEAD_THICKNESS]) gantry_carriage_holes(GANTRY_BOLT_HEAD_DIAM);
                translate([0, GANTRY_CARRIAGE_Y_OFFSET - MG_CARRIAGE_HOLE_OFFSET, GANTRY_THICKNESS - GANTRY_MG_CARRIAGE_DEPTH])  cube([MG_CARRIAGE_WIDTH, MG_CARRIAGE_HEIGHT, GANTRY_MG_CARRIAGE_DEPTH]);

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
    translate([MG_CARRIAGE_WIDTH/2 - MG_CARRIAGE_HOLE_X_OFFSET/2, MG_CARRIAGE_HEIGHT/2 - MG_CARRIAGE_HOLE_Y_OFFSET/2, 0]) {
          gantry_carriage_holes(M3_DIAM, Z_AXIS_THICKNESS);
          translate([0, 0, Z_AXIS_THICKNESS - Z_AXIS_M3_HEAD_THICKNESS]) gantry_carriage_holes(M3_HEAD_DIAM, Z_AXIS_M3_HEAD_THICKNESS);
    }
}

module x_carriage_holes_belt_attachment(h = Z_AXIS_THICKNESS)
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
        translate([Z_AXIS_FB_WIDTH/2 - MG_CARRIAGE_WIDTH/2, Z_AXIS_FB_BOTTOM_HEIGHT, 0]) {
            /* MG carriage footprint hole */
            //cube([MG_CARRIAGE_WIDTH, MG_CARRIAGE_HEIGHT, Z_AXIS_CARRIAGE_DEPTH]);
            x_carriage_holder_mg_footprint();
        }
        /* Holes for belt attachment */
        translate([Z_AXIS_FB_WIDTH/2, Z_AXIS_FB_BOTTOM_HEIGHT + MG_CARRIAGE_HEIGHT/2 + GANTRY_TOP_WIDTH/2  + X_BELT_EXTRA_WIDTH_FROM_TOP + X_BELT_BLOCKER_TOP_THICKNESS/2, 0]) {
            translate([-X_BELT_HOLE_SPACING/2, 0, 0]) x_carriage_holes_belt_attachment();
            translate([X_BELT_HOLE_SPACING/2, 0, 0]) x_carriage_holes_belt_attachment();
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
Z_AXIS_MB_HEIGHT = Z_AXIS_MB_BOTTOM_HEIGHT + Z_AXIS_MB_TOP_HEIGHT + MG_CARRIAGE_HEIGHT;
Z_AXIS_MB_WIDTH = MG_CARRIAGE_WIDTH + 2 * Z_AXIS_MB_SIDE_WIDTH;
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
        translate([Z_AXIS_MB_WIDTH/2 - MG_CARRIAGE_WIDTH/2, Z_AXIS_MB_BOTTOM_HEIGHT, 0]) {
            /* MG carriage footprint hole */
            //cube([MG_CARRIAGE_WIDTH, MG_CARRIAGE_HEIGHT, Z_AXIS_CARRIAGE_DEPTH]);
            x_carriage_holder_mg_footprint();
        }
        /* Holes for belt attachment */
        translate([Z_AXIS_MB_WIDTH/2, Z_AXIS_MB_BOTTOM_HEIGHT + MG_CARRIAGE_HEIGHT/2 + GANTRY_TOP_WIDTH/2  + X_BELT_EXTRA_WIDTH_FROM_TOP + X_BELT_BLOCKER_TOP_THICKNESS/2, 0]) {
            translate([-X_BELT_HOLE_SPACING/2, 0, 0]) x_carriage_holes_belt_attachment();
            translate([X_BELT_HOLE_SPACING/2, 0, 0]) x_carriage_holes_belt_attachment();
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
Z_AXIS_ROD_DIAM= 5;
686ZZ_OUTER_DIAMETER = 13;
686ZZ_THICKNESS = 5;
Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS = 2;
Z_AXIS_ROD_HOLDER_THICKNESS = 686ZZ_THICKNESS + Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS;
Z_AXIS_ROD_HOLDER_DIAM= 686ZZ_OUTER_DIAMETER + 2 * Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS;

Z_AXIS_BOLT_HOLES_LENGTH = 20;

module z_motor_holder()
{
    translate ([0, Z_AXIS_SUPPORT_EXTRA_BOTTOM, 0]) z_nema14_support(NEMA14_WIDTH, NEMA14_WIDTH, Z_AXIS_NEMA_HOLDER_THICKNESS);
    translate([-Z_AXIS_NEMA_HOLDER_THICKNESS, 0, 0]) prism_with_base(Z_AXIS_NEMA_HOLDER_THICKNESS, Z_AXIS_MOTOR_HOLDER_WIDTH, Z_AXIS_MOTOR_SIDE_HEIGHT, Z_AXIS_NEMA_HOLDER_THICKNESS);
    translate([NEMA14_WIDTH, 0, 0]) prism_with_base(Z_AXIS_NEMA_HOLDER_THICKNESS, Z_AXIS_MOTOR_HOLDER_WIDTH, Z_AXIS_MOTOR_SIDE_HEIGHT, Z_AXIS_NEMA_HOLDER_THICKNESS);
}

module z_axis_bearing_holes()
{
    translate([Z_AXIS_ROD_HOLDER_DIAM/2, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_DIAM/2]) rotate([90, 0, 0]) cylinder(d = 686ZZ_OUTER_DIAMETER, h = 686ZZ_THICKNESS);
}

module z_axis_rod_holder()
{
    difference() {
            union() {
                cube([Z_AXIS_ROD_HOLDER_DIAM, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_DIAM/2]);
                translate([Z_AXIS_ROD_HOLDER_DIAM/2, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_DIAM/2]) rotate([90, 0, 0]) cylinder(d = Z_AXIS_ROD_HOLDER_DIAM, h = Z_AXIS_ROD_HOLDER_THICKNESS);
            }
            translate([Z_AXIS_ROD_HOLDER_DIAM/2, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_DIAM/2]) rotate([90, 0, 0]) cylinder(d = Z_AXIS_ROD_DIAM, h = Z_AXIS_ROD_HOLDER_THICKNESS);
            translate([0, 0, Z_AXIS_ROD_HOLDER_DIAM - Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS ]) cube([Z_AXIS_ROD_HOLDER_DIAM, Z_AXIS_ROD_HOLDER_THICKNESS, Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS]);
    }
}

module z_axis_motor_holder_holes(x_offset)
{
    /* Top hole */
    translate([x_offset, Z_AXIS_MB_HEIGHT - Z_AXIS_NEMA_HOLDER_THICKNESS - Z_AXIS_MOTOR_HOLDER_TOP_HOLE_OFFSET, Z_AXIS_THICKNESS - Z_AXIS_BOLT_HOLES_LENGTH]) {
        x_carriage_holes_belt_attachment(h = Z_AXIS_BOLT_HOLES_LENGTH);
        translate([0, 0, 8]) cube([X_BELT_BLOCKER_TOP_THICKNESS, M3_NUT_SIDE_TO_SIDE_THICKNESS, M3_NUT_THICKNESS], center = true);
    }

    /* Bottom hole */
    translate([x_offset, Z_AXIS_MB_HEIGHT - Z_AXIS_NEMA_HOLDER_THICKNESS - Z_AXIS_MOTOR_SIDE_HEIGHT + Z_AXIS_MOTOR_HOLDER_BOTTOM_HOLE_OFFSET, Z_AXIS_THICKNESS - Z_AXIS_BOLT_HOLES_LENGTH]) {
        x_carriage_holes_belt_attachment(h = Z_AXIS_BOLT_HOLES_LENGTH);
    
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

module z_carriage_moving_base(motor_holder_only = false)
{
    difference() {
        union () {
            if (motor_holder_only == true) {
            translate([Z_AXIS_MB_WIDTH/2 - NEMA14_WIDTH/2, Z_AXIS_MB_HEIGHT, -NEMA14_WIDTH - Z_AXIS_SUPPORT_EXTRA_BOTTOM]) rotate([90, 0, 0]) z_motor_holder();
            }
            if (motor_holder_only == false) {
                 z_axis_base_support();
                translate([Z_AXIS_MB_WIDTH/2 - Z_AXIS_ROD_HOLDER_DIAM/2, 0, Z_AXIS_THICKNESS - Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS - ROD_HOLDER_Z_OFFSET]) {
                    translate([0, Z_AXIS_ROD_HOLDER_THICKNESS, 0]) mirror([0, 180, 0])  z_axis_rod_holder();
                    translate([0, Z_AXIS_MB_HEIGHT - Z_AXIS_ROD_HOLDER_THICKNESS, 0]) z_axis_rod_holder();
                }
            }
        }
         translate([Z_AXIS_MB_WIDTH/2 - Z_AXIS_ROD_HOLDER_DIAM/2, 0, Z_AXIS_THICKNESS - Z_AXIS_ROD_HOLDER_EXTRA_THICKNESS - ROD_HOLDER_Z_OFFSET]) {
                translate([0, Z_AXIS_ROD_HOLDER_THICKNESS, 0]) mirror([0, 180, 0])  z_axis_bearing_holes();
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

