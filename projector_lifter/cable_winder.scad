include <../common/spring.scad>

CENTER_HOLE_DIAMETER = 8;
SCREW_DIAMETER = 3;
WINDER_DIAMETER = 21;
WINDER_LENGTH = 25;
WINDER_WIRE_RADIUS = 1;
WINDER_WIRE_PITCH = 2;
WINDER_BORDER = 5;
CABLE_STOP_DIAM = 4.4;
CABLE_STOP_LENGTH = 5;

$fn = 40;


 BEARING_SUPPORT_LENGTH = 4;
 BEARING_SUPPORT_DIAMETER = 12;

MOTOR_SHAFT_DIAMETER = 8.5;
MOTOR_SHAFT_FLAT_THICKNESS= 7.2;
MOTOR_SHAFT_COUPLING_LENGTH = 14;

WINDER_FULL_LENGTH = WINDER_LENGTH + 2 * WINDER_BORDER;

module winder() {
    difference() {
        cylinder(d = WINDER_DIAMETER, h = WINDER_FULL_LENGTH);
        translate([0, WINDER_DIAMETER/2, WINDER_BORDER]) rotate([100, 0, -35]) {
            cylinder(r = WINDER_WIRE_RADIUS+ 0.2, h = WINDER_DIAMETER);
            translate([0, 0, WINDER_DIAMETER - CABLE_STOP_LENGTH ]) cylinder(d = CABLE_STOP_DIAM, h = CABLE_STOP_LENGTH);
        }
        translate([0, 0, WINDER_BORDER]) spring(WINDER_DIAMETER/2 + 00.2, WINDER_WIRE_RADIUS, WINDER_WIRE_PITCH, WINDER_LENGTH/ WINDER_WIRE_PITCH, 4);
        
        cylinder(d = CENTER_HOLE_DIAMETER, h = WINDER_FULL_LENGTH);
    }
}

module screw() {
    
    translate([0, 0, WINDER_BORDER/2]) rotate([0,90, 0]) cylinder(d = SCREW_DIAMETER, h = WINDER_DIAMETER/2);
    translate([0, 0, WINDER_FULL_LENGTH - WINDER_BORDER/2]) rotate([0,90, 0]) cylinder(d = SCREW_DIAMETER, h = WINDER_DIAMETER/2);
    translate([0, 0, WINDER_FULL_LENGTH/2]) rotate([0,90, 0]) cylinder(d = SCREW_DIAMETER, h = WINDER_DIAMETER/2);
}

module double_winder() {
    translate([0, 0, WINDER_FULL_LENGTH]) 
    difference() {
        cylinder(d = BEARING_SUPPORT_DIAMETER, h = BEARING_SUPPORT_LENGTH);
        cylinder(d = CENTER_HOLE_DIAMETER, h = BEARING_SUPPORT_LENGTH);
    }

    mirror([0, 1, 0]) {
        winder();
        rotate([0, 0, 180]) mirror([0, 0, 1]) winder();
    }
    /* endstop for motor shaft */
    translate([0, CENTER_HOLE_DIAMETER/ 2 - (CENTER_HOLE_DIAMETER - MOTOR_SHAFT_FLAT_THICKNESS) + CENTER_HOLE_DIAMETER/2/2, -WINDER_FULL_LENGTH + MOTOR_SHAFT_COUPLING_LENGTH/2]) cube([CENTER_HOLE_DIAMETER, CENTER_HOLE_DIAMETER/2, MOTOR_SHAFT_COUPLING_LENGTH], true);
}

double_winder();