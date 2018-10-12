use <../common/roundedcube.scad>
use <../common/chamfered_screw_hole.scad>
use <../common/chamfers.scad>

WOOD_WIDTH = 30;
THICKNESS = 5;
SIDE_THICKNESS = 5;
SPACE_BETWEEN_HOLE = 20;
SPACE_BETWEEN_SIDES = 40;


ATTACH_WIDTH = 15;
HOLE_DIAMETER = 10.1;

HOLDER_WIDTH = HOLE_DIAMETER + 2 * SIDE_THICKNESS;
HOLDER_HEIGHT = SPACE_BETWEEN_HOLE + 2 * HOLE_DIAMETER + 2 * SIDE_THICKNESS;


module side_holder() {
    difference() {
        roundedcube([HOLDER_HEIGHT, HOLE_DIAMETER + 2 * SIDE_THICKNESS, THICKNESS], false , 2, "z");

        translate([HOLE_DIAMETER, HOLE_DIAMETER, 0]) cylinder(d = HOLE_DIAMETER, h = THICKNESS);
        translate([HOLE_DIAMETER * 2 + SPACE_BETWEEN_HOLE, HOLE_DIAMETER, 0]) cylinder(d = HOLE_DIAMETER, h = THICKNESS);
    }
}

side_holder();
translate([0, SPACE_BETWEEN_SIDES + WOOD_WIDTH, 0]) side_holder();


translate([HOLDER_HEIGHT/2 - ATTACH_WIDTH / 2, HOLDER_WIDTH, 0]) cube([ATTACH_WIDTH, SPACE_BETWEEN_SIDES + WOOD_WIDTH - HOLDER_WIDTH, THICKNESS]);