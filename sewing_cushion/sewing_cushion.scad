include <../common/roundedcube.scad>;

SEWING_CUSHION_DIAMETER = 60;
SEWING_CUSHION_HEIGHT = 15;
SEWING_CUSHION_THICKNESS = 3;

HOLE_DIAMETER = 8;

RING_TOLERANCE = 0.4;
RING_WIDTH = SEWING_CUSHION_DIAMETER + 2 * SEWING_CUSHION_THICKNESS + 2 * RING_TOLERANCE;

WRIST_MOUNT_THICKNESS = 15;
WRIST_MOUNT_WIDTH = 30;
WRIST_MOUNT_HEIGHT = 30;

$fn = 100;
/* Main Box */
module main_box() {
    difference() {
        cylinder(h = SEWING_CUSHION_HEIGHT, d = SEWING_CUSHION_DIAMETER);
        translate ([0, 0, SEWING_CUSHION_THICKNESS]) cylinder(h = SEWING_CUSHION_HEIGHT, d = SEWING_CUSHION_DIAMETER - 2 * SEWING_CUSHION_THICKNESS);
        cylinder(h = SEWING_CUSHION_HEIGHT, d = HOLE_DIAMETER);
    }

    difference() {
    cylinder(h = SEWING_CUSHION_HEIGHT / 2, d = HOLE_DIAMETER + 2 * SEWING_CUSHION_THICKNESS);
        cylinder(h = SEWING_CUSHION_HEIGHT, d = HOLE_DIAMETER);
    }
}

/* Inner ring */

module inner_ring() {
    difference() {
        cylinder(h = SEWING_CUSHION_HEIGHT - SEWING_CUSHION_THICKNESS, d = RING_WIDTH);
        cylinder(h = SEWING_CUSHION_HEIGHT - SEWING_CUSHION_THICKNESS, d = RING_WIDTH - 2 * SEWING_CUSHION_THICKNESS);
    }
}

module wrist_mount() {
    cube([20, 20, 2], center = true);
    translate ([0, 9, 2]) cube([20, 2, 4], center = true);
}

//main_box();
translate ([0, 0, 0])inner_ring();

//wrist_mount();