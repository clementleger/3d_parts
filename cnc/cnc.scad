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

/* Endstop holder length */
X_ESH_LENGTH = 25;
/* Size of microswitch mount */
X_ESH_MICROSWITCH_MOUNT_WIDTH = MICROSWITCH_WIDTH + 4;
X_ESH_MICROSWITCH_MOUNT_HEIGHT = 10;
/* Thickness */
X_ESH_THICKNESS = 5;
/* Bolt offset from start of endstop holder */
X_ESH_BOLT_X_OFFSET = 10;


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
NEMA_WIDTH = 42.5;
NEMA_HOLE_SPACING = 31;
NEMA_CENTER_DIAM = 25;
NEMA_ATTACHMENT_THICKNESS = 8;
/* Size of hole for belt pulley (maximize to allow some slack) */
NEMA_BELT_HOLE_DIAM = 20;
/* Space between both side of the belt when tensionned */
BELT_PULLEY_DIAM = 12;
/* Oblong hole size for adjusting belt tension */
NEMA_OBLONG_SIZE = 2;
/* Little part longer than the rest */
NEMA_ATTACHMENT_LENGTH = 15;
NEMA_ROUNDING = 2;
NEMA_HOLE_DIAM = 3;

GANTRY_NEMA_HOLE_Z_OFFSET = NEMA_WIDTH/2 - NEMA_BELT_HOLE_DIAM/2;

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
GANTRY_TOP_WIDTH = NEMA_WIDTH;
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
/* Width between y belt and gantry top part */
X_BELT_WIDTH_FROM_GANTRY_TOP = 5;
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
X_BELT_WIDTH_TO_CARRIAGE = BELT_WIDTH + X_BELT_WIDTH_FROM_GANTRY_TOP + GANTRY_TOP_THICKNESS + CARRIAGE_SPACE_BETWEEN_SUPPORT;
/* Hole attachment spacing */
X_BELT_HOLE_SPACING = X_BELT_BLOCKER_WIDTH / 2;

/* Carriage holder */
X_CH_SIDE_WIDTH = 10;
/* Additionnal height on the top */
X_CH_TOP_HEIGHT = 30;
/* Additionnal height on the bottom */
X_CH_BOTTOM_HEIGHT = 10;
/* Carriage holder thickness */
X_CH_THICKNESS = 6;
/* Depth of carriage dimension into this  */
X_CH_CARRIAGE_DEPTH = 0.6;
/* Full M3 head thickness to sunk it in the layer */
X_CH_M3_HEAD_THICKNESS = 3;

X_CH_HEIGHT = X_CH_BOTTOM_HEIGHT + X_CH_TOP_HEIGHT + MG_CARRIAGE_HEIGHT;
X_CH_WIDTH = MG_CARRIAGE_WIDTH + 2 * X_CH_SIDE_WIDTH;

/* Guide for real carriage (width ) */
X_CH_GUIDE_WIDTH = 2;
/* Guide for real carriage (thickness) */
X_CH_GUIDE_THICKNESS = 1;

/* offset from each side of carriage holder */
X_CH_HOLE_OFFSET_FROM_SIDE = 4;
/* Space between the two long holes to attach carriage */
X_CH_SPACE_BETWEEN_HOLES = 4;

/* Oblong holes for real carriage */
X_CH_HOLE_LENGTH = X_CH_HEIGHT/2 - X_CH_HOLE_OFFSET_FROM_SIDE - X_CH_SPACE_BETWEEN_HOLES / 2 -  M3_WASHER_DIAM/2;

SECOND_BELT_OFFSET = 3;

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
y_belt_blocker();
//y_motor_holder();
//x_rail_stopper();
//x_belt_attachment();
//x_carriage_holder();
//x_endstop_holder();


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
        translate([0, GANTRY_NEMA_HOLE_Z_OFFSET/2, GANTRY_THICKNESS + NEMA_ATTACHMENT_LENGTH]) rotate([0, 90, 0]) {
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
    MIDDLE_BLOCK_THICKNESS = Y_BELT_BLOCKER_THICKNESS * 2 +SECOND_BELT_OFFSET;
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


module nema_support(part_width)
{
    difference() {
        union() {
            cube([NEMA_WIDTH + NEMA_ATTACHMENT_THICKNESS, part_width, NEMA_ATTACHMENT_THICKNESS]);
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
        /* Hole for NEMA motor */
        translate([NEMA_WIDTH/2, NEMA_WIDTH/2, 0]) cylinder (d = NEMA_CENTER_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
        translate([NEMA_WIDTH/2 - NEMA_BELT_HOLE_DIAM/2, NEMA_WIDTH/2, 0]) cube([NEMA_BELT_HOLE_DIAM, NEMA_CENTER_DIAM + NEMA_ATTACHMENT_LENGTH + GANTRY_THICKNESS, NEMA_ATTACHMENT_THICKNESS]);
    }
}

module x_motor_holder()
{
    nema_support(NEMA_WIDTH + GANTRY_THICKNESS);
    difference() {
        union() {
            /* Longer part */

            translate( [0, NEMA_WIDTH + GANTRY_THICKNESS, 0]) cube([NEMA_WIDTH / 2, NEMA_ATTACHMENT_LENGTH, NEMA_ATTACHMENT_THICKNESS]);
            /* Longer part end rounding */
            translate([GANTRY_NEMA_HOLE_Z_OFFSET/2, NEMA_WIDTH + GANTRY_THICKNESS + NEMA_ATTACHMENT_LENGTH, 0]) cylinder (d = GANTRY_NEMA_HOLE_Z_OFFSET, h = NEMA_ATTACHMENT_THICKNESS);
                   /* Upper part */
            translate([NEMA_WIDTH, NEMA_WIDTH, 0]) upper_nema_part();
             translate([NEMA_WIDTH, 0, NEMA_ATTACHMENT_THICKNESS]) prism(NEMA_ATTACHMENT_THICKNESS, NEMA_WIDTH, GANTRY_WIDTH);
        }

        /* Longer part end hole */
            translate([GANTRY_NEMA_HOLE_Z_OFFSET/2, NEMA_WIDTH + GANTRY_THICKNESS + NEMA_ATTACHMENT_LENGTH, 0]) cylinder (d = M3_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
            translate([GANTRY_NEMA_HOLE_Z_OFFSET/2, NEMA_WIDTH + GANTRY_THICKNESS + NEMA_ATTACHMENT_LENGTH, - NEMA_ATTACHMENT_THICKNESS + M3_HEAD_THICKNESS]) cylinder (d = M3_HEAD_DIAM, h = NEMA_ATTACHMENT_THICKNESS);

        /* Hole for NEMA motor */
        translate([NEMA_WIDTH/2, NEMA_WIDTH/2, 0]) cylinder (d = NEMA_CENTER_DIAM, h = NEMA_ATTACHMENT_THICKNESS);
        translate([NEMA_WIDTH/2 - NEMA_BELT_HOLE_DIAM/2, NEMA_WIDTH/2, 0]) cube([NEMA_BELT_HOLE_DIAM, NEMA_CENTER_DIAM + NEMA_ATTACHMENT_LENGTH + GANTRY_THICKNESS, NEMA_ATTACHMENT_THICKNESS]);
    }
}

module y_motor_holder()
{
    translate([0, NEMA_ATTACHMENT_THICKNESS + NEMA_OBLONG_SIZE, 0]) nema_support(NEMA_WIDTH);
    cube([NEMA_WIDTH + NEMA_ATTACHMENT_THICKNESS, NEMA_ATTACHMENT_THICKNESS + NEMA_OBLONG_SIZE, NEMA_ATTACHMENT_THICKNESS]);

    /* Top */
    translate([NEMA_WIDTH, 0, NEMA_ATTACHMENT_THICKNESS]) cube([NEMA_ATTACHMENT_THICKNESS, NEMA_WIDTH + NEMA_ATTACHMENT_THICKNESS + NEMA_OBLONG_SIZE,NEMA_WIDTH]);

    translate([0, NEMA_ATTACHMENT_THICKNESS, NEMA_ATTACHMENT_THICKNESS]) rotate([0, 0, -90]) prism(NEMA_ATTACHMENT_THICKNESS, NEMA_WIDTH, NEMA_WIDTH);
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

X_ESH_OBLONG_SIZE = 5;

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
          gantry_carriage_holes(M3_DIAM, X_CH_THICKNESS);
          translate([0, 0, X_CH_THICKNESS - X_CH_M3_HEAD_THICKNESS]) gantry_carriage_holes(M3_HEAD_DIAM, X_CH_M3_HEAD_THICKNESS);
    }
}

module x_carriage_holes_belt_attachment()
{
    cylinder(d = M3_DIAM, h = X_CH_THICKNESS);
    translate([0, 0, X_CH_THICKNESS - X_CH_M3_HEAD_THICKNESS]) cylinder(d = M3_HEAD_DIAM, h = X_CH_M3_HEAD_THICKNESS);
}

module x_ch_holes()
{
    translate([M3_DIAM/2, X_CH_HOLE_LENGTH + M3_WASHER_DIAM/2 + X_CH_HOLE_OFFSET_FROM_SIDE/2,  0]) {
            oblong_hole(M3_DIAM, X_CH_THICKNESS, X_CH_HOLE_LENGTH);
            oblong_hole(M3_WASHER_DIAM, M3_NUT_THICKNESS + M3_WASHER_THICKNESS, X_CH_HOLE_LENGTH);
        }
    translate([M3_DIAM/2, X_CH_HEIGHT - M3_WASHER_DIAM/2 - X_CH_HOLE_OFFSET_FROM_SIDE/2,  0]) {
            oblong_hole(M3_DIAM, X_CH_THICKNESS, X_CH_HOLE_LENGTH);
            oblong_hole(M3_WASHER_DIAM, M3_NUT_THICKNESS + M3_WASHER_THICKNESS, X_CH_HOLE_LENGTH);
        }
}

module x_carriage_holder()
{
    difference() {
        roundedcube([X_CH_WIDTH, X_CH_HEIGHT, X_CH_THICKNESS], false, 2, "z");
        /* MG carriage holes */
        translate([X_CH_WIDTH/2 - MG_CARRIAGE_WIDTH/2, X_CH_BOTTOM_HEIGHT, 0]) {
            /* MG carriage footprint hole */
            //cube([MG_CARRIAGE_WIDTH, MG_CARRIAGE_HEIGHT, X_CH_CARRIAGE_DEPTH]);
            x_carriage_holder_mg_footprint();
        }
        /* Holes for belt attachment */
        translate([X_CH_WIDTH/2, X_CH_BOTTOM_HEIGHT + MG_CARRIAGE_HEIGHT/2 + GANTRY_TOP_WIDTH/2  + X_BELT_EXTRA_WIDTH_FROM_TOP + X_BELT_BLOCKER_TOP_THICKNESS/2, 0]) {
            translate([-X_BELT_HOLE_SPACING/2, 0, 0]) x_carriage_holes_belt_attachment();
            translate([X_BELT_HOLE_SPACING/2, 0, 0]) x_carriage_holes_belt_attachment();
        }
        /* Oblong holes for real carriage */
            translate([X_CH_HOLE_OFFSET_FROM_SIDE, 0, 0]) x_ch_holes();
            translate([X_CH_WIDTH - X_CH_HOLE_OFFSET_FROM_SIDE - M3_WASHER_DIAM/2, 0, 0]) x_ch_holes();
     }
     /* Guide */
     translate([X_CH_WIDTH/2 -X_CH_GUIDE_WIDTH/2, 0, X_CH_THICKNESS])  cube([X_CH_GUIDE_WIDTH, X_CH_HEIGHT, X_CH_GUIDE_THICKNESS]);
}
