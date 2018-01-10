include <../common/roundedcube.scad>
include <../common/prism.scad>
include <../common/threads.scad>
include <../MCAD/bearing.scad>

Y_ROD_DIAMETER = 8;
Y_ROD_LENGTH = 500;

X_ROD_DIAMETER = 8;
X_ROD_LENGTH = 350;

LM8UU_OUTER_DIAMETER = 15;
LM8UU_LENGTH = 24;

GANTRY_SIDE_WIDTH = 100;
/* Thickness of joint at angle of chassis (were Y rod are attached) */
CHASSIS_JOINT_THICKNESS = 2;


PROFILE_WIDTH = 20;
/* Start and end beam width */
MAIN_BEAM_WIDTH = PROFILE_WIDTH;
/* Start and end beam height */
MAIN_BEAM_HEIGHT = 3 * PROFILE_WIDTH;

SIDE_BEAM_WIDTH = PROFILE_WIDTH;
SIDE_BEAM_HEIGHT = PROFILE_WIDTH;

/* Table MDF thickness */
TABLE_THICKNESS = 16;

Y_ROD_HOLDER_BEAM_OVERLAP = 20;
Y_ROD_HOLDER_SCREW_HOLE_DIAMETER = 3;

/* Only useful for table preview */
TABLE_HOLE_X_COUNT = 7;
TABLE_HOLE_Y_COUNT = 5;
TABLE_HOLE_DIAMETER = 8;
TABLE_HOLE_START_OFFSET = 40;

/* Pulley Bearing size */
PULLEY_BEARING_TOLERANCY = 0.2;
PULLEY_BEARING_THICKNESS = 7;
PULLEY_BEARING_OUTER_DIAMETER = 22;
PULLEY_BEARING_INNER_DIAMETER = 8;
PULLEY_HOLDER_THICKNESS = 3;
PULLEY_BELT_THICKNESS = 2;
PULLEY_TENSIONNER_HOLE_DIAMETER = 4;
PULLEY_TENSIONNER_TOLERANCY = 0.4;


/* Y NEMA Holder stuff */
NEMA_SCREW_SPACING = 31;
NEMA_SCREW_DIAMETER = 4;
NEMA_WIDTH = 42.3;
NEMA_LENGTH = 48;
NEMA_HOLDER_THICKNESS = 3;
NEMA_SHAFT_HOLE_DIAMETER = 25;

/* Height of the bottom attachment support of nema Y motor */
NEMA_BEAM_ATTACHMENT_HEIGHT = 30;

/*******************/
/* Generated Stuff */
/*******************/
Y_SHAFT_X_OVERHANG = 20;

/* Y Rod holder */
Y_ROD_HOLDER_DIAMETER = Y_ROD_DIAMETER + 2 * 5;
Y_ROD_FIX_X_OFFSET = MAIN_BEAM_HEIGHT/3 * 2 + CHASSIS_JOINT_THICKNESS ;
Y_ROD_HOLDER_THICKNESS = MAIN_BEAM_WIDTH + CHASSIS_JOINT_THICKNESS * 2; 
MAIN_BEAM_LENGTH = X_ROD_LENGTH;

Y_SHAFT_Z_OFFSET = PULLEY_BEARING_OUTER_DIAMETER + 15;

/* Table */
TABLE_WIDTH = Y_ROD_LENGTH +  2 * MAIN_BEAM_WIDTH;
TABLE_HEIGHT = MAIN_BEAM_LENGTH;
TABLE_HOLE_X_SPACING = (TABLE_WIDTH - 2 * TABLE_HOLE_START_OFFSET) / (TABLE_HOLE_X_COUNT - 1);
TABLE_HOLE_Y_SPACING = (TABLE_HEIGHT - 2 * TABLE_HOLE_START_OFFSET) / (TABLE_HOLE_Y_COUNT - 1);

/* Nema */
NEMA_HOLE_SLOT_WIDTH = NEMA_SCREW_DIAMETER;
NEMA_ATTACHMENT_WIDTH = NEMA_WIDTH + 2 * NEMA_HOLDER_THICKNESS;
NEMA_ATTACHMENT_HEIGHT = NEMA_WIDTH + 2 * NEMA_HOLDER_THICKNESS;
NEMA_BEAM_ATTACHMENT_WIDTH = NEMA_ATTACHMENT_WIDTH + PULLEY_BEARING_OUTER_DIAMETER + NEMA_HOLDER_THICKNESS;

/* assert section */
assert(PULLEY_HOLDER_WIDTH >= (Y_ROD_HOLDER_BEAM_OVERLAP + CHASSIS_JOINT_THICKNESS));

module y_beam()
{
    color("DarkGray")
    cube([MAIN_BEAM_WIDTH, MAIN_BEAM_LENGTH, MAIN_BEAM_HEIGHT], center = true);
}

module y_beams()
{
    translate([MAIN_BEAM_WIDTH, 0, MAIN_BEAM_HEIGHT - SIDE_BEAM_WIDTH]) {
   translate([0, - SIDE_BEAM_WIDTH/2 + TABLE_WIDTH/5, 0]) cube([Y_ROD_LENGTH, SIDE_BEAM_WIDTH, SIDE_BEAM_WIDTH]);
   translate([0, - SIDE_BEAM_WIDTH/2 - TABLE_WIDTH/5, 0]) cube([Y_ROD_LENGTH, SIDE_BEAM_WIDTH, SIDE_BEAM_WIDTH]);
    }
    translate([MAIN_BEAM_WIDTH/2, 0, MAIN_BEAM_HEIGHT/2]) {
        y_beam();
        translate([Y_ROD_LENGTH + MAIN_BEAM_WIDTH, 0, 0]) y_beam();
    }
}

module table()
{
    color("BurlyWood")
    translate([TABLE_WIDTH/2, 0, MAIN_BEAM_HEIGHT + TABLE_THICKNESS/2])
    
    difference() {
        cube([TABLE_WIDTH, TABLE_HEIGHT, TABLE_THICKNESS], center = true);
        for(x=[0:TABLE_HOLE_X_COUNT-1], y = [0:TABLE_HOLE_Y_COUNT - 1]) {
            translate([TABLE_WIDTH / 2 - TABLE_HOLE_START_OFFSET - x * TABLE_HOLE_X_SPACING, TABLE_HEIGHT / 2 - TABLE_HOLE_START_OFFSET - y * TABLE_HOLE_Y_SPACING, 0])cylinder(d = TABLE_HOLE_DIAMETER, h = TABLE_THICKNESS, center = true);
        }
    }
}

module y_rod()
{
    color("white")
    translate([MAIN_BEAM_WIDTH, MAIN_BEAM_LENGTH/2 - Y_ROD_HOLDER_BEAM_OVERLAP / 2, 0 ])
    rotate([90, 0, 90]) cylinder(d = Y_ROD_DIAMETER, h = Y_ROD_LENGTH);
}

module y_rods()
{
    translate([0, 0, MAIN_BEAM_HEIGHT - PROFILE_WIDTH / 2]) {
        y_rod();
        mirror([0, 1, 0]) y_rod();
    }
}

module nema_attachment()
{
    difference() {
    cube([NEMA_ATTACHMENT_WIDTH, NEMA_HOLDER_THICKNESS, NEMA_ATTACHMENT_HEIGHT]);
        translate ([(NEMA_ATTACHMENT_WIDTH)/2, 0, NEMA_WIDTH/2 + NEMA_HOLDER_THICKNESS]) rotate([-90, 0, 0]) cylinder(d = NEMA_SHAFT_HOLE_DIAMETER, h = NEMA_HOLDER_THICKNESS + 1);
        for(x=[-1,1], y = [-1,1]) {
            translate ([NEMA_ATTACHMENT_WIDTH / 2 + x * (NEMA_SCREW_SPACING/2) , 0, NEMA_WIDTH/2 +  NEMA_HOLDER_THICKNESS + y * (NEMA_SCREW_SPACING/2) + NEMA_HOLE_SLOT_WIDTH/2]) rotate([-90, 0, 0]) hull() {
                cylinder(d = NEMA_SCREW_DIAMETER, h = NEMA_HOLDER_THICKNESS + 1);
                translate([0, NEMA_HOLE_SLOT_WIDTH, 0]) cylinder(d = NEMA_SCREW_DIAMETER, h = NEMA_HOLDER_THICKNESS + 1);
            }
        }
    }
    /* Side of Nema Holder */
    translate([0, NEMA_LENGTH, 0])  {
        mirror([0, 1, 0]) prism(NEMA_HOLDER_THICKNESS, NEMA_LENGTH - NEMA_HOLDER_THICKNESS, NEMA_ATTACHMENT_HEIGHT);
        translate([NEMA_ATTACHMENT_WIDTH - NEMA_HOLDER_THICKNESS, 0, 0]) mirror([0, 1, 0]) prism(NEMA_HOLDER_THICKNESS, NEMA_LENGTH - NEMA_HOLDER_THICKNESS, NEMA_ATTACHMENT_HEIGHT);
    }
}

module y_nema_holder()
{
    BOTTOM_SUPPORT_X_OFFSET = NEMA_BEAM_ATTACHMENT_WIDTH - NEMA_HOLDER_THICKNESS - NEMA_HOLDER_THICKNESS  - (PULLEY_BEARING_OUTER_DIAMETER  / 2) - (MAIN_BEAM_WIDTH / 2);
    translate([-MAIN_BEAM_WIDTH/2, -MAIN_BEAM_LENGTH / 2 - CHASSIS_JOINT_THICKNESS, -CHASSIS_JOINT_THICKNESS + NEMA_ATTACHMENT_WIDTH]) color("pink") rotate([0, -90, 0]) mirror([1, 0, 0]) {
        cube([NEMA_ATTACHMENT_WIDTH, NEMA_LENGTH, NEMA_HOLDER_THICKNESS]);
        translate([0, 0, NEMA_HOLDER_THICKNESS]) nema_attachment();
    }
}

module y_lm8uu_holder()
{
    color("blue") {
    rotate([0, 90, 0]) cylinder(d = LM8UU_OUTER_DIAMETER, h = LM8UU_LENGTH);
    translate([GANTRY_SIDE_WIDTH - LM8UU_LENGTH, 0, 0]) rotate([0, 90, 0]) cylinder(d = LM8UU_OUTER_DIAMETER, h = LM8UU_LENGTH);
    /* Hole for rod */
    rotate([0, 90, 0]) cylinder(d = Y_ROD_DIAMETER + 2 * 0.5, h = GANTRY_SIDE_WIDTH);
    }
}

y_lm8uu_holder();
//y_nema_holder();
/*table();
y_beams();
y_rods();
*/