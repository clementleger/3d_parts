
use <../common/roundedcube.scad>;
use <../common/chamfers.scad>;

HOLDER_THICKNESS = 4;
HOLDER_HEIGHT = 25;
ROD_WIDTH = 10.5;
ROD_HEIGHT = 12.5;

ROUNDING = 1.5;

NUT_DIAMETER = 6.4;

NUT_THICKNESS = 3;
BOLT_DIAMETER = 3;

SCREW_HEAD_DIAMETER = 6;
SCREW_HEAD_SIZE= 3;

SPLIT_SIZE = 1.3;


$fn = 20;

module screw_hole()
{
        translate([0, 0, ROD_HEIGHT + 2 * HOLDER_THICKNESS + BOLT_DIAMETER / 2]) rotate([0, 90, 0]) cylinder(d = BOLT_DIAMETER, h = ROD_WIDTH + 2 * HOLDER_THICKNESS);
    translate([0, 0, ROD_HEIGHT + 2 * HOLDER_THICKNESS + BOLT_DIAMETER / 2]) rotate([0, 90, 0]) cylinder(d = SCREW_HEAD_DIAMETER, h = SCREW_HEAD_SIZE);
   translate([ROD_WIDTH + 2 * HOLDER_THICKNESS - NUT_THICKNESS, 0, ROD_HEIGHT + 2 * HOLDER_THICKNESS + BOLT_DIAMETER / 2]) rotate([30, 0, 0])  rotate([180/6, 0, 0]) rotate([0, 90, 0]) cylinder(d = SCREW_HEAD_DIAMETER, h = NUT_THICKNESS, $fn = 6);
}

/* Main holder */
difference() {
    roundedcube([ROD_WIDTH + 2 * HOLDER_THICKNESS, HOLDER_HEIGHT, ROD_HEIGHT + 2 * HOLDER_THICKNESS + SCREW_HEAD_DIAMETER + 2], false, ROUNDING, "y");

   translate([(ROD_WIDTH + 2 * HOLDER_THICKNESS)/2 - ROD_WIDTH / 2, 0, HOLDER_THICKNESS]) cube([ROD_WIDTH, HOLDER_HEIGHT,ROD_HEIGHT]); 
    
    translate([-SPLIT_SIZE/2 + (ROD_WIDTH + 2 * HOLDER_THICKNESS) / 2, 0, HOLDER_THICKNESS]) cube([SPLIT_SIZE, HOLDER_HEIGHT,  ROD_HEIGHT +  HOLDER_THICKNESS  + SCREW_HEAD_DIAMETER + 2 ]);
    
    translate([0, HOLDER_HEIGHT / 4, 0]) screw_hole();
    translate([0, HOLDER_HEIGHT / 4 * 3, 0]) screw_hole();
}
 