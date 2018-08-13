
$fn = 30;

module chamfer(l, w, h) {
    difference() {
        cube([l, w, h]);
        translate([-0.1, 0, h]) scale([l + 0.2, w, h]) rotate([0, 90, 0]) cylinder(r = 1, h = 1);
    }
}



chamfer(40, 30, 20);