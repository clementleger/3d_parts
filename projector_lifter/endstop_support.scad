
use <../common/roundedcube.scad>;
use <../common/chamfers.scad>;

ENDSTOP_HEIGHT = 16;
HOLDER_THICKNESS = 4;
HOLDER_HEIGHT = ENDSTOP_HEIGHT;
ROD_WIDTH = 10.5;
ROD_HEIGHT = 12.5;

ROUNDING = 1.5;

NUT_DIAMETER = 6.4;

NUT_THICKNESS = 3;
BOLT_DIAMETER = 3;

SCREW_HEAD_DIAMETER = 6;
SCREW_HEAD_SIZE= 3;

SPLIT_SIZE = 1.3;

FULL_WIDTH = ROD_WIDTH + 2 * HOLDER_THICKNESS ;
FULL_HEIGHT = ROD_HEIGHT + 2 * HOLDER_THICKNESS + SCREW_HEAD_DIAMETER + 2;

ENDSTOP_WIDTH = 28;
ENDSTOP_HOLE_OFFSET = 3;
ENDSTOP_THICKNESS = 10;
ENDSTOP_HOLDER_EXTRA_LENGTH = 0;
ENDSTOP_HOLDER_LENGTH = ENDSTOP_HEIGHT + ENDSTOP_HOLDER_EXTRA_LENGTH;
ENDSTOP_HOLDER_THICKNESS = 4;
ENDSTOP_X_OFFSET = 4.5;


$fn = 20;

module screw_hole()
{
        translate([0, 0, ROD_HEIGHT + 2 * HOLDER_THICKNESS + BOLT_DIAMETER / 2]) rotate([0, 90, 0]) cylinder(d = BOLT_DIAMETER, h = ROD_WIDTH + 2 * HOLDER_THICKNESS);
    translate([0, 0, ROD_HEIGHT + 2 * HOLDER_THICKNESS + BOLT_DIAMETER / 2]) rotate([0, 90, 0]) cylinder(d = SCREW_HEAD_DIAMETER, h = SCREW_HEAD_SIZE);
   translate([ROD_WIDTH + 2 * HOLDER_THICKNESS - NUT_THICKNESS, 0, ROD_HEIGHT + 2 * HOLDER_THICKNESS + BOLT_DIAMETER / 2]) rotate([30, 0, 0])  rotate([180/6, 0, 0]) rotate([0, 90, 0]) cylinder(d = SCREW_HEAD_DIAMETER, h = NUT_THICKNESS, $fn = 6);
}

module endstop_holder() {
        difference() {
    translate([0, 0, ROUNDING])roundedcube([ENDSTOP_HOLDER_THICKNESS, HOLDER_HEIGHT, FULL_HEIGHT + ENDSTOP_WIDTH - ROUNDING], false, ROUNDING, "x");
             translate([0, 0, FULL_HEIGHT]) {
                translate([0, ENDSTOP_HEIGHT - ENDSTOP_HOLE_OFFSET, ENDSTOP_HOLE_OFFSET]) rotate([0, 90, 0])  #cylinder(d = BOLT_DIAMETER, h = ENDSTOP_HOLDER_THICKNESS);
                translate([0, ENDSTOP_HOLE_OFFSET, ENDSTOP_WIDTH - ENDSTOP_HOLE_OFFSET]) rotate([0, 90, 0]) # cylinder(d = BOLT_DIAMETER, h = ENDSTOP_HOLDER_THICKNESS);
             }
        }
}

module holder() {
    /* Main holder */
    difference() {
        union () {
            roundedcube([FULL_WIDTH, HOLDER_HEIGHT, FULL_HEIGHT], false, ROUNDING, "y");
            translate([ENDSTOP_X_OFFSET, 0, 0]) endstop_holder();
        }
       translate([(ROD_WIDTH + 2 * HOLDER_THICKNESS)/2 - ROD_WIDTH / 2, 0, HOLDER_THICKNESS]) cube([ROD_WIDTH, HOLDER_HEIGHT,ROD_HEIGHT]); 
        
        translate([-SPLIT_SIZE/2 + (ROD_WIDTH + 2 * HOLDER_THICKNESS) / 2, 0, HOLDER_THICKNESS]) cube([SPLIT_SIZE, HOLDER_HEIGHT,  ROD_HEIGHT +  HOLDER_THICKNESS  + SCREW_HEAD_DIAMETER + 2 ]);
        
        translate([0, HOLDER_HEIGHT / 2, 0]) screw_hole();
    }
}
 
holder();