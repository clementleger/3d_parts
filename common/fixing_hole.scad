include <prism.scad>

module fixing_hole(thickness, in_diameter, out_diameter)
{
    difference () {
        cylinder(h = thickness, d = out_diameter);
        cylinder(h = thickness, d = in_diameter);
    }
}

module fixing_holes(width, height, thickness, in_diameter, out_diameter){
	fixing_hole(thickness, in_diameter, out_diameter);
	translate ([width, 0, 0]) fixing_hole(thickness, in_diameter, out_diameter);
	translate ([0, height, 0]) fixing_hole(thickness, in_diameter, out_diameter);
	translate ([width, height, 0]) fixing_hole(thickness, in_diameter, out_diameter);
}

OVERHANG_LENGTH = 0.3;
OVERHANG_HEIGHT = 1; 
BRACKET_SPACING = 2;

module fixing_bracket(thickness, pcb_thickness, length){
    cube([length, thickness, pcb_thickness + OVERHANG_HEIGHT]);
    translate([0, - OVERHANG_LENGTH , pcb_thickness + OVERHANG_HEIGHT / 4]) prism(length, OVERHANG_LENGTH, OVERHANG_HEIGHT / 4 * 3);
    translate([0, - OVERHANG_LENGTH , pcb_thickness + OVERHANG_HEIGHT / 4]) mirror([0, 0, 1]) prism(length, OVERHANG_LENGTH, OVERHANG_HEIGHT / 4);
}

module fixing_bracket_angle(thickness, pcb_thickness, length){
    fixing_bracket(thickness, pcb_thickness, length);
    translate([length + BRACKET_SPACING, -BRACKET_SPACING, 0]) rotate([0, 0, -90]) fixing_bracket(thickness, pcb_thickness, length);
}

module fixing_bracket_angle_side(width, thickness, pcb_thickness, length){
    fixing_bracket_angle(thickness, pcb_thickness, length);
    translate([-(width - 2 * (length + BRACKET_SPACING)), 0, 0]) mirror([1, 0, 0]) fixing_bracket_angle(thickness, pcb_thickness, length);
}


module fixing_brackets(width, height, thickness, pcb_thickness, length){
    translate([- (length + BRACKET_SPACING + thickness), -thickness, 0]) union() {
        fixing_bracket_angle_side(width, thickness, pcb_thickness, length);
        translate([0,  -height, 0]) mirror ([0, 1, 0]) fixing_bracket_angle_side(width, thickness, pcb_thickness, length);
    }
}

//fixing_holes(10, 20, 5, 3, 5);

//fixing_brackets(19, 23, 1, 1, 5);