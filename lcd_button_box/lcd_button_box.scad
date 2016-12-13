use <roundedcube.scad>;

pcb_width = 70;
pcb_height = 87;
pcb_thickness = 6;
box_thickness = 1.5;
box_top_thickness = 1;

lcd_width = 50;
lcd_height = 19;
lcd_top_spacing = 15;

button_diameter = 35;
border_spacing = 4.5;
screw_diameter = 3;
screw_thickness = 2;
screw_spacing = 4.5;
screw_column_thickess = screw_diameter + (screw_thickness * 2);

/* Main box */
difference()
{   
color([1, 1, 0]) roundedcube([pcb_width + (box_thickness * 2), pcb_height + (box_thickness * 2), pcb_thickness + box_top_thickness], true, 1.75, "zmax");

translate ([0, 0, - box_top_thickness/2])color([1, 0, 0]) cube([pcb_width, pcb_height, pcb_thickness], true);


/* Button hole */
translate([0, - (pcb_height / 2) + (button_diameter / 2) + border_spacing, 0]) cylinder( h = pcb_thickness + box_top_thickness, d = button_diameter, center = true, $fn=80);

/* LCD hole */
translate ([0, (pcb_height / 2) - (lcd_height / 2) - lcd_top_spacing, 0]) cube([lcd_width, lcd_height, pcb_thickness + box_top_thickness], true);
}
/* Screws */
module screw() {
    translate([(pcb_width / 2) - screw_spacing - (screw_diameter  / 2), (pcb_height / 2) - screw_spacing - (screw_diameter / 2), - (box_top_thickness / 2)]) {
        difference()
        {   
            cylinder( h = pcb_thickness, d = screw_column_thickess, center = true, $fn=80) ;
            cylinder( h = pcb_thickness, d = screw_diameter, center = true, $fn=80) ;
        }
    }
}

screw();
mirror([1,0,0]) screw();
mirror([0,1,0]) screw();
mirror([0,1,0]) mirror([1,0,0]) screw();