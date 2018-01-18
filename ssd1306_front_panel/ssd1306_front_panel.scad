include <../common/roundedcube.scad>

SCREEN_WIDTH = 23.5;
SCREEN_HEIGHT = 13;

PCB_WIDTH = 27.5;
PCB_HEIGHT = 28;
PCB_THICKNESS = 5;

SCREEN_OFFSET_FROM_TOP = 6.2;

BORDER_THICKNESS = 10;

THICKNESS = 1;

difference() {
    roundedcube([SCREEN_WIDTH + 2 * BORDER_THICKNESS, SCREEN_HEIGHT + 2 * BORDER_THICKNESS, THICKNESS], center = true, radius = 0.3, apply_to = "zmin");
    cube([SCREEN_WIDTH, SCREEN_HEIGHT, THICKNESS], center = true);
}


translate([0, THICKNESS + SCREEN_HEIGHT/2 - SCREEN_OFFSET_FROM_TOP, THICKNESS / 2+ PCB_THICKNESS / 2]) 
difference() {
    cube([PCB_WIDTH + 2 * THICKNESS, PCB_HEIGHT + 2 * THICKNESS ,PCB_THICKNESS], center = true);
    cube([PCB_WIDTH, PCB_HEIGHT,PCB_THICKNESS], center = true);
    translate ([0, (SCREEN_HEIGHT + 2 * BORDER_THICKNESS) / 2 - BORDER_THICKNESS / 2 ]) #cube([PCB_WIDTH + 2 * THICKNESS, BORDER_THICKNESS ,PCB_THICKNESS], center = true);
}