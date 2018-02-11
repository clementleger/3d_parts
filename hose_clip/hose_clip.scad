// Tutor diameter
HOSE_DIAMETER = 14; // [4:30]
// Thickness of the cylinders 
HOOK_THICKNESS = 2; // [1:10]
// Thickness of the hook
THICKNESS = 10; // [2:20]

BASE_WIDTH = 10;
BASE_THICKNESS = 5;

SCREW_DIAMETER = 3.5;

SCREW_HEAD_SIZE = 6;
SCREW_THICKNESS = 1;

$fn = 50;
TOTAL_BASE_SIZE = BASE_THICKNESS + HOSE_DIAMETER / 2;
difference() {
    union () {
        cylinder(h = THICKNESS, d = HOSE_DIAMETER + 2 * HOOK_THICKNESS, center = true);
        translate([-TOTAL_BASE_SIZE/ 2, 0, 0]) color("green") cube([TOTAL_BASE_SIZE, BASE_WIDTH, THICKNESS], center = true);
    }
    cylinder(h = THICKNESS, d = HOSE_DIAMETER, center = true);
    translate([HOSE_DIAMETER/1.5, 0, 0]) cylinder(h = THICKNESS, d = HOSE_DIAMETER, center = true);
    rotate([0, -90, 0]) cylinder(d = SCREW_DIAMETER, h = TOTAL_BASE_SIZE);
translate([-HOSE_DIAMETER / 2 + SCREW_THICKNESS / 2, 0, 0]) rotate([0, -90, 0]) cylinder(d1 = SCREW_HEAD_SIZE, d2 = SCREW_DIAMETER, h = SCREW_THICKNESS * 2);
}

