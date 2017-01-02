use <roundedcube.scad>;
use <usb.scad>;

pcb_width = 70;
pcb_height = 87;
pcb_thickness = 1;
lcd_button_thickness = 6;
box_thickness = 1.5;
box_bottom_thickness = 25;

lcd_width = 51;
lcd_height = 19;
lcd_top_spacing = 14.5;
lcd_x_offset = 0.25;
button_x_offset = 1;

button_diameter = 36;
border_spacing = 4.5;
screw_diameter = 3;
screw_thickness = 2;
screw_spacing = 5.5;
screw_column_thickess = screw_diameter + (screw_thickness * 2);
bottom_screw_height = 5;
screw_head_diameter = 6;

y_reinforcement_count = 3;
x_reinforcement_count = 2;
reinforcement_thickness = 1.5;
reinf_start_spacing = 20;

module prism(l, w, h){
   polyhedron(
           points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
           );
}

/* Top Screws */
module top_screws_columns(height = 10) {
    translate([(pcb_width / 2) - screw_spacing, (pcb_height / 2) - screw_spacing, 0]) {
        difference()
        {   
            cylinder( h = height, d = screw_column_thickess, center = true, $fn=80) ;
            cylinder( h = height, d = screw_diameter, center = true, $fn=80) ;
        }
    }
}

module top_screw_holes(height = 10) {
    top_screws_columns(height);
    mirror([1,0,0]) top_screws_columns(height);
    mirror([0,1,0]) top_screws_columns(height);
    mirror([0,1,0]) mirror([1,0,0]) top_screws_columns(height);
}

/* Bottom Screws */
module bottom_screws_column(height = 10) {
    translate([(pcb_width / 2) - screw_spacing, (pcb_height / 2) - screw_spacing, 0]) {
        difference()
        {   
            union() {
                cylinder( h = height, d = screw_column_thickess, center = true, $fn=80);
                translate([0, 0, - (box_bottom_thickness / 2) + (bottom_screw_height / 2)]) cylinder( h = bottom_screw_height, d1 = screw_column_thickess + screw_spacing, d = screw_column_thickess + (screw_spacing / 2), center = true, $fn=80);
           }
            cylinder( h = height, d = screw_diameter, center = true, $fn=80);
        }
    }
}

module bottom_screw_columns(height = 10) {
    bottom_screws_column(height);
    mirror([1,0,0]) bottom_screws_column(height);
    mirror([0,1,0]) bottom_screws_column(height);
    mirror([0,1,0]) mirror([1,0,0]) bottom_screws_column(height);
}

module bottom_screws_hole(height = 10) {
    translate([(pcb_width / 2) - screw_spacing, (pcb_height / 2) - screw_spacing, 0]) {
            color([0, 1, 1]) cylinder( h = box_thickness, d1 = screw_head_diameter, d2 = screw_head_diameter, center = true, $fn=80);
        }
}

module bottom_screw_holes() {
    bottom_screws_hole();
    mirror([1,0,0]) bottom_screws_hole();
    mirror([0,1,0]) bottom_screws_hole();
    mirror([0,1,0]) mirror([1,0,0]) bottom_screws_hole();
}


module box_top() {
    /* Main box */
    difference()
    {   
    color([1, 1, 0]) roundedcube([pcb_width + (box_thickness * 2), pcb_height + (box_thickness * 2), lcd_button_thickness + box_thickness], true, 1.75, "zmax");

    translate ([0, 0, - box_thickness/2])color([1, 0, 0]) cube([pcb_width, pcb_height, lcd_button_thickness], true);


    /* Button hole */
    translate([button_x_offset, - (pcb_height / 2) + (button_diameter / 2) + border_spacing, 0]) cylinder( h = lcd_button_thickness + box_thickness, d = button_diameter, center = true, $fn=80);

    /* LCD hole */
    translate ([- lcd_x_offset, (pcb_height / 2) - (lcd_height / 2) - lcd_top_spacing, 0]) cube([lcd_width, lcd_height, lcd_button_thickness + box_thickness], true);
    }
    translate ([0, 0, - (box_thickness / 2) + (pcb_thickness / 2)]) top_screw_holes(lcd_button_thickness - pcb_thickness);
}

module bottom_side_y_reinforcement() {
        /* Small Y reinforcements */
    
    translate ([0, 0, (box_thickness / 2)]) {
        for(reinf_count = [0 : y_reinforcement_count - 1]) {
            reinf_length = (pcb_height - (reinf_start_spacing * 2));
            reinf_off = reinf_length / (y_reinforcement_count - 1);
            translate([pcb_width/2 - reinforcement_thickness/2, (reinf_length / 2) + - (reinf_off * reinf_count), 0]) color([0, 1, 0]) cube([reinforcement_thickness, reinforcement_thickness, box_bottom_thickness], true);
        }
    }
    translate ([(pcb_width/2), (pcb_height/2), (box_bottom_thickness / 2) - (reinforcement_thickness * 2 - reinforcement_thickness / 2)]) 
    rotate([90, 0, -90])
    prism(pcb_height, reinforcement_thickness * 2, reinforcement_thickness);
}

module bottom_side_x_reinforcement() {
    /* Small X reinforcements */
    
    translate ([0, 0, (box_thickness / 2)]) {
        for(reinf_count = [0 : x_reinforcement_count - 1]) {
            reinf_length = (pcb_width - (reinf_start_spacing * 2));
            reinf_off = reinf_length / (x_reinforcement_count - 1);
            translate([ -(reinf_length / 2) + reinf_off * reinf_count, (pcb_height / 2) - (reinforcement_thickness / 2), 0]) color([0, 1, 0]) cube([reinforcement_thickness, reinforcement_thickness, box_bottom_thickness], true);
        }
    }
    translate ([-(pcb_width / 2), (pcb_height / 2), (box_bottom_thickness / 2)  - (reinforcement_thickness * 2 - reinforcement_thickness / 2)]) 
    rotate([90, 0, 0])
    prism(pcb_width, reinforcement_thickness * 2, reinforcement_thickness);
}

module bottom_side_reinforcements() {

    bottom_side_y_reinforcement();
    mirror([1, 0, 0]) bottom_side_y_reinforcement();
    bottom_side_x_reinforcement();
    mirror([0, 1, 0]) bottom_side_x_reinforcement();
}



module box_bottom() {
    /* Main box */
    union() {
        difference()
        {   
            color([1, 1, 0]) roundedcube([pcb_width + (box_thickness * 2), pcb_height + (box_thickness * 2), box_bottom_thickness + box_thickness], true, 1.75, "zmin");

            translate ([0, 0, box_thickness/2]) color([1, 0, 0]) cube([pcb_width, pcb_height, box_bottom_thickness], true);
            
        translate ([0, 0,  - (box_bottom_thickness / 2)]) bottom_screw_holes();
        }
        bottom_side_reinforcements();
        translate ([0, 0, (box_thickness / 2)]) bottom_screw_columns(box_bottom_thickness);
    }
}

//box_top();
translate([0, 0, -40]) box_bottom();

