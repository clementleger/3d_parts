include <../common/chamfered_screw_hole.scad>
include <../common/torus.scad>

GLASS_BELL_DIAMETER = 30;
BASE_HEIGHT = 20;
FLARED_SIZE = 12;
SIDE_THICKNESS = 8;
BORDER_THICKNESS = 2;



difference () {
union () {
    difference() {
    cylinder(d = GLASS_BELL_DIAMETER + FLARED_SIZE, h = BASE_HEIGHT, $fn = 100);

    rotate_extrude(convexity = 10, $fn = 100)
    translate([GLASS_BELL_DIAMETER/2 + FLARED_SIZE, 0, 0])
    circle(r = BASE_HEIGHT, $fn = 100);
    }
}

cylinder(d = 8, h = BASE_HEIGHT - 5);
}