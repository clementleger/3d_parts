include <../common/roundedcube.scad>

WALL_THICKNESS = 2;
PCB_WIDTH = 16;
PCB_HEIGHT = 23;
MODULE_THICKNESS = 10;
LASER_HOLE_DIAMETER = 7;
WIRE_HOLE_DIAMETER = 4;
FIX_WIDTH = 8;
FIX_HOLE_DIAMETER = 3;

$fn = 50;

module box () {
    difference() {
        roundedcube([PCB_WIDTH + WALL_THICKNESS * 2, PCB_HEIGHT + WALL_THICKNESS * 2, MODULE_THICKNESS + WALL_THICKNESS], center = true, radius = 1, apply_to = "zmin");
        translate ([0, 0, WALL_THICKNESS / 2]) cube([PCB_WIDTH, PCB_HEIGHT, MODULE_THICKNESS], center = true);
        translate ([0, PCB_HEIGHT / 2 + WALL_THICKNESS, MODULE_THICKNESS / 5]) rotate([90, 0, 0]) cylinder(d = LASER_HOLE_DIAMETER, h = WALL_THICKNESS);
        translate ([0, -PCB_HEIGHT / 2, MODULE_THICKNESS / 4]) rotate([90, 0, 0]) cylinder(d = WIRE_HOLE_DIAMETER, h = WALL_THICKNESS);
    }

}


module side_fix() {
    difference () {
        cylinder(d = FIX_WIDTH * 2, h = WALL_THICKNESS);
        translate ([FIX_WIDTH, 0, WALL_THICKNESS / 2]) cube([FIX_WIDTH * 2, FIX_WIDTH * 2, WALL_THICKNESS], center = true);
        translate([- FIX_WIDTH / 2, 0, 0 ]) cylinder(d = FIX_HOLE_DIAMETER, h = WALL_THICKNESS);
    }
}

box();
translate([- (PCB_WIDTH / 2 + WALL_THICKNESS), 0, MODULE_THICKNESS / 2 - WALL_THICKNESS / 2]) side_fix();

mirror (0, 1, 0)translate([- (PCB_WIDTH / 2 + WALL_THICKNESS), 0, MODULE_THICKNESS / 2 - WALL_THICKNESS / 2]) side_fix();

