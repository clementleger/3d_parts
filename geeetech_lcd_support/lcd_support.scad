
$fn = 30;

translate([-2, 4, 0]) {
    cube([6, 72, 5]);
    translate([6, 32, 0])cube([5, 6, 5]);
    translate([6, 53, 0]) cube([5, 6, 5]);
}

 rotate ([0, 0, 45]) translate([0, 49, 0]) cube([52, 6, 5]);

rotate ([0, 0, 45])
difference() {
    cube([6, 55, 10]);
    translate ([0, 15, 6]) rotate ([0, 90, 0]) cylinder(h = 7, d1 = 3, d2 = 8);
    translate ([0, 40, 6]) rotate ([0, 90, 0]) cylinder(h = 7, d1 = 3, d2 = 8);
};
