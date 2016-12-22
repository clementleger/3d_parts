// Parametric S-Hook
// Made by Lucian Brandus
// lucianbrandus@gmail.com
include <roundedcube.scad>

// User adjustable parameters
hook_thickness = 4;
hook_width = 25;

top_hook_diameter = 5;
top_hook_angle = 180;
top_hook_tail = 0;
top_hook_end_diameter = 4;

hook_trunk = 16;

bottom_hook_diameter = 5;
bottom_hook_angle = 160;
bottom_hook_tail = 0;
bottom_hook_end_diameter = 4;

$fn=60;

translate ([15, -2, 0])
rotate([0, 0, 45])
roundedcube([hook_thickness,8,hook_width], true, 1.75, "ymin");
rotate([0, 0, 90])
s_hook();


module s_hook()
{
	//top hook
	translate([0, hook_trunk/2, 0])
	hook (top_hook_diameter, hook_thickness, hook_width, top_hook_angle, top_hook_tail, top_hook_end_diameter);
	
	// trunk
	cube([hook_thickness,hook_trunk,hook_width], center = true);
	
	//bottom hook
	translate([0, -hook_trunk/2, 0])
	rotate([0, 0, 180])
    mirror([1,0,0 ])
	hook (bottom_hook_diameter, hook_thickness, hook_width, bottom_hook_angle, bottom_hook_tail, bottom_hook_end_diameter);
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