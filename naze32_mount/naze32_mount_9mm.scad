//**********************************************************************
//* Naze32 Flight Controller Mount                                     *
//* by Mike Leigh - June 2016                                          *
//* Mount based on "Crossfire2" design by MickeyB                      *
//* (http://www.thingiverse.com/thing:234867)                          *
//* CC BY-NC 3.0                                                       *
//* http://creativecommons.org/licenses/by-nc/3.0/                     *
//**********************************************************************

// width
x = 50;
// length
y = 85;
// height
z = 3;

// dampener dimensions
dampner_hole = 5;
dampner_cutout = 9;

difference() {

    // base, union of 2 hulls
    union() {
        // external corners
        hull() {
            translate([-16, -32, z / 2 * -1]) cylinder(r = dampner_cutout / 2 + 6, h = z, $fn = 30);
            translate([-16, 32, z / 2 * -1]) cylinder(r = dampner_cutout / 2 + 6, h = z, $fn = 30);
            translate([16, -32, z / 2 * -1]) cylinder(r = dampner_cutout / 2 + 6, h = z, $fn = 30);
            translate([16, 32, z / 2 * -1]) cylinder(r = dampner_cutout / 2 + 6, h = z, $fn = 30);
        }
        // 64mm middle supports
        hull() {
            translate([0, -32, (z / 2) * -1]) cylinder(r = 3.6, h = z, $fn = 30);
            translate([-32, 0, (z / 2) * -1]) cylinder(r = 3.6, h = z, $fn = 30);
            translate([32, 0, (z / 2) * -1]) cylinder(r = 3.6, h = z, $fn = 30);
            translate([0, 32, (z / 2) * -1]) cylinder(r = 3.6, h = z, $fn = 30);
        }
    }

    // rectangle cutouts
    translate([0, -30, 0]) cube([12, 16, z + .2], center=true);
    translate([0, 30, 0]) cube([12, 16, z + .2], center=true);

    // 17mm rotated rectangular cutouts
    translate([16, 0, 0]) rotate([0,0,45]) cube([17, 17, z + .2], center=true);
    translate([-16, 0, 0]) rotate([0,0,45]) cube([17, 17, z + .2], center=true);

    // 20mm rotated rectangular cutouts
    translate([0, -20, 0]) rotate([0,0,45]) cube([20, 20, z + .2], center=true);
    translate([0, 20, 0]) rotate([0,0,45]) cube([20, 20, z + .2], center=true);

    // 45mm square fixing holes
    translate([-22.5, -22.5, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);
    translate([-22.5, 22.5, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);
    translate([22.5, -22.5, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);
    translate([22.5, 22.5, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);

    // 30.5mm square fixing holes
    translate([-15.25, -15.25, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);
    translate([-15.25, 15.25, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);
    translate([15.25, -15.25, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);
    translate([15.25, 15.25, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);

    // 64mm spaced x axis holes
    translate([32, 0, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);
    translate([-32, 0, (z / 2) * -1 -.1]) cylinder(r = 1.6, h = z + .2, $fn = 6);

    // 64 x 32 hole centres (dampeners)
    translate([-16, -32, (z / 2) * -1 -.1]) cylinder(r = dampner_hole / 2, h = z + .2, $fn = 30);
    translate([-16, -32, 0]) cylinder(r = dampner_cutout / 2, h = z, $fn = 30);
    translate([-16, 32, (z / 2) * -1 -.1]) cylinder(r = dampner_hole / 2, h = z + .2, $fn = 30);
    translate([-16, 32, 0]) cylinder(r = dampner_cutout / 2, h = z, $fn = 30);
    translate([16, -32, (z / 2) * -1 -.1]) cylinder(r = dampner_hole / 2, h = z + .2, $fn = 30);
    translate([16, -32, 0]) cylinder(r = dampner_cutout / 2, h = z, $fn = 30);
    translate([16, 32, (z / 2) * -1 -.1]) cylinder(r = dampner_hole / 2, h = z + .2, $fn = 30);
    translate([16, 32, 0]) cylinder(r = dampner_cutout / 2, h = z, $fn = 30);

}
