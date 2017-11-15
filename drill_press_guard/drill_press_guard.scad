include <../common/roundedcube.scad>

MAIN_BASE_THICKNESS = 12;
SPLIT_WIDTH = 3.5;

INNER_DIAMETER = 55;
OUTER_DIAMETER = 90;

FIX_HEIGHT = 25 + (OUTER_DIAMETER-INNER_DIAMETER) / 2;
FIX_WIDTH = 12;

SPRING_PLATE_WIDTH = 12;
SPRING_PLATE_HEIGHT = 32;
SPRING_PLATE_THICKNESS = 3.5;

PIVOT_WIDTH = 16;
PIVOT_HEIGHT = 20;
PIVOT_THICKNESS = 9;

/* Main ring */
module main_ring() {
    difference() {
        cylinder(h = MAIN_BASE_THICKNESS, d = OUTER_DIAMETER, $fn = 100);
        cylinder(h = MAIN_BASE_THICKNESS, d = INNER_DIAMETER, $fn = 100);
        translate([OUTER_DIAMETER/2, 0, MAIN_BASE_THICKNESS/2]) cube([OUTER_DIAMETER/2, SPLIT_WIDTH, MAIN_BASE_THICKNESS], center = true);
    }
}

main_ring();

/* Tightnening  */
translate([INNER_DIAMETER/2 + FIX_HEIGHT/2, FIX_WIDTH/2 + SPLIT_WIDTH/2, MAIN_BASE_THICKNESS/2]) 
difference() {
    roundedcube([FIX_HEIGHT, FIX_WIDTH, MAIN_BASE_THICKNESS], center = true, radius = 1.6, apply_to = "z");
    translate([FIX_HEIGHT/2 - 10, 0, 0]) rotate([90, 0, 0]) cylinder(h = MAIN_BASE_THICKNESS, d = 4, center = true);
}

translate([INNER_DIAMETER/2 + FIX_HEIGHT/2, - (FIX_WIDTH/2 + SPLIT_WIDTH/2), MAIN_BASE_THICKNESS/2])
difference() {
    roundedcube([FIX_HEIGHT, FIX_WIDTH, MAIN_BASE_THICKNESS], center = true, radius = 1.6, apply_to = "z");
    translate([FIX_HEIGHT/2 - 10, 0, 0]) rotate([90, 0, 0]) cylinder(h = MAIN_BASE_THICKNESS, d = 4, center = true);
    /* Hex nuts */
    translate([FIX_HEIGHT/2 - 10, -(FIX_WIDTH/2 - 3.5/2), 0]) rotate([90, 0, 0]) cylinder(h = 4, d = 7, center = true, $fn = 6);
}

/* Spring base */
color("green")
translate([-OUTER_DIAMETER/2 + 2, 0, SPRING_PLATE_THICKNESS/2]) 
difference() {
    roundedcube([SPRING_PLATE_WIDTH, SPRING_PLATE_HEIGHT, SPRING_PLATE_THICKNESS], center = true, radius = 1, apply_to = "z");
    translate([-SPRING_PLATE_WIDTH/3, SPRING_PLATE_HEIGHT/2.3, 0]) cylinder(h = SPRING_PLATE_THICKNESS, d = 1.5, center = true);
    translate([-SPRING_PLATE_WIDTH/3, -SPRING_PLATE_HEIGHT/2.3, 0]) cylinder(h = SPRING_PLATE_THICKNESS, d = 1.5, center = true);
}

/* Pivot base */
translate([- OUTER_DIAMETER / 2 - 3, 0, PIVOT_HEIGHT / 2 + 1])
rotate([0, -30, 0])
difference() {
    union() {
        translate([0, 0, PIVOT_HEIGHT / 2])rotate([90, 0, 0]) cylinder(h = PIVOT_WIDTH, d = PIVOT_THICKNESS, center = true);
        cube([PIVOT_THICKNESS, PIVOT_WIDTH, PIVOT_HEIGHT], center = true);
    }
    translate([0, 0, PIVOT_HEIGHT / 2])rotate([90, 0, 0]) cylinder(h = PIVOT_WIDTH, d = PIVOT_THICKNESS / 2, center = true);
}