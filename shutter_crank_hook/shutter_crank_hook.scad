include <../common/chamfered_screw_hole.scad>
include <../common/roundedcube.scad>

// Crank Diameter
CRANK_DIAMETER = 14.3; // [4:40]
HOOK_CRANK_THICKNESS = 4;
// Mounting Base Width
HOOK_FIX_PLATE_WIDTH = 60; // [40:200]
// Mounting Base Height
HOOK_FIX_PLATE_HEIGHT = 20; // [10:200]
// Mounting Base Thickness
HOOK_FIX_PLATE_THICKNESS = 5; // [40:200]
// Neck Length
HOOK_NECK_LENGTH = 20; // [10:200]
HOOK_NECK_WIDTH = HOOK_FIX_PLATE_HEIGHT/2;
HOOK_NECK_HEIGHT = HOOK_NECK_LENGTH / 3 * 2;

SCREW_HEAD_DIAMETER = 8;
SCREW_HEAD_LENGTH = 2;
SCREW_DIAMETER = 4;
SCREW_LENGTH = HOOK_FIX_PLATE_THICKNESS - SCREW_HEAD_LENGTH;

$fn = 40;

module crank_hook()
{
    difference() {
        cylinder(h = HOOK_NECK_HEIGHT, d = CRANK_DIAMETER + 2 * HOOK_CRANK_THICKNESS, center = true);
        cylinder(h = HOOK_NECK_HEIGHT, d = CRANK_DIAMETER, center = true);
        translate([0, CRANK_DIAMETER / 2, 0]) cylinder(h = HOOK_NECK_HEIGHT, d = CRANK_DIAMETER, center = true);
    }
}



difference() {
    roundedcube([HOOK_FIX_PLATE_WIDTH, HOOK_FIX_PLATE_HEIGHT, HOOK_FIX_PLATE_THICKNESS], true, 1.5, "zmax");
    translate([0, 0, -HOOK_FIX_PLATE_THICKNESS / 2]) {
        translate([HOOK_FIX_PLATE_WIDTH / 3, 0, 0]) chamfered_screw_hole(SCREW_DIAMETER, SCREW_LENGTH, SCREW_HEAD_DIAMETER, SCREW_HEAD_LENGTH);
        translate([-HOOK_FIX_PLATE_WIDTH / 3, 0, 0]) chamfered_screw_hole(SCREW_DIAMETER, SCREW_LENGTH, SCREW_HEAD_DIAMETER, SCREW_HEAD_LENGTH);
    };
}

translate([0, 0, HOOK_NECK_LENGTH / 2]) roundedcube([HOOK_NECK_WIDTH, HOOK_NECK_HEIGHT, HOOK_NECK_LENGTH], true, 1.5, "z");

translate([0, 0, HOOK_NECK_LENGTH + CRANK_DIAMETER / 2]) rotate([90, 0, 0]) crank_hook();
