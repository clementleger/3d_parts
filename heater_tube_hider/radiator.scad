$fn = 50;

PATCH_HOLE_DIAMETER = 23;
PATCH_SIZE_DIAMETER = 65;
PATCH_WIDTH = 4.5;
PIN_SIZE = 8;
PATCH_PIN_TOLERANCE = 0.2;

module disc() {
    rotate_extrude(convexity = 10, $fn = 100)
    translate([PATCH_SIZE_DIAMETER / 2 - PATCH_WIDTH, 0, 0])
    circle(r = PATCH_WIDTH / 2);

    cylinder(h = PATCH_WIDTH / 2, d = PATCH_SIZE_DIAMETER - PATCH_WIDTH);


    translate([0, 0, -PATCH_WIDTH / 2]) cylinder(h = PATCH_WIDTH / 2, d = PATCH_SIZE_DIAMETER - PATCH_WIDTH * 2);
}

module disc_with_hole() {
    difference() {
        disc();
        translate([0, 0, - PATCH_WIDTH / 2]) cylinder(h = PATCH_WIDTH, d = PATCH_HOLE_DIAMETER);
    }
}

module half_disc() {
    difference() {
        disc_with_hole();
        translate([0, PATCH_SIZE_DIAMETER/ 4, 0]) cube ([PATCH_SIZE_DIAMETER, PATCH_SIZE_DIAMETER/2, PATCH_WIDTH], center = true);
    }
    
}

module half_pins(pin_size, pin_diameter) {
    translate([PATCH_SIZE_DIAMETER/ 3, 0, 0]) rotate([-90, 0, 0]) cylinder(h = pin_size, d = pin_diameter);
    translate([-PATCH_SIZE_DIAMETER/ 3, 0, 0]) rotate([-90, 0, 0]) cylinder(h = pin_size, d = pin_diameter);
}

module half_male() {
    half_disc();
    half_pins(PIN_SIZE - 2, PATCH_WIDTH - 2 - PATCH_PIN_TOLERANCE);
}

module half_female() {
    difference () {
        mirror([0, 1, 0]) half_disc();
        half_pins(PIN_SIZE, PATCH_WIDTH - 2 + 0.4);
    }
}

translate([0, -10, 0]) half_male();
half_female();
