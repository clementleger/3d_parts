use <../common/roundedcube.scad>
use <../common/chamfered_screw_hole.scad>
use <../common/chamfers.scad>

$fn = 50;

WOOD_WIDTH = 30;
HOLE_DEPTH = 50;
HOLE_WIDTH = 40;
HOLE_HEIGHT = 80;
THICKNESS = 10;
SIDE_THICKNESS = 5;
SPACE_BETWEEN_HOLE = 20;
SPACE_BETWEEN_SIDES = 40;


ATTACH_WIDTH = 15;
HOLE_DIAMETER = 8;

HOLDER_WIDTH = HOLE_DIAMETER + 2 * SIDE_THICKNESS;
HOLDER_HEIGHT = SPACE_BETWEEN_HOLE + 2 * HOLE_DIAMETER + 2 * SIDE_THICKNESS;



module side_holder() {
        hull() {
        translate([-10, -10, HOLE_DEPTH]) roundedcube([HOLE_HEIGHT + 20, HOLE_WIDTH + 20, 5], false , 2, "z");
    
        roundedcube([HOLE_HEIGHT, HOLE_WIDTH, THICKNESS], false , 2, "z");
        }

}

module dots () {
        translate([HOLE_HEIGHT/2 - (SPACE_BETWEEN_HOLE + HOLE_DIAMETER) / 2, HOLE_WIDTH / 2, 0]) {
            translate([0, 0, -THICKNESS]) cylinder(d = HOLE_DIAMETER, h = THICKNESS);
            translate([HOLE_DIAMETER + SPACE_BETWEEN_HOLE, 0, -THICKNESS]) cylinder(d = HOLE_DIAMETER, h = THICKNESS);

    }
}

dots ();
translate([0, SPACE_BETWEEN_SIDES + WOOD_WIDTH, 0]) dots ();
translate([0, (SPACE_BETWEEN_SIDES + WOOD_WIDTH)/2, 0]) dots ();
hull () {
    side_holder();
    translate([0, SPACE_BETWEEN_SIDES + WOOD_WIDTH, 0]) side_holder();
}