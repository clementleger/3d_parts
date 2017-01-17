include <../common/roundedcube.scad>;
include <../common/prism.scad>;

WHEEL_WIDTH = 28;
WHEEL_THICKNESS = 70;

PLATE_THICKNESS = 8;
PLATE_WIDTH = WHEEL_WIDTH + 2 * PLATE_THICKNESS;
PLATE_HEIGHT = 110;
HOOK_THICKNESS = 40;

SCREW_SIZE = 5;
SCREW_HEAD_SIZE = 8;
SCREW_HEAD_THICKNESS = 3;

$fn = 100;

/**
 * Module PIE
 * @copyright  Chris Petersen, 2013
 * @license    http://creativecommons.org/licenses/LGPL/2.1/
 * @license    http://creativecommons.org/licenses/by-sa/3.0/
 *
 * @see        http://www.thingiverse.com/thing:109467
 * @source     https://github.com/dotscad/dotscad/blob/master/pie.scad
 *
 * @param float radius Radius of the pie
 * @param float angle  Angle (size) of the pie to slice
 * @param float height Height (thickness) of the pie
 * @param float spin   Angle to spin the slice on the Z axis
 */

module pie(radius, angle, height, spin=0) {
    // Negative angles shift direction of rotation
    clockwise = (angle < 0) ? true : false;
    // Support angles < 0 and > 360
    normalized_angle = abs((angle % 360 != 0) ? angle % 360 : angle % 360 + 360);
    // Select rotation direction
    rotation = clockwise ? [0, 180 - normalized_angle] : [180, normalized_angle];
    // Render
    if (angle != 0) {
        rotate([0,0,spin]) linear_extrude(height=height)
            difference() {
                circle(radius);
                if (normalized_angle < 180) {
                    union() for(a = rotation)
                        rotate(a) translate([-radius, 0, 0]) square(radius * 2);
                }
                else if (normalized_angle != 360) {
                    intersection_for(a = rotation)
                        rotate(a) translate([-radius, 0, 0]) square(radius * 2);
                }
            }
    }
}

module hook(hook_diameter, hook_thickness, hook_width, hook_angle, hook_tail, hook_end_diameter)
{
	translate([(hook_diameter+hook_thickness)/2, 0, 0])
	union()
	{
		// round hook
		difference ()
		{
			// outside cylinder
			cylinder( h = hook_width, d = hook_diameter+hook_thickness*2, center = true);	
				
			// inside cylinder
			cylinder( h = hook_width+1, d = hook_diameter, center = true);
		
			// difference pie
			translate ([0,0,-hook_width/2-0.5])
			pie (hook_angle+hook_thickness+1, 360-hook_angle,hook_width+1, 180);
		}
	
		// tail
		translate([-(hook_diameter+hook_thickness)/2*cos(hook_angle), (hook_diameter+hook_thickness)/2*sin(hook_angle), 0])
		rotate([0, 0, 180-hook_angle])
		{
			// tail body
			translate([0, -hook_tail/2, 0])
			cube([hook_thickness,hook_tail,hook_width], center = true);
			// round end tail
			translate([(hook_end_diameter-hook_thickness)/2, -hook_tail, 0])
			cylinder( h = hook_width, d = hook_end_diameter, center = true, $fn=30);
		}
	}
}

module rounded_joint () {
    difference () {
color ("orange") translate([-PLATE_HEIGHT / 2, PLATE_WIDTH / 2 -  PLATE_THICKNESS * 2, PLATE_THICKNESS/2]) cube ([PLATE_HEIGHT, PLATE_THICKNESS, PLATE_THICKNESS]);

color ("red") translate([- PLATE_HEIGHT / 2, PLATE_WIDTH / 2 -  PLATE_THICKNESS * 2,  PLATE_THICKNESS + PLATE_THICKNESS / 2]) rotate ([0, 90, 0]) cylinder(h = PLATE_HEIGHT, d = PLATE_THICKNESS * 2 + 0.8);
    
        translate ([- (PLATE_HEIGHT / 2) + HOOK_THICKNESS , 0 , WHEEL_THICKNESS + PLATE_THICKNESS / 2]) rotate([180, 0, 90]) color("green") prism(PLATE_THICKNESS * 3, PLATE_HEIGHT - HOOK_THICKNESS, WHEEL_THICKNESS);
}

}

module hook_plate() {
    difference () {
    union (){
        cube ([PLATE_HEIGHT, PLATE_WIDTH, PLATE_THICKNESS], center = true);

    }
        translate([-10, 0, - PLATE_THICKNESS / 2]) cylinder(h = PLATE_THICKNESS, d = SCREW_SIZE); 
        translate([-10, 0, PLATE_THICKNESS / 2 - SCREW_HEAD_THICKNESS]) cylinder(h = PLATE_THICKNESS, d = SCREW_HEAD_SIZE); 
        translate([PLATE_HEIGHT / 2 - 15, 0, - PLATE_THICKNESS / 2]) cylinder(h = PLATE_THICKNESS, d = SCREW_SIZE); 
        translate([PLATE_HEIGHT / 2 - 15, 0, PLATE_THICKNESS / 2 - SCREW_HEAD_THICKNESS]) cylinder(h = PLATE_THICKNESS, d = SCREW_HEAD_SIZE); 
    }

}

module hook_arm () {
    difference() {
        translate ([PLATE_HEIGHT / 2, PLATE_WIDTH / 2 - PLATE_THICKNESS, PLATE_THICKNESS / 2]) rotate([0, 0, 90]) prism(PLATE_THICKNESS, PLATE_HEIGHT - HOOK_THICKNESS, WHEEL_THICKNESS);
     scale ([0.6, 1, 0.6]) translate ([PLATE_HEIGHT / 2, PLATE_WIDTH / 2 - PLATE_THICKNESS, PLATE_THICKNESS * 2]) rotate([0, 0, 90]) prism(PLATE_THICKNESS, PLATE_HEIGHT - HOOK_THICKNESS, WHEEL_THICKNESS);
}

    difference () {
        translate ([- PLATE_HEIGHT / 2 + HOOK_THICKNESS / 2, PLATE_WIDTH / 2 - PLATE_THICKNESS / 2, WHEEL_THICKNESS / 2 + PLATE_THICKNESS / 2]) cube ([HOOK_THICKNESS, PLATE_THICKNESS, WHEEL_THICKNESS], center = true);
    }
    translate([- PLATE_HEIGHT / 2 + HOOK_THICKNESS / 2,PLATE_WIDTH / 2 - PLATE_THICKNESS / 2, WHEEL_THICKNESS + PLATE_THICKNESS / 2 - 2]) rotate ([95, 1, -90]) hook(WHEEL_WIDTH, PLATE_THICKNESS, HOOK_THICKNESS, 180, 0, 10);
}

module bike_hook() {
    hook_plate();
    hook_arm();
    rounded_joint();
}

difference() {
    bike_hook();
    translate([-(PLATE_HEIGHT / 2 + 5), 0, 0 ]) cube([10, 200, 200], center = true); 
}