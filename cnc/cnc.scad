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


/* Thickness of joint at angle of chassis (were Y rod are attached) */
CHASSIS_JOINT_THICKNESS = 2;

/* Start and end beam width */
MAIN_BEAM_WIDTH = 18;
/* Start and end beam height */
MAIN_BEAM_HEIGHT = 80;

/* Table MDF thickness */
TABLE_THICKNESS = 16;

Y_ROD_TOLERANCY = 0.4;
Y_ROD_HOLDER_OPENING_THICKNESS = 1.5;
Y_ROD_HOLDER_BEAM_OVERLAP = 20;
Y_ROD_HOLDER_SCREW_HOLE_DIAMETER = 3;
Y_SHAFT_DIAMETER = 8;

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
TABLE_WIDTH = Y_ROD_LENGTH - 2 * Y_ROD_HOLDER_THICKNESS + 2 * CHASSIS_JOINT_THICKNESS;
TABLE_HEIGHT = MAIN_BEAM_LENGTH - Y_ROD_HOLDER_BEAM_OVERLAP * 2;
TABLE_HOLE_X_SPACING = (TABLE_WIDTH - 2 * TABLE_HOLE_START_OFFSET) / (TABLE_HOLE_X_COUNT - 1);
TABLE_HOLE_Y_SPACING = (TABLE_HEIGHT - 2 * TABLE_HOLE_START_OFFSET) / (TABLE_HOLE_Y_COUNT - 1);

REAL_BEAM_HOLDER_WIDTH = MAIN_BEAM_WIDTH + 2 * CHASSIS_JOINT_THICKNESS;
REAL_BEAM_HOLDER_HEIGHT = MAIN_BEAM_HEIGHT + 2 * CHASSIS_JOINT_THICKNESS;
PULLEY_HOLDER_BASE = 10;
PULLEY_HOLDER_HEIGHT = PULLEY_BEARING_OUTER_DIAMETER + PULLEY_BELT_THICKNESS * 2;
PULLEY_TENSIONNER_FULL_THICKNESS = PULLEY_BEARING_THICKNESS + 2 * 2;
PULLEY_HOLDER_WIDTH = PULLEY_HOLDER_THICKNESS * 2 + PULLEY_TENSIONNER_FULL_THICKNESS + PULLEY_TENSIONNER_TOLERANCY;
PULLEY_BEARING_HOLE_DIAMETER = PULLEY_BEARING_OUTER_DIAMETER + PULLEY_BEARING_TOLERANCY * 2;

UPPER_MAIN_BEAM_MIDDLE = TABLE_WIDTH + MAIN_BEAM_WIDTH / 2;

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
    translate([0, 0, MAIN_BEAM_HEIGHT/2]) {
        y_beam();
        translate([Y_ROD_LENGTH - MAIN_BEAM_WIDTH + 2 * CHASSIS_JOINT_THICKNESS, 0, 0]) y_beam();
    }
}

module table()
{
    color("BurlyWood")
    translate([TABLE_WIDTH/2 + MAIN_BEAM_WIDTH / 2, 0, MAIN_BEAM_HEIGHT - TABLE_THICKNESS/2])
    
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
    translate([-MAIN_BEAM_WIDTH/2 - CHASSIS_JOINT_THICKNESS, MAIN_BEAM_LENGTH/2 - Y_ROD_HOLDER_BEAM_OVERLAP / 2, 0 ])
    rotate([90, 0, 90]) cylinder(d = Y_ROD_DIAMETER, h = Y_ROD_LENGTH);
}

module y_rods()
{
    translate([0, 0, Y_ROD_FIX_X_OFFSET - CHASSIS_JOINT_THICKNESS]) {
        y_rod();
        mirror([0, 1, 0]) y_rod();
    }
}

module y_bearing_shaft_support()
{
    difference() {
        cube([PULLEY_BEARING_HOLE_DIAMETER + CHASSIS_JOINT_THICKNESS * 2, Y_ROD_HOLDER_BEAM_OVERLAP + CHASSIS_JOINT_THICKNESS , Y_SHAFT_Z_OFFSET]);
        translate([PULLEY_BEARING_OUTER_DIAMETER/2 + CHASSIS_JOINT_THICKNESS, 0, Y_SHAFT_Z_OFFSET - CHASSIS_JOINT_THICKNESS - (PULLEY_BEARING_HOLE_DIAMETER / 2) ]) rotate([-90, 0, 0]) {
            cylinder(d = PULLEY_BEARING_HOLE_DIAMETER, h = PULLEY_BEARING_THICKNESS);
            cylinder(d = PULLEY_BEARING_INNER_DIAMETER + PULLEY_BEARING_TOLERANCY * 2, h = NEMA_LENGTH/2);
        }
    }
}

module beam_nesting_section()
{
        /* Beam nesting section */
    translate ([0, -(Y_ROD_HOLDER_BEAM_OVERLAP + CHASSIS_JOINT_THICKNESS), 0])
        difference() {
            cube([MAIN_BEAM_HEIGHT + CHASSIS_JOINT_THICKNESS * 2, Y_ROD_HOLDER_BEAM_OVERLAP  + CHASSIS_JOINT_THICKNESS, MAIN_BEAM_WIDTH + CHASSIS_JOINT_THICKNESS * 2]);
            translate([CHASSIS_JOINT_THICKNESS, 0, CHASSIS_JOINT_THICKNESS]) cube([MAIN_BEAM_HEIGHT, Y_ROD_HOLDER_BEAM_OVERLAP, MAIN_BEAM_WIDTH]);
        }
    translate([Y_ROD_FIX_X_OFFSET, - CHASSIS_JOINT_THICKNESS - Y_ROD_HOLDER_BEAM_OVERLAP/2, Y_ROD_HOLDER_THICKNESS / 2]) cube([Y_ROD_HOLDER_BEAM_OVERLAP, Y_ROD_HOLDER_BEAM_OVERLAP, Y_ROD_HOLDER_THICKNESS], center = true);
}

module y_rod_holder()
{
        /* Beam nesting section part */
    difference() {
        beam_nesting_section();
        /* Y rod fix */
        translate([Y_ROD_FIX_X_OFFSET, - CHASSIS_JOINT_THICKNESS - Y_ROD_HOLDER_BEAM_OVERLAP / 2, Y_ROD_HOLDER_THICKNESS / 2]) {
            translate([0, 0, -Y_ROD_HOLDER_THICKNESS / 2]) cylinder(d = Y_ROD_DIAMETER + Y_ROD_TOLERANCY, h = Y_ROD_HOLDER_THICKNESS);
            rotate([0, 90, 90]) cylinder(d = Y_ROD_HOLDER_SCREW_HOLE_DIAMETER, h = Y_ROD_HOLDER_THICKNESS);
        }
    }
}

module pulley_holder_side()
{
    translate([PULLEY_HOLDER_THICKNESS, 0, 0]) cube([REAL_BEAM_HOLDER_WIDTH - PULLEY_HOLDER_THICKNESS, PULLEY_HOLDER_THICKNESS, PULLEY_HOLDER_BASE]);
    translate([REAL_BEAM_HOLDER_WIDTH, 0, PULLEY_HOLDER_BASE])  rotate([0, 0, 90]) prism(PULLEY_HOLDER_THICKNESS, REAL_BEAM_HOLDER_WIDTH - PULLEY_HOLDER_THICKNESS, PULLEY_HOLDER_HEIGHT - PULLEY_HOLDER_BASE);
}


module y_rod_holder_with_pulley()
{
    y_rod_holder();
    translate([0, -Y_ROD_HOLDER_BEAM_OVERLAP - CHASSIS_JOINT_THICKNESS, -REAL_BEAM_HOLDER_WIDTH - CHASSIS_JOINT_THICKNESS * 2]) rotate([0, 90, 0]) mirror([1, 0, 0]) y_bearing_shaft_support();
}

module y_rod_holder_lower()
{
    color("green") translate([MAIN_BEAM_WIDTH / 2 + CHASSIS_JOINT_THICKNESS, 0, -CHASSIS_JOINT_THICKNESS]) rotate([0, -90, 0]) {
        translate([0, MAIN_BEAM_LENGTH / 2 + CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder_with_pulley();
        mirror([0, 1, 0]) translate([0, MAIN_BEAM_LENGTH / 2 + CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder_with_pulley();
    }
    translate([0, 0, MAIN_BEAM_HEIGHT/2]) y_beam();
}


module y_rod_holder_upper()
{
    translate([ Y_ROD_LENGTH - MAIN_BEAM_WIDTH - 2 * CHASSIS_JOINT_THICKNESS , 0, 0]) mirror([1, 0, 0]) {
        color("green") translate([MAIN_BEAM_WIDTH / 2 + CHASSIS_JOINT_THICKNESS, 0, -CHASSIS_JOINT_THICKNESS]) rotate([0, -90, 0]) {
            translate([0, MAIN_BEAM_LENGTH / 2 + CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder();
            mirror([0, 1, 0]) translate([0, MAIN_BEAM_LENGTH / 2 + CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder();
        }
        /* Beam */
        translate([0, 0, MAIN_BEAM_HEIGHT/2]) y_beam();
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


module y_axis_transmission()
{
    color("LightBlue") translate([MAIN_BEAM_WIDTH/2 + CHASSIS_JOINT_THICKNESS * 2 + PULLEY_BEARING_HOLE_DIAMETER/2,  -Y_SHAFT_X_OVERHANG / 2, Y_SHAFT_Z_OFFSET - CHASSIS_JOINT_THICKNESS * 2 - PULLEY_BEARING_HOLE_DIAMETER / 2 ]) rotate([90, 0, 0]) cylinder(d = Y_SHAFT_DIAMETER, h = MAIN_BEAM_LENGTH + 2 * CHASSIS_JOINT_THICKNESS + Y_SHAFT_X_OVERHANG, center = true);
}


Y_LM8UU_SPACING = 10;

module y_bearing() 
{
    rotate([90, 0, 0]) {
    translate([0, 0, LM8UU_LENGTH + Y_LM8UU_SPACING]) cylinder(d = LM8UU_OUTER_DIAMETER, h = LM8UU_LENGTH);
    cylinder(d = LM8UU_OUTER_DIAMETER, h = LM8UU_LENGTH);
    }
}

y_bearing() ;
/*
y_nema_holder();
y_axis_transmission();
table();
y_rod_holder_lower();
y_rod_holder_upper();
y_rods();
*/