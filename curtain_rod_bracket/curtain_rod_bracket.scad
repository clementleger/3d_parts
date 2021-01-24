ROD_DIAM = 12.5;
THICKNESS = 4;
SIDE_THICKNESS = 3;

SCREW_DIAM = 5;
SCREW_HEAD_DIAM = 9;

OVERLAP = 10;
HEIGHT = OVERLAP + THICKNESS;
FULL_DIAM =  ROD_DIAM + 2 * SIDE_THICKNESS;

$fn = 100;

difference() {
    union () {
        cylinder(d = FULL_DIAM, h =HEIGHT);
        translate([-FULL_DIAM/2, 0, 0]) cube([FULL_DIAM, FULL_DIAM/2, HEIGHT]);
    }
    
    translate([0, 0, THICKNESS])  {
        cylinder(d = ROD_DIAM, h =HEIGHT);
        translate([-ROD_DIAM/2, 0, 0]) cube([ROD_DIAM, FULL_DIAM/2, HEIGHT]);
    }
    
    cylinder(d1 = SCREW_DIAM, d2 = SCREW_HEAD_DIAM, h = THICKNESS);
}