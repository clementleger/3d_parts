AXIS_DIAM = 16;
LENGTH = 70;
DIAM1 = 22;
DIAM2 = 30;



difference() {
    union () {
        cylinder(d1 = DIAM1, d2 = DIAM2, h = LENGTH, $fn = 40);
        translate([0, 0, LENGTH]) sphere(d = DIAM2, $fn = 40);
    }
    cylinder(d = AXIS_DIAM, h = LENGTH, $fn = 6);
}