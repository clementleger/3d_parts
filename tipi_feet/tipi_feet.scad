FEET_HEIGHT = 35;
FEET_DIAMETER = 18.2;
FEET_THICKNESS = 2;

HOLE_DIAMETER = 4;
$fn = 100;
FULL_THICKNESS = FEET_DIAMETER + 2 * FEET_THICKNESS;
difference() {
    union() {
        cylinder(d = FULL_THICKNESS, h = FEET_HEIGHT);
        sphere(d = FULL_THICKNESS);
    }
    
    cylinder(d = FEET_DIAMETER, h = FEET_HEIGHT);
   translate([0, FULL_THICKNESS/2, - HOLE_DIAMETER]) #rotate([90, 0, 0]) cylinder(d = HOLE_DIAMETER, h =  FULL_THICKNESS);
    
}