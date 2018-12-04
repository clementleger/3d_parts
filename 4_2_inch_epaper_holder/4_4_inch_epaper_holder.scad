use <../common/roundedcube.scad>

SCREEN_WIDTH = 84;
SCREEN_HEIGHT  = 63.5;

BOX_TOP_HEIGHT = 8;
BOX_BOTTOM_HEIGHT = 20; 
BOX_SIDE_WIDTH = 8;
BOX_ANGLE = 7;
BOX_DEPTH = 20;

BOX_FULL_HEIGHT =  SCREEN_HEIGHT + BOX_BOTTOM_HEIGHT + BOX_TOP_HEIGHT;
BOX_FULL_WIDTH = SCREEN_WIDTH + 2 * BOX_SIDE_WIDTH;
BOX_THICKNESS = 2;
BOX_BOTTOM_THICKNESS = 10;

ROUNDING= 0.5;

RAIL_BOTTOM_WIDTH = 5;
RAIL_TOP_WIDTH = 6;
RAIL_THICKNESS= 3;

FEET_THICKNESS = 3;
FEET_LENGTH = BOX_DEPTH * 2;

module clipping_rails(width1, width2, height, thickness) {
    linear_extrude(height = thickness)  polygon(points = [[-width1/2, 0],[width1/2, 0],[width2/2, height],[-width2/2, height]]);
}

module box_feet() {
    roundedcube([BOX_FULL_WIDTH + 2 * ROUNDING, FEET_THICKNESS, FEET_LENGTH], false, ROUNDING, "ymax") ;
    translate([BOX_FULL_WIDTH / 4, FEET_THICKNESS - 0.1, BOX_THICKNESS * 2]) clipping_rails(RAIL_BOTTOM_WIDTH, RAIL_TOP_WIDTH, RAIL_THICKNESS, BOX_DEPTH);
    translate([BOX_FULL_WIDTH / 4 * 3, FEET_THICKNESS - 0.1, BOX_THICKNESS * 2]) clipping_rails(RAIL_BOTTOM_WIDTH, RAIL_TOP_WIDTH, RAIL_THICKNESS, BOX_DEPTH);
}

module main_box_case () {
        roundedcube([BOX_FULL_WIDTH, BOX_BOTTOM_HEIGHT, BOX_THICKNESS], false, ROUNDING, "zmin");
        roundedcube([BOX_SIDE_WIDTH, BOX_FULL_HEIGHT , BOX_THICKNESS], false, ROUNDING, "zmin");
        translate([BOX_FULL_WIDTH - BOX_SIDE_WIDTH, 0, 0]) roundedcube([BOX_SIDE_WIDTH, BOX_FULL_HEIGHT , BOX_THICKNESS], false, ROUNDING, "zmin");
        translate([0, BOX_FULL_HEIGHT - BOX_TOP_HEIGHT, 0]) roundedcube([BOX_FULL_WIDTH, BOX_TOP_HEIGHT, BOX_THICKNESS], false, ROUNDING, "zmin");
     
        roundedcube([BOX_FULL_WIDTH, BOX_BOTTOM_THICKNESS, BOX_DEPTH], false, ROUNDING, "ymin");
        roundedcube([BOX_THICKNESS, BOX_FULL_HEIGHT, BOX_DEPTH], false, ROUNDING, "xmin");
        translate([BOX_FULL_WIDTH - BOX_THICKNESS, 0, 0]) roundedcube([BOX_THICKNESS, BOX_FULL_HEIGHT , BOX_DEPTH], false, ROUNDING, "zmin");
        translate([0, BOX_FULL_HEIGHT - BOX_THICKNESS, 0]) roundedcube([BOX_FULL_WIDTH, BOX_THICKNESS, BOX_DEPTH], false, ROUNDING, "zmin");
}

difference() {
    main_box_case();
    rotate([-BOX_ANGLE, 0, 0]) translate([0, -FEET_THICKNESS + ROUNDING, 0]) box_feet();
}