include <../common/roundedcube.scad>
include <../common/prism.scad>

Y_ROD_DIAMETER = 8;
Y_ROD_LENGTH = 500;

X_ROD_DIAMETER = 8;
X_ROD_LENGTH = 350;


/* Thickness of joint at angle of chassis (were Y rod are attached) */
CHASSIS_JOINT_THICKNESS = 2;

/* Start and end beam width */
MAIN_BEAM_WIDTH = 18;
/* Start and end beam height */
MAIN_BEAM_HEIGHT = 70;

/* Table MDF thickness */
TABLE_THICKNESS = 16;

ROD_Y_OFFSET_FROM_BEAM = 15;

Y_ROD_TOLERANCY = 0.4;
Y_ROD_HOLDER_OPENING_THICKNESS = 1.5;
Y_ROD_HOLDER_BEAM_OVERLAP = 20;
Y_ROD_HOLDER_SCREW_HOLE_DIAMETER = 3;

/* Only useful for table preview */
TABLE_HOLE_X_COUNT = 7;
TABLE_HOLE_Y_COUNT = 5;
TABLE_HOLE_DIAMETER = 8;
TABLE_HOLE_START_OFFSET = 40;

/* Pulley Bearing size */
PULLEY_BEARING_THICKNESS = 7;
PULLEY_BEARING_OUTER_DIAMETER = 22;
PULLEY_HOLDER_THICKNESS = 3;
PULLEY_BELT_THICKNESS = 2;
PULLEY_TENSIONNER_HOLE_DIAMETER = 4;
PULLEY_TENSIONNER_TOLERANCY = 0.4;

/*******************/
/* Generated Stuff */
/*******************/

MAIN_BEAM_LENGTH = X_ROD_LENGTH;

/* Y Rod holder */
ROD_X_OFFSET_FROM_BEAM = MAIN_BEAM_HEIGHT/3 * 2;
Y_ROD_HOLDER_DIAMETER = Y_ROD_DIAMETER + 2 * 5;
Y_ROD_FIX_X_OFFSET = ROD_X_OFFSET_FROM_BEAM + CHASSIS_JOINT_THICKNESS;
Y_ROD_HOLDER_THICKNESS = MAIN_BEAM_WIDTH; 

/* Table */
TABLE_WIDTH = Y_ROD_LENGTH - 2 * Y_ROD_HOLDER_THICKNESS + 2 * CHASSIS_JOINT_THICKNESS;
TABLE_HEIGHT = X_ROD_LENGTH;
TABLE_HOLE_X_SPACING = (TABLE_WIDTH - 2 * TABLE_HOLE_START_OFFSET) / (TABLE_HOLE_X_COUNT - 1);
TABLE_HOLE_Y_SPACING = (TABLE_HEIGHT - 2 * TABLE_HOLE_START_OFFSET) / (TABLE_HOLE_Y_COUNT - 1);

REAL_BEAM_HOLDER_WIDTH = MAIN_BEAM_WIDTH + 2 * CHASSIS_JOINT_THICKNESS;
REAL_BEAM_HOLDER_HEIGHT = MAIN_BEAM_HEIGHT + 2 * CHASSIS_JOINT_THICKNESS;
PULLEY_HOLDER_BASE = 10;
PULLEY_HOLDER_HEIGHT = PULLEY_BEARING_OUTER_DIAMETER + PULLEY_BELT_THICKNESS * 2;
PULLEY_TENSIONNER_FULL_THICKNESS = PULLEY_BEARING_THICKNESS + 2 * 2;
PULLEY_HOLDER_WIDTH = PULLEY_HOLDER_THICKNESS * 2 + PULLEY_TENSIONNER_FULL_THICKNESS + PULLEY_TENSIONNER_TOLERANCY;

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
    translate([- MAIN_BEAM_WIDTH/2 + CHASSIS_JOINT_THICKNESS, MAIN_BEAM_LENGTH/2 + ROD_Y_OFFSET_FROM_BEAM, 0 ])
    rotate([90, 0, 90]) cylinder(d = Y_ROD_DIAMETER, h = Y_ROD_LENGTH);
}

module y_rods()
{
    translate([0, 0, ROD_X_OFFSET_FROM_BEAM]) {
        y_rod();
        mirror([0, 1, 0]) y_rod();
    }
}


module beam_nesting_section()
{
        /* Beam nesting section */
    translate ([0, -(Y_ROD_HOLDER_BEAM_OVERLAP + CHASSIS_JOINT_THICKNESS), 0])
        difference() {
            cube([MAIN_BEAM_HEIGHT + CHASSIS_JOINT_THICKNESS * 2, Y_ROD_HOLDER_BEAM_OVERLAP  + CHASSIS_JOINT_THICKNESS, Y_ROD_HOLDER_THICKNESS + CHASSIS_JOINT_THICKNESS * 2]);
            translate([CHASSIS_JOINT_THICKNESS, 0, CHASSIS_JOINT_THICKNESS]) cube([MAIN_BEAM_HEIGHT, Y_ROD_HOLDER_BEAM_OVERLAP, Y_ROD_HOLDER_THICKNESS]);
        }
}

module y_rod_holder_hole()
{
            difference() {
            cylinder(d = Y_ROD_HOLDER_DIAMETER, h = Y_ROD_HOLDER_THICKNESS);
            cylinder(d = Y_ROD_DIAMETER + Y_ROD_TOLERANCY, h = Y_ROD_HOLDER_THICKNESS);
            translate([0, 0, Y_ROD_HOLDER_THICKNESS / 2 ]) rotate([0, 90, 45]) cylinder(d = Y_ROD_HOLDER_SCREW_HOLE_DIAMETER, h = Y_ROD_HOLDER_DIAMETER/2);

            translate([0, 0, Y_ROD_HOLDER_THICKNESS / 2 ]) rotate([0, 90, 135]) cylinder(d = Y_ROD_HOLDER_SCREW_HOLE_DIAMETER, h = Y_ROD_HOLDER_DIAMETER/2);
        }
}

module y_rod_holder()
{
    /* Y rod fix */
    translate([Y_ROD_FIX_X_OFFSET, ROD_Y_OFFSET_FROM_BEAM - CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder_hole();
    translate([Y_ROD_FIX_X_OFFSET - Y_ROD_DIAMETER/2, 0, 0])
        cube([Y_ROD_DIAMETER, ROD_Y_OFFSET_FROM_BEAM - Y_ROD_DIAMETER/2 - CHASSIS_JOINT_THICKNESS, Y_ROD_HOLDER_THICKNESS]);
    
    /* Curved lower support */
    difference() {
        cube([Y_ROD_FIX_X_OFFSET - Y_ROD_DIAMETER/2, ROD_Y_OFFSET_FROM_BEAM, Y_ROD_HOLDER_THICKNESS]);
        translate([0, ROD_Y_OFFSET_FROM_BEAM, 0]) 
        resize([(Y_ROD_FIX_X_OFFSET - Y_ROD_HOLDER_DIAMETER/2) * 2, ROD_Y_OFFSET_FROM_BEAM * 2, Y_ROD_HOLDER_THICKNESS]) cylinder();
    };
 
    UPPER_CURVE_X_OFFSET = MAIN_BEAM_HEIGHT - Y_ROD_FIX_X_OFFSET - Y_ROD_DIAMETER/2 + 2 * CHASSIS_JOINT_THICKNESS;
     /* Curved upper support */
     translate([Y_ROD_FIX_X_OFFSET + Y_ROD_DIAMETER/2, 0, 0]) color("blue") difference() {
        cube([UPPER_CURVE_X_OFFSET, ROD_Y_OFFSET_FROM_BEAM, Y_ROD_HOLDER_THICKNESS]);
      translate([UPPER_CURVE_X_OFFSET, ROD_Y_OFFSET_FROM_BEAM, 0]) 
      resize([(UPPER_CURVE_X_OFFSET) * 2 - Y_ROD_HOLDER_DIAMETER / 2, ROD_Y_OFFSET_FROM_BEAM * 2, Y_ROD_HOLDER_THICKNESS]) cylinder();
    };
    
    beam_nesting_section();
}

module pulley_holder_side()
{
    translate([PULLEY_HOLDER_THICKNESS, 0, 0]) cube([REAL_BEAM_HOLDER_WIDTH - PULLEY_HOLDER_THICKNESS, PULLEY_HOLDER_THICKNESS, PULLEY_HOLDER_BASE]);
    translate([REAL_BEAM_HOLDER_WIDTH, 0, PULLEY_HOLDER_BASE])  rotate([0, 0, 90]) prism(PULLEY_HOLDER_THICKNESS, REAL_BEAM_HOLDER_WIDTH - PULLEY_HOLDER_THICKNESS, PULLEY_HOLDER_HEIGHT - PULLEY_HOLDER_BASE);
}

module pulley_tensionner_holder()
{   
    difference() {
        cube([PULLEY_HOLDER_THICKNESS, PULLEY_HOLDER_WIDTH, PULLEY_HOLDER_HEIGHT]);
        translate([0, PULLEY_HOLDER_WIDTH / 2, PULLEY_HOLDER_HEIGHT / 2]) rotate([0, 90, 0]) cylinder(d = PULLEY_TENSIONNER_HOLE_DIAMETER, h = PULLEY_HOLDER_THICKNESS);
    }
    /* Side */
    pulley_holder_side();
    translate([0, PULLEY_HOLDER_WIDTH - PULLEY_HOLDER_THICKNESS, 0]) pulley_holder_side();
}
module y_rod_holder_with_pulley()
{
    y_rod_holder();
    translate([REAL_BEAM_HOLDER_HEIGHT, -PULLEY_HOLDER_WIDTH, REAL_BEAM_HOLDER_WIDTH]) rotate([0, 90, 0]) pulley_tensionner_holder();
}

module y_rod_holder_lower()
{
    color("green") translate([MAIN_BEAM_WIDTH / 2 + CHASSIS_JOINT_THICKNESS, 0, -CHASSIS_JOINT_THICKNESS]) rotate([0, -90, 0]) {
        translate([0, MAIN_BEAM_LENGTH / 2 + CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder_with_pulley();
        mirror([0, 1, 0]) translate([0, MAIN_BEAM_LENGTH / 2 + CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder_with_pulley();
    }
}


module y_rod_holder_upper()
{
    translate([ 2 * CHASSIS_JOINT_THICKNESS + Y_ROD_LENGTH - MAIN_BEAM_WIDTH, 0, 0]) mirror([1, 0, 0]) {
        color("green") translate([MAIN_BEAM_WIDTH / 2 + CHASSIS_JOINT_THICKNESS, 0, -CHASSIS_JOINT_THICKNESS]) rotate([0, -90, 0]) {
            translate([0, MAIN_BEAM_LENGTH / 2 + CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder();
            mirror([0, 1, 0]) translate([0, MAIN_BEAM_LENGTH / 2 + CHASSIS_JOINT_THICKNESS, 0]) y_rod_holder();
        }
    }
}

//y_rod_holder_with_pulley();



table();
y_rod_holder_lower();
y_rod_holder_upper();
y_beams();
y_rods();


