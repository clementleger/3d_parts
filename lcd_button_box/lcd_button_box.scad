use <roundedcube.scad>;

pcb_width = 70;
pcb_height = 87;
pcb_thickness = 1;
lcd_button_thickness = 6;
box_thickness = 2;
box_top_thickness = 2;

lcd_width = 51;
lcd_height = 19;
lcd_top_spacing = 14.5;

button_diameter = 36;
border_spacing = 4.5;
screw_diameter = 3;
screw_thickness = 2;
screw_spacing = 4.5;
screw_column_thickess = screw_diameter + (screw_thickness * 2);

/* Screws */
module top_screw() {
    translate([(pcb_width / 2) - screw_spacing, (pcb_height / 2) - screw_spacing, - (box_top_thickness / 2) + (pcb_thickness / 2)]) {
        difference()
        {   
            cylinder( h = lcd_button_thickness - pcb_thickness, d = screw_column_thickess, center = true, $fn=80) ;
            cylinder( h = lcd_button_thickness - pcb_thickness, d = screw_diameter, center = true, $fn=80) ;
        }
    }
}

module screws_hole() {
    top_screw();
    mirror([1,0,0]) top_screw();
    mirror([0,1,0]) top_screw();
    mirror([0,1,0]) mirror([1,0,0]) top_screw();
}


module box_top() {
    /* Main box */
    difference()
    {   
    color([1, 1, 0]) roundedcube([pcb_width + (box_thickness * 2), pcb_height + (box_thickness * 2), lcd_button_thickness + box_top_thickness], true, 1.75, "zmax");

    translate ([0, 0, - box_top_thickness/2])color([1, 0, 0]) cube([pcb_width, pcb_height, lcd_button_thickness], true);


    /* Button hole */
    translate([0, - (pcb_height / 2) + (button_diameter / 2) + border_spacing, 0]) cylinder( h = lcd_button_thickness + box_top_thickness, d = button_diameter, center = true, $fn=80);

    /* LCD hole */
    translate ([0, (pcb_height / 2) - (lcd_height / 2) - lcd_top_spacing, 0]) cube([lcd_width, lcd_height, lcd_button_thickness + box_top_thickness], true);
    }

    screws_hole();
}

box_top();

