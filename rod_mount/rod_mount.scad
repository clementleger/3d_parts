include <../common/chamfered_screw_hole.scad>
include <../common/roundedcube.scad>

ROD_WIDTH = 15;
ROD_HEIGHT = 20;

FIX_THICKNESS = 6;

NICK_THICKNESS = 10;

WALL_THICKNESS = 4;

$fn = 20;


SCREW_HEAD_DIAMETER = 8;
SCREW_HEAD_LENGTH = 2;
SCREW_DIAMETER = 4;
SCREW_LENGTH = 10;

color("green") 
translate([-7, 0, FIX_THICKNESS / 2 + NICK_THICKNESS / 2])
union () {
    difference() {
        union() {
            cube([ROD_HEIGHT, ROD_WIDTH + 2 * WALL_THICKNESS, NICK_THICKNESS], true);
            translate([ROD_HEIGHT / 2, 0, 0])
            difference() {
                cylinder(d = ROD_WIDTH + 2 * WALL_THICKNESS, h = NICK_THICKNESS, center = true);
                cylinder(d = ROD_WIDTH, h = NICK_THICKNESS, center = true);
            }
        }
    
        cube([ROD_HEIGHT, ROD_WIDTH, NICK_THICKNESS], true);
    }
}

difference() {
    roundedcube([ROD_WIDTH + 40, ROD_HEIGHT + WALL_THICKNESS * 2, FIX_THICKNESS], true, 1.2, "zmax");
    color("blue")
    translate([0, 0, -(SCREW_LENGTH + SCREW_HEAD_LENGTH)/2 - FIX_THICKNESS / 2])
    union () {
        translate([19, 0, 0]) #chamfered_screw_hole(SCREW_DIAMETER, SCREW_LENGTH, SCREW_HEAD_DIAMETER, SCREW_HEAD_LENGTH);
        translate([-19, 0, 0]) #chamfered_screw_hole(SCREW_DIAMETER, SCREW_LENGTH, SCREW_HEAD_DIAMETER, SCREW_HEAD_LENGTH);
    }
}