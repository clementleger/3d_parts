use <../common/roundedcube.scad>
use <../common/chamfered_screw_hole.scad>

ROD_DIAMETER = 10.45;
ROD_OFFSET_FROM_BASE = 6;
MOUNT_WIDTH = 15;
MOUNT_THICKNESS = 6;

SCREW_PART_SIZE = 18;

ROD_MOUNT_WIDTH = ROD_DIAMETER + 2 * ROD_OFFSET_FROM_BASE;

SCREW_HEAD_SIZE = 2;
SCREW_HEAD_DIAMETER = 8;
SCREW_DIAMETER = 4;
SCREW_SIZE = 10;

$fn = 100;

difference() {
    roundedcube([ROD_MOUNT_WIDTH, MOUNT_WIDTH, ROD_MOUNT_WIDTH], true, 2.3, "zmax");
    translate([0, 1, -ROD_MOUNT_WIDTH / 2 +ROD_DIAMETER / 2 + ROD_OFFSET_FROM_BASE ]) rotate([90, 0, 0 ]) cylinder(d = ROD_DIAMETER, h = MOUNT_WIDTH - 1, center = true);
}
difference() {
    translate([SCREW_PART_SIZE / 2 + MOUNT_WIDTH / 2 - 1.75, 0, -(ROD_MOUNT_WIDTH / 2 - MOUNT_THICKNESS / 2)]) roundedcube([SCREW_PART_SIZE, MOUNT_WIDTH, MOUNT_THICKNESS], true, 1.75, "zmax");

translate([SCREW_PART_SIZE / 2 + MOUNT_WIDTH / 2 , 0,  -(SCREW_SIZE +SCREW_HEAD_SIZE) - (ROD_MOUNT_WIDTH / 2) + MOUNT_THICKNESS]) chamfered_screw_hole(SCREW_DIAMETER, SCREW_SIZE, SCREW_HEAD_DIAMETER, SCREW_HEAD_SIZE);
}