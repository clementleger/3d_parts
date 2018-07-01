include <../common/roundedcube.scad>;

HOLE_OFFSET = 70;
OVERLAPPING_LENGTH = 50;
THICKNESS = 3;
LOCK_HEIGHT = 8;
LOCK_WIDTH = 17;
EXTENDER_LENGTH  = HOLE_OFFSET + OVERLAPPING_LENGTH;

HOLE_WIDTH = 6;
HOLE_HEIGHT = 12;
HOLE_COUNT = 6;

difference() {

roundedcube([LOCK_WIDTH + 2 * THICKNESS, EXTENDER_LENGTH, LOCK_HEIGHT + 2 * THICKNESS], center = true, radius = 1.5);

translate([0, OVERLAPPING_LENGTH/2 + THICKNESS, (LOCK_HEIGHT + 2 * THICKNESS) / 2 - THICKNESS / 2]) cube([LOCK_WIDTH + 2 * THICKNESS, HOLE_OFFSET, THICKNESS], center = true);
    
translate([0, -EXTENDER_LENGTH / 2 + OVERLAPPING_LENGTH/2, 0]) color ("green") cube([LOCK_WIDTH, OVERLAPPING_LENGTH, LOCK_HEIGHT], center = true);
    
     translate([0, EXTENDER_LENGTH / 2 - HOLE_HEIGHT / 2 - THICKNESS , 0]) cube ([HOLE_WIDTH, 
HOLE_HEIGHT, LOCK_HEIGHT + 2 * THICKNESS], center = true);
 
    for (i=[0:HOLE_COUNT - 1])
        translate([0, - EXTENDER_LENGTH / 2 + THICKNESS + OVERLAPPING_LENGTH/ HOLE_COUNT * i, 0]) cylinder(d = 4, h = LOCK_HEIGHT + 2 * THICKNESS, center = true);
}