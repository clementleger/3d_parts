use <../common/roundedcube.scad>;

ANGLE = 5;
SCREEN_THICKNESS = 29;
SUPPORT_THICKNESS = 5;
SCREEN_HEIGHT = 16 + SUPPORT_THICKNESS;
SUPPORT_HEIGHT = 20;
HOLE_COUNT = 3;
HOLE_DIAMETER = 2.9;
HOLE_SIDE_OFFSET = 6;
HOLE_SPACING = ((SCREEN_THICKNESS - HOLE_SIDE_OFFSET)/ HOLE_COUNT);
SMALL_HOLE_DIAMETER = 2.5;

FUZZY_FACTOR = 5;
$fn = 30;

rotate([ANGLE, 0, 0])
translate([0, 0, SUPPORT_THICKNESS])
rotate([0, -90, 0])
difference() {
    union () {
        roundedcube([SCREEN_HEIGHT, SUPPORT_THICKNESS, SUPPORT_HEIGHT], false, 1.75, "xmax");
        translate([0, SCREEN_THICKNESS + SUPPORT_THICKNESS, 0]) roundedcube([SCREEN_HEIGHT, SUPPORT_THICKNESS, SUPPORT_HEIGHT], false, 1.75, "xmax");



        translate([-SUPPORT_THICKNESS + FUZZY_FACTOR, 0, 0])
        difference() {
            union() {
                roundedcube([SUPPORT_THICKNESS, SCREEN_THICKNESS + 2 * SUPPORT_THICKNESS, SUPPORT_HEIGHT], false, 1.75, "x");
                rotate([0, 0, ANGLE]) roundedcube([SUPPORT_THICKNESS, SCREEN_THICKNESS + 2 * SUPPORT_THICKNESS, SUPPORT_HEIGHT], false, 1.75, "x");
            }
            
            /* holes */
            for(x=[0:HOLE_COUNT-1]) {
                translate([-SUPPORT_THICKNESS, HOLE_SIDE_OFFSET* 2 + HOLE_SPACING * x, SUPPORT_HEIGHT / 2]) 
                rotate([0, 90, 0]) #cylinder(d = HOLE_DIAMETER, h = SUPPORT_THICKNESS * 4);
            }
        }
    }
    translate([-SUPPORT_THICKNESS, SUPPORT_THICKNESS/2, SUPPORT_HEIGHT/2]) rotate([0, 90, 0]) cylinder(d = SMALL_HOLE_DIAMETER, h = SCREEN_HEIGHT);
    translate([-SUPPORT_THICKNESS, SUPPORT_THICKNESS/2 + SCREEN_THICKNESS + SUPPORT_THICKNESS, SUPPORT_HEIGHT/2]) rotate([0, 90, 0]) cylinder(d = SMALL_HOLE_DIAMETER, h = SCREEN_HEIGHT);
}