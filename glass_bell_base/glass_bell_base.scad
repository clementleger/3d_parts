include <../common/chamfered_screw_hole.scad>
include <../common/torus.scad>

GLASS_BELL_DIAMETER = 62;
GLASS_BELL_INNER_DIAMETER = 57.5;
BASE_HEIGHT = 8;
FLARED_SIZE = 8;
SIDE_THICKNESS = 8;
BORDER_THICKNESS = 2;




difference( ) {
color("green")   
    union() {
cylinder(d = GLASS_BELL_DIAMETER + FLARED_SIZE, h = BASE_HEIGHT, $fn = 100);
    
translate([0, 0, -BORDER_THICKNESS])
cylinder(d = GLASS_BELL_INNER_DIAMETER, h = BASE_HEIGHT + BORDER_THICKNESS, $fn = 100);
    }
    
color("blue")
translate([0, 0, -2])
cylinder(d = GLASS_BELL_DIAMETER - SIDE_THICKNESS, h = BASE_HEIGHT, $fn = 100);
    
rotate_extrude(convexity = 10, $fn = 100)
translate([GLASS_BELL_DIAMETER/2 + FLARED_SIZE, 0, 0])
circle(r = BASE_HEIGHT, $fn = 100);
}