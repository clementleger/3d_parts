include <../common/roundedcube.scad>
include <../common/prism.scad>

EMERGENCY_BUTTON_DIAM = 30;
ABORT_BUTTON_DIAM = 19;
HOLD_BUTTON_DIAM = 19;
RESUME_BUTTON_DIAM = 19;
BOX_THICKNESS = 40;
BOX_SIDE_THICKNESS = 3;
BOX_TOP_THICKNESS = 5;
BOX_SIDE_SPACING = 15;
BOX_BUTTON_TOP_SPACING = 20;
BOX_BUTTON_BOTTOM_SPACING = 10;
BOX_BUTTON_SPACING = 12;

CABLE_DIAMETER = 8;
CABLE_BOTTOM_OFFSET = 5;

BOX_PANEL_ANGLE = 10;

/* Generated */
BOX_FULL_WIDTH = 2 * BOX_SIDE_SPACING + 3 * BOX_BUTTON_SPACING + EMERGENCY_BUTTON_DIAM + ABORT_BUTTON_DIAM + HOLD_BUTTON_DIAM + RESUME_BUTTON_DIAM;
BOX_FULL_HEIGHT = EMERGENCY_BUTTON_DIAM + BOX_BUTTON_TOP_SPACING + BOX_BUTTON_BOTTOM_SPACING;


BOX_PANEL_OFFSET = tan(BOX_PANEL_ANGLE) * BOX_FULL_HEIGHT;

module button_box_block() {
    difference() {
        roundedcube([BOX_FULL_WIDTH, BOX_FULL_HEIGHT, BOX_THICKNESS], true, 3, "z");
        translate([0, 0, BOX_THICKNESS - BOX_PANEL_OFFSET/2]) rotate([BOX_PANEL_ANGLE, 0, 0]) cube([BOX_FULL_WIDTH, BOX_FULL_HEIGHT*2, BOX_THICKNESS], true);
    }
}

BOX_INNER_WIDTH = BOX_FULL_WIDTH - 2 * BOX_SIDE_THICKNESS;
BOX_INNER_HEIGHT = BOX_FULL_HEIGHT - 2 * BOX_SIDE_THICKNESS;


SIDE_BRACKET_THICKNESS = 3;
SIDE_BRACKET_LENGTH = 10;
SIDE_BRACKET_WIDTH = 20;
SIDE_BRACKET_HEIGHT = 20;

module side_bracket(w, d, h, t, hole_diam = 3)
{
    difference() {
        union () {
            cube([t, w, h]);
            cube([d + t, w, t]);
               
            /* Side prism */
            translate([d + t, 0, t]) rotate([0, 0, 90]) {
                prism(t, d, h - t);
          
                translate([w - t, 0, 0]) prism(t, d, h - t);
            }
        }
        translate([d / 4 * 3, w / 2, -0.2]) cylinder(d = hole_diam, h = t);
    }
}

module button_box_enclosure() {
    difference() {
        button_box_block();
        translate([0, 0, -BOX_TOP_THICKNESS]) scale([BOX_INNER_WIDTH/BOX_FULL_WIDTH, BOX_INNER_HEIGHT/BOX_FULL_HEIGHT, 1]) button_box_block();

        translate([0, - BOX_FULL_HEIGHT/2 + EMERGENCY_BUTTON_DIAM/2 + BOX_BUTTON_BOTTOM_SPACING, BOX_THICKNESS/2 - BOX_PANEL_OFFSET/2]) { 
            /* Emergency button */
            translate([- BOX_FULL_WIDTH/2 + EMERGENCY_BUTTON_DIAM/2 + BOX_SIDE_SPACING, 0, 0]) rotate([BOX_PANEL_ANGLE, 0, 0]) cylinder(d = EMERGENCY_BUTTON_DIAM, h = BOX_THICKNESS, center = true);
            /* Abort button */
            translate([- BOX_FULL_WIDTH/2 + EMERGENCY_BUTTON_DIAM + BOX_SIDE_SPACING +  BOX_BUTTON_SPACING + ABORT_BUTTON_DIAM/2, 0, 0]) rotate([BOX_PANEL_ANGLE, 0, 0]) cylinder(d = ABORT_BUTTON_DIAM, h = BOX_THICKNESS, center = true);
            /* Hold button */
            translate([- BOX_FULL_WIDTH/2 + EMERGENCY_BUTTON_DIAM + BOX_SIDE_SPACING +  BOX_BUTTON_SPACING + ABORT_BUTTON_DIAM +  BOX_BUTTON_SPACING + HOLD_BUTTON_DIAM/2, 0, 0]) rotate([BOX_PANEL_ANGLE, 0, 0]) cylinder(d = HOLD_BUTTON_DIAM, h = BOX_THICKNESS, center = true);
            /* Resume button */
            translate([- BOX_FULL_WIDTH/2 + EMERGENCY_BUTTON_DIAM + BOX_SIDE_SPACING +  BOX_BUTTON_SPACING + ABORT_BUTTON_DIAM +  BOX_BUTTON_SPACING + HOLD_BUTTON_DIAM +  BOX_BUTTON_SPACING + RESUME_BUTTON_DIAM/2, 0, 0]) rotate([BOX_PANEL_ANGLE, 0, 0]) cylinder(d = RESUME_BUTTON_DIAM, h = BOX_THICKNESS, center = true);
        }    
        /* Cable hole */
        translate([0, 0, -BOX_THICKNESS/2 + CABLE_DIAMETER  + CABLE_BOTTOM_OFFSET]) rotate([-90, 0, 0]) cylinder(d = CABLE_DIAMETER , h = BOX_FULL_HEIGHT);
    }
}

module button_box_enclosure_with_mount() {
    button_box_enclosure();
    translate([0, BOX_FULL_HEIGHT/2 - SIDE_BRACKET_THICKNESS, - BOX_THICKNESS/2]) {
        translate([SIDE_BRACKET_WIDTH/2 - BOX_FULL_WIDTH/4, 0, 0]) rotate ([0, 0, 90]) side_bracket(SIDE_BRACKET_WIDTH, SIDE_BRACKET_LENGTH, SIDE_BRACKET_HEIGHT, SIDE_BRACKET_THICKNESS);
        translate([SIDE_BRACKET_WIDTH/2 + BOX_FULL_WIDTH/4, 0, 0]) rotate ([0, 0, 90]) side_bracket(SIDE_BRACKET_WIDTH, SIDE_BRACKET_LENGTH, SIDE_BRACKET_HEIGHT, SIDE_BRACKET_THICKNESS);
    }
}

button_box_enclosure_with_mount();
