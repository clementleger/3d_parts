use <../common/roundedcube.scad>;

HEADLIGHT_BALL_DIAMETER = 6.4;
HEADLIGHT_BALL_HOLDER_THICKNESS = 2;
FRONT_THICKNESS = 3;
SIDE_THICKNESS = 3;
HEADLIGHT_BALL_DIAMETER_TOTAL = HEADLIGHT_BALL_DIAMETER + 2 * HEADLIGHT_BALL_HOLDER_THICKNESS;
HELMET_SPACING = 64;
STRUCTURE_HEIGHT = 8;
BOTTOM_SPACING = 14;
TOP_SPACING = 6;
CENTER_SPACING = 43;

HELMET_THICKNESS = 23;
HOOK_LENGTH = 4;
HOOK_THICKNESS = 2;

TOP_HOOK_LENGTH = 20;

HELMET_FULL_SPACING = HELMET_SPACING + 2 * HEADLIGHT_BALL_HOLDER_THICKNESS;

module front_side() {
roundedcube([FRONT_THICKNESS, HELMET_FULL_SPACING, STRUCTURE_HEIGHT], radius = 0.4, apply_to = "xmax", center = true);
}

SIDE_LENGTH = HELMET_THICKNESS + 2 * HEADLIGHT_BALL_HOLDER_THICKNESS;
module side() {
translate([-SIDE_LENGTH / 2 + HEADLIGHT_BALL_HOLDER_THICKNESS / 2, HELMET_FULL_SPACING / 2 - HEADLIGHT_BALL_HOLDER_THICKNESS / 2, 0]) roundedcube([SIDE_LENGTH, SIDE_THICKNESS, STRUCTURE_HEIGHT], radius = 0.4, apply_to = "ymax", center = true);
    
    translate([-SIDE_LENGTH + HOOK_THICKNESS, HELMET_FULL_SPACING / 2 -(HOOK_LENGTH + SIDE_THICKNESS) / 2, 0]) roundedcube([HOOK_THICKNESS, HOOK_LENGTH + SIDE_THICKNESS, STRUCTURE_HEIGHT], radius = 0.4, apply_to = "xmin", center = true);
}

module top_hook() {
rotate([0, 15, 0]) {
translate([- TOP_HOOK_LENGTH/ 2 , 0, STRUCTURE_HEIGHT / 2 - FRONT_THICKNESS / 2]) roundedcube([TOP_HOOK_LENGTH, HEADLIGHT_BALL_DIAMETER, FRONT_THICKNESS], radius = 0.4, apply_to = "zmax", center = true);

translate([-TOP_HOOK_LENGTH + HOOK_THICKNESS / 2, 0, 0]) roundedcube([HOOK_THICKNESS, HEADLIGHT_BALL_DIAMETER, HOOK_LENGTH], , radius = 0.4, apply_to = "ymin", center = true);
}
}
module ball_holder() {
    $fn = 40;
    translate([HEADLIGHT_BALL_DIAMETER_TOTAL/2 - HEADLIGHT_BALL_HOLDER_THICKNESS / 2, 0, 0])
    difference() {
        sphere(d = HEADLIGHT_BALL_DIAMETER_TOTAL);
        sphere(d = HEADLIGHT_BALL_DIAMETER);
        translate([HEADLIGHT_BALL_DIAMETER / 2, 0, 0]) sphere(d = HEADLIGHT_BALL_DIAMETER);
        cube([20, 1.5, 20], center = true);
        translate([HEADLIGHT_BALL_DIAMETER /2 + 1, 0, 0]) cube([4, 20, 20], center = true);
        translate([0, 0, - 2 - STRUCTURE_HEIGHT / 2]) cube([20, 20, 4], center = true);
    }
}

front_side();
side();
mirror([0, 1, 0]) side();
ball_holder();
top_hook();