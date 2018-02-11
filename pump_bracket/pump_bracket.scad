PUMP_DIAMETER = 45;

BRACKET_THICKNESS =  3;

BRACKET_WIDTH = 40;

OPENING_WIDTH = 3;

BASE_WIDTH = 20;
BASE_SPACING = 60;
BASE_OFFSET = 10;

SCREW_DIAMETER = 4;

SCREW_HEAD_DIAMETER = 8;
SCREW_HEAD_THICKNESS = 2;

SCREW_OFFSET_FROM_SIDE = 7;

BASE_THICKNESS = 5;

/* Tightening part */
TIGHTENING_PART_THICKNESS = 6;
TIGHTENING_PART_SIZE = 10;
TIGHTENING_SCREW_DIAMETER =3;
TIGHTENING_SCREW_HEAD_DIAMETER =5;
TIGHTENING_SCREW_OFFSET =5;

$fn = 100;

/* Derived from other constants */
OUTER_DIAMETER = (PUMP_DIAMETER + BRACKET_THICKNESS * 2) ;
BASE_HEIGHT = OUTER_DIAMETER / 2 + BASE_OFFSET;
module base_bracket() {
        difference() {
            cube([BRACKET_WIDTH, BASE_SPACING, BASE_THICKNESS], center = true);
            for(x=[-1,1], y = [-1,1]) {
                translate([x * (BRACKET_WIDTH/2 - SCREW_OFFSET_FROM_SIDE), y * (BASE_SPACING/2 - SCREW_OFFSET_FROM_SIDE), 0]) {
                    /* Hole */
                    cylinder(d = SCREW_DIAMETER, h = BASE_THICKNESS, center = true);
                    /* Head */
                    translate([0, 0, BASE_THICKNESS/2]) cylinder(d1 = SCREW_DIAMETER, d2 = SCREW_HEAD_DIAMETER , h = SCREW_HEAD_THICKNESS, center = true);
                }
            }
        }
}

module pump_bracket() {
    difference () {
        union () {
            cylinder(d= PUMP_DIAMETER + BRACKET_THICKNESS * 2, h = BRACKET_WIDTH, center = true);
            translate([-BASE_HEIGHT/2, 0, 0]) cube([BASE_HEIGHT, BASE_WIDTH, BRACKET_WIDTH], center = true);
        }
        cylinder(d= PUMP_DIAMETER, h = BRACKET_WIDTH, center = true);
    translate([OUTER_DIAMETER/2, 0, 0]) cube([OUTER_DIAMETER/2, OPENING_WIDTH, BRACKET_WIDTH], center = true);
    }
    translate([-BASE_HEIGHT - BASE_THICKNESS/2, 0, 0]) rotate([0, 90, 0]) base_bracket();
}


SCREW_PART_FULL_THICKNESS = TIGHTENING_PART_THICKNESS * 2 + OPENING_WIDTH;
TIGHTENING_PART_WIDTH = OUTER_DIAMETER / 2 + TIGHTENING_PART_SIZE;
module tightening_part() {
    translate([(TIGHTENING_PART_WIDTH)/2, 0, 0]) 
    difference() {
        cube([TIGHTENING_PART_WIDTH, SCREW_PART_FULL_THICKNESS, BRACKET_WIDTH], center = true);
        cube([TIGHTENING_PART_WIDTH, OPENING_WIDTH, BRACKET_WIDTH], center = true);
        for(x=[-1,1]) {
            translate([TIGHTENING_PART_WIDTH / 2 - TIGHTENING_SCREW_OFFSET, 0, x * (BRACKET_WIDTH / 2 - SCREW_OFFSET_FROM_SIDE)]) {
                   rotate([90, 0, 0]) cylinder(d = TIGHTENING_SCREW_DIAMETER, h = SCREW_PART_FULL_THICKNESS, center = true);
                
            }
        }
    }
}
difference() {
    union() {
        tightening_part();
        pump_bracket();
    }
     cylinder(d= PUMP_DIAMETER, h = BRACKET_WIDTH, center = true);
}