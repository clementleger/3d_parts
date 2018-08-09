use <../common/roundedcube.scad>
use <../common/chamfered_screw_hole.scad>

THREADED_ROD_DIAMETER = 8.2;
ROD_OFFSET_FROM_BASE = 4;
MOUNT_WIDTH = 15;
MOUNT_THICKNESS = 6;
MOUNT_HEIGHT = 40;

SCREW_PART_SIZE = 18;

ROD_MOUNT_WIDTH = THREADED_ROD_DIAMETER + 2 * 3;

SCREW_HEAD_SIZE = 2;
SCREW_HEAD_DIAMETER = 8;
SCREW_DIAMETER = 4;
SCREW_SIZE = 10;

$fn = 100;

difference() {
    roundedcube([ROD_MOUNT_WIDTH, ROD_MOUNT_WIDTH, MOUNT_HEIGHT], true, 1.75, "zmax");
    cylinder(d = THREADED_ROD_DIAMETER, h = MOUNT_HEIGHT , center = true);
}
difference() {
    translate([SCREW_PART_SIZE / 2 + MOUNT_WIDTH / 2 - 4, 0, -(MOUNT_HEIGHT / 2 - MOUNT_THICKNESS / 2)]) roundedcube([SCREW_PART_SIZE, ROD_MOUNT_WIDTH, MOUNT_THICKNESS], true, 1.75, "zmax");

translate([SCREW_PART_SIZE / 2 + MOUNT_WIDTH / 2 - 2.5, 0,  -(SCREW_SIZE +SCREW_HEAD_SIZE) - (MOUNT_HEIGHT / 2) + MOUNT_THICKNESS]) chamfered_screw_hole(SCREW_DIAMETER, SCREW_SIZE, SCREW_HEAD_DIAMETER, SCREW_HEAD_SIZE);
}