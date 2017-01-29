include <../common/roundedcube.scad>;
include <../common/prism.scad>;

SUPPORT_THICKNESS = 3;
SUPPORT_HEIGHT = 40;
SCREW_DIAMETER = 3;
CARIAGE_WIDTH= 17;
SUPPORT_SCREW_SPACE= 30.5;
SUPPORT_SCREW_HEIGHT= 5;
SUPPORT_BORDER = 4;
SUPPORT_WIDTH = SUPPORT_SCREW_SPACE + SUPPORT_BORDER * 2;

CABLE_ZIP_HOLE = 5;

BL_TOUCH_SCREW_SPACE = 18;
BL_TOUCH_SCREW_BORDER = 4;
BL_TOUCH_SCREW_DIAMETER = 2.5;
BL_TOUCH_WIDTH = BL_TOUCH_SCREW_SPACE + 2 * BL_TOUCH_SCREW_BORDER;
BL_TOUCH_HEIGHT = 20;
BL_TOUCH_WIRE_HOLE_WIDTH = 8;
BL_TOUCH_WIRE_HOLE_HEIGHT = 3.5;
BL_TOUCH_WIRE_HOLE_Y_OFFSET = 5;
BL_TOUCH_WIRE_GUSSET_HEIGHT = SUPPORT_HEIGHT / 3;

X_SUPPORT_SCREW_HEIGHT = 12;

CHAMFER_SIZE = 2;

$fn = 100;

module iso_trap (l1, l2, h, t = 10, center) {
   linear_extrude(height = t, center = true) polygon([[0, -l1/2], [0, l1/2], [h, l2/2], [h, -l2/2]], [[0, 1, 2, 3]]);
}

module bl_touch_back_plate() {
    translate([CARIAGE_WIDTH + SUPPORT_THICKNESS, 0, X_SUPPORT_SCREW_HEIGHT / 2 - SUPPORT_THICKNESS / 2 ])  {
        cube([SUPPORT_THICKNESS, SUPPORT_WIDTH, SUPPORT_THICKNESS], center = true);
        
        translate([0, 0, -SUPPORT_THICKNESS / 2])  rotate([0, 90, 0])
            iso_trap(SUPPORT_WIDTH, BL_TOUCH_HEIGHT, SUPPORT_HEIGHT - SUPPORT_THICKNESS, SUPPORT_THICKNESS);
    }
}
module back_plate_gusset()
{
    translate ([0, BL_TOUCH_HEIGHT / 2 - SUPPORT_THICKNESS, 0]) {
        translate ([(-BL_TOUCH_WIDTH / 2) + ((BL_TOUCH_WIDTH / 4) * 3 - (SUPPORT_THICKNESS / 2)), 0, -SUPPORT_HEIGHT + SUPPORT_THICKNESS / 2]) mirror ([1, 0, 0]) rotate ([90, 0, 90]) prism(SUPPORT_THICKNESS, SUPPORT_HEIGHT - SUPPORT_THICKNESS, (BL_TOUCH_WIDTH / 4) * 3 - (SUPPORT_THICKNESS / 2));

        translate ([(BL_TOUCH_WIDTH / 2) - (BL_TOUCH_WIDTH / 4 - (SUPPORT_THICKNESS / 2)), 0, -BL_TOUCH_WIRE_GUSSET_HEIGHT / 2 - SUPPORT_THICKNESS / 2]) rotate ([90, 0, 90]) prism(SUPPORT_THICKNESS, BL_TOUCH_WIRE_GUSSET_HEIGHT / 2, BL_TOUCH_WIDTH / 4 - (SUPPORT_THICKNESS / 2));
    }
}

/**
 * Touch sensor plate
 */
module bl_touch_plate ()
{
    mirror ([1, 0, 0]) rotate ([180, 0, 0]) {
        difference() {
            cube([BL_TOUCH_WIDTH, BL_TOUCH_HEIGHT, SUPPORT_THICKNESS], center = true);
            translate ([0, 0, 0.4]) {
                translate ([BL_TOUCH_SCREW_SPACE/2, 0, 0]) cylinder(h = SUPPORT_THICKNESS, d = BL_TOUCH_SCREW_DIAMETER, center = true);
                translate ([- BL_TOUCH_SCREW_SPACE/2, 0, 0]) cylinder(h = SUPPORT_THICKNESS, d = BL_TOUCH_SCREW_DIAMETER, center = true);
            
                translate ([0, BL_TOUCH_WIRE_HOLE_Y_OFFSET, 0])cube([BL_TOUCH_WIRE_HOLE_WIDTH, BL_TOUCH_WIRE_HOLE_HEIGHT, SUPPORT_THICKNESS], center = true);
            }
        }
        back_plate_gusset();
        mirror ([0, 1, 0])back_plate_gusset();
    }
}

/**
 * Complete module 
 */
module bl_touch () {
    /* Plate for screwing on X motor support */
    difference () {
        cube([SUPPORT_THICKNESS, SUPPORT_WIDTH, X_SUPPORT_SCREW_HEIGHT], center = true);
        
        translate ([0, 0, - X_SUPPORT_SCREW_HEIGHT / 2 + SUPPORT_SCREW_HEIGHT]) {
            translate([0, SUPPORT_SCREW_SPACE / 2, 0]) rotate([0, 90, 0]) cylinder(h = SUPPORT_THICKNESS + 2, d = SCREW_DIAMETER, center = true);
            translate([0, - SUPPORT_SCREW_SPACE / 2, 0]) rotate([0, 90, 0]) cylinder(h = SUPPORT_THICKNESS + 2, d = SCREW_DIAMETER, center = true);
        }
    }

    /* Top plate */
    translate ([CARIAGE_WIDTH/2 + SUPPORT_THICKNESS/2, 0, 0]) {
        difference() {
       
            translate([0, 0, X_SUPPORT_SCREW_HEIGHT / 2 -  SUPPORT_THICKNESS / 2]) cube([CARIAGE_WIDTH, SUPPORT_SCREW_SPACE + SUPPORT_BORDER * 2, SUPPORT_THICKNESS], center = true);
            
            translate ([0, SUPPORT_SCREW_SPACE / 3, X_SUPPORT_SCREW_HEIGHT / 2 -  SUPPORT_THICKNESS / 2]) cylinder(h = SUPPORT_THICKNESS, d = CABLE_ZIP_HOLE, center = true);
            translate ([0, - SUPPORT_SCREW_SPACE / 3, X_SUPPORT_SCREW_HEIGHT / 2 -  SUPPORT_THICKNESS / 2]) cylinder(h = SUPPORT_THICKNESS, d = CABLE_ZIP_HOLE, center = true);
            translate ([0, 0, X_SUPPORT_SCREW_HEIGHT / 2 -  SUPPORT_THICKNESS / 2]) cylinder(h = SUPPORT_THICKNESS, d = CABLE_ZIP_HOLE, center = true);
        }
    }
        
    /* Chamfer */
    translate ([CARIAGE_WIDTH - SUPPORT_THICKNESS/2, - (SUPPORT_WIDTH - 4) / 2, X_SUPPORT_SCREW_HEIGHT / 2 - SUPPORT_THICKNESS - CHAMFER_SIZE + 2]) rotate([180, 0, 90]) color("green") prism (SUPPORT_WIDTH - 4, CHAMFER_SIZE + 2, CHAMFER_SIZE + 2);
   
    /* Back plate */
    bl_touch_back_plate();
    
   translate([CARIAGE_WIDTH + SUPPORT_THICKNESS + SUPPORT_THICKNESS / 2 + BL_TOUCH_WIDTH/2 - BL_TOUCH_WIDTH/4 - SUPPORT_THICKNESS / 2, 0, -(SUPPORT_HEIGHT - X_SUPPORT_SCREW_HEIGHT / 2 - SUPPORT_THICKNESS / 2)]) bl_touch_plate();
}

bl_touch();



