
use <../common/roundedcube.scad>;
use <../common/chamfers.scad>;

HOLDER_THICKNESS = 3;
HOLDER_HEIGHT = 8;
ROD_WIDTH = 10.5;
ROD_HEIGHT = 12.5;

ROUNDING = 1.5;

NUT_PART_THICKNESS = 10;
NUT_PART_HEIGHT =  8;

NUT_DIAMETER = 6.5;
NUT_SIZE = 3;
NUT_DEPTH = 4;
NUT_HEAD_DIAMETER = 6;
NUT_HEAD_THICKNESS = 4;
BOLT_DIAMETER = 3.2;

BUSHING_DEPTH = 1;
BUSHING_WIDTH_COUNT = 3;
BUSHING_HEIGHT_COUNT= 4;
/* Main holder */
SPLIT_WIDTH = 2.5;

difference() {
        roundedcube([ROD_WIDTH + 2 * HOLDER_THICKNESS, HOLDER_HEIGHT, ROD_HEIGHT + 2 * HOLDER_THICKNESS + NUT_SIZE + HOLDER_THICKNESS], false, ROUNDING, "y");

       translate([(ROD_WIDTH + 2 * HOLDER_THICKNESS)/2 - ROD_WIDTH / 2, 0, HOLDER_THICKNESS]) cube([ROD_WIDTH, HOLDER_HEIGHT,ROD_HEIGHT]); 
        
    translate([(ROD_WIDTH + 2 * HOLDER_THICKNESS)/2 - SPLIT_WIDTH / 2, 0, ROD_HEIGHT + HOLDER_THICKNESS]) #cube([SPLIT_WIDTH, HOLDER_HEIGHT, ROD_HEIGHT]); 
    
    translate([0, 0, HOLDER_THICKNESS + ROD_HEIGHT]) {
        union() {
           translate([ROD_WIDTH + 2 * HOLDER_THICKNESS - NUT_DEPTH, HOLDER_HEIGHT / 2, HOLDER_THICKNESS + NUT_SIZE/ 2])  rotate([0, 90,  0])  rotate([0, 0, 30]) #cylinder(d = NUT_DIAMETER, h = NUT_DEPTH, $fn = 6);
            
           translate([0, HOLDER_HEIGHT / 2, HOLDER_THICKNESS + NUT_SIZE/ 2])  rotate([0, 90,  0])  rotate([0, 0, 30]) #cylinder(d = BOLT_DIAMETER, h = ROD_WIDTH + 2 * HOLDER_THICKNESS, $fn = 40);
            
           translate([0, HOLDER_HEIGHT / 2, HOLDER_THICKNESS + NUT_SIZE/ 2])  rotate([0, 90,  0])  rotate([0, 0, 30]) #cylinder(d = NUT_HEAD_DIAMETER, h = NUT_HEAD_THICKNESS, $fn = 40);
        }
     }
 }
 
 