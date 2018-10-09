use <../common/roundedcube.scad>
use <../common/chamfered_screw_hole.scad>
use <../common/chamfers.scad>


THICKNESS = 9;
WIDTH = 30;
HOLE_DIAMETER = 8.1;

SCREW_PART_SIZE = 15;
SCREW_PART_HEIGHT = SCREW_PART_SIZE + THICKNESS ;
SCREW_PART_THICKNESS = 6;

HOLE_OFFSET = 40 / 2 + SCREW_PART_THICKNESS;
NUT_DIAMETER = 14.5;


SCREW_HEAD_SIZE = 2;
SCREW_HEAD_DIAMETER = 9;
SCREW_DIAMETER = 4;
SCREW_SIZE = 10;

SCREW_FULL_SIZE = SCREW_SIZE + SCREW_HEAD_SIZE;

ROUNDING = 2;
SMALL_CHAMFER_WIDTH = SCREW_PART_SIZE - ROUNDING;
LARGE_CHAMFER_WIDTH = SMALL_CHAMFER_WIDTH;
$fn = 70;
BEARING_THICKNESS = 10;


/* Large side screw */
module side_pulley() {
    difference() {
        union () {
                cube([THICKNESS , WIDTH,  HOLE_OFFSET]);
             translate([0,  WIDTH / 2, HOLE_OFFSET]) rotate ([0, 90, 0]) cylinder(d = WIDTH, h = THICKNESS);
        }
           translate([0, WIDTH / 2, HOLE_OFFSET]) rotate ([0, 90, 0]) union () {
                translate([0, 0, -2]) cylinder(d = HOLE_DIAMETER, h = THICKNESS + 2); 
           }
    }

    difference() {
        union(){
        translate ([THICKNESS + LARGE_CHAMFER_WIDTH, 0, SCREW_PART_THICKNESS]) rotate([0, 0, 90])chamfer(WIDTH, LARGE_CHAMFER_WIDTH, THICKNESS, $fn = 100);
           roundedcube([SCREW_PART_HEIGHT, WIDTH, SCREW_PART_THICKNESS], false , 2, "z");
        }
           
        translate([SCREW_PART_HEIGHT - SCREW_PART_SIZE / 2, WIDTH / 2, -SCREW_FULL_SIZE + SCREW_PART_THICKNESS ]) #chamfered_screw_hole(SCREW_DIAMETER, SCREW_SIZE, SCREW_HEAD_DIAMETER, SCREW_HEAD_SIZE, 10, $fn = 100);
    }
}

translate([BEARING_THICKNESS/2, 0, 0]) side_pulley();
translate([- BEARING_THICKNESS/2, 0, 0]) mirror([1, 0, 0]) side_pulley();

translate([-BEARING_THICKNESS/2, 0, 0]) cube([BEARING_THICKNESS, WIDTH, SCREW_PART_THICKNESS]);