use <../common/roundedcube.scad>
use <../common/chamfered_screw_hole.scad>
use <../common/chamfers.scad>


HOLE_DEPTH = 30;
HOLE_WIDTH = 40;
HOLE_HEIGHT = 80;
THICKNESS = 5;
SIDE_THICKNESS = 5;
SPACE_BETWEEN_HOLE = 20;
SPACE_BETWEEN_SIDES = 40;


ATTACH_WIDTH = 15;
HOLE_DIAMETER = 8;

HOLDER_WIDTH = HOLE_DIAMETER + 2 * SIDE_THICKNESS;
HOLDER_HEIGHT = SPACE_BETWEEN_HOLE + 2 * HOLE_DIAMETER + 2 * SIDE_THICKNESS;


module side_holder() {
        hull() {
        translate([-5, -5, HOLE_DEPTH]) roundedcube([HOLE_HEIGHT + 10, HOLE_WIDTH + 10, 5], false , 2, "z");
    
        roundedcube([HOLE_HEIGHT, HOLE_WIDTH, THICKNESS], false , 2, "z");
        }
        translate([HOLE_HEIGHT/2 - (SPACE_BETWEEN_HOLE + HOLE_DIAMETER) / 2, HOLE_WIDTH / 2, 0]) {
            translate([0, 0, -THICKNESS]) cylinder(d = HOLE_DIAMETER, h = THICKNESS);
            translate([HOLE_DIAMETER + SPACE_BETWEEN_HOLE, 0, -THICKNESS]) cylinder(d = HOLE_DIAMETER, h = THICKNESS);

    }
}

side_holder();
