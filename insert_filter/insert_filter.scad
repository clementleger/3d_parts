import("universal_filament_filter.stl", convexity=3);

FILTER_WIDTH = 16;
PLATE_HEIGHT = 3;
PLATE_WIDTH = FILTER_WIDTH * 1.8;
PLATE_SCREW_DIAMETER = 4;
CHAMFER_HEIGHT = 1.5;
CHAMFER_SIZE = PLATE_SCREW_DIAMETER + 4;

$fn=80;

translate([0, 0, 8.5]) {
    difference() {
        union () {
            cube([PLATE_WIDTH, FILTER_WIDTH, PLATE_HEIGHT], center = true);
            translate([-PLATE_WIDTH/2, 0, 0]) cylinder(h = PLATE_HEIGHT, d = FILTER_WIDTH, center = true);
            translate([PLATE_WIDTH/2, 0, 0]) cylinder(h = PLATE_HEIGHT, d = FILTER_WIDTH, center = true);
        }
        translate([-PLATE_WIDTH/2, 0, -CHAMFER_HEIGHT / 2]) cylinder(h = CHAMFER_HEIGHT, d1 = CHAMFER_SIZE, d2 = PLATE_SCREW_DIAMETER, center = true);
        translate([-PLATE_WIDTH/2, 0, 0]) cylinder(h = PLATE_HEIGHT, d = PLATE_SCREW_DIAMETER, center = true);
        
        translate([PLATE_WIDTH/2, 0, -CHAMFER_HEIGHT / 2]) cylinder(h = CHAMFER_HEIGHT, d1 = CHAMFER_SIZE, d2 = PLATE_SCREW_DIAMETER, center = true);
        translate([PLATE_WIDTH/2, 0, 0]) cylinder(h = PLATE_HEIGHT, d = PLATE_SCREW_DIAMETER, center = true);
        cylinder(h = 3, d = PLATE_SCREW_DIAMETER, center = true);
    }
}