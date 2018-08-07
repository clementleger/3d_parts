use <../common/roundedcube.scad>

PCB_WIDTH = 37;
PCB_HEIGHT = 57;
MODULE_THICKNESS = 20;

BOX_THICKNESS = 2;

USB_WIDTH = 10;
USB_HEIGHT = 5;

USB_Y_OFFSET = BOX_THICKNESS/2 + PCB_HEIGHT/2;
USB_X_OFFSET = -5;
USB_Z_OFFSET = USB_HEIGHT/2 - MODULE_THICKNESS/2 + 15;

CLIP_THICKNESS = 0.3;

LED_DIAMETER = 5;

RIBBON_HEIGHT = 8;
RIBBON_WIDTH = 18.5;

LED_X_OFFSET = LED_DIAMETER/2 - PCB_WIDTH/2 + 3;
LED_Y_OFFSET =  LED_DIAMETER/2 - PCB_HEIGHT/2 + 5;
LED_SPACING = 10;

module clips()
{
           /* Clips */
        translate([0, PCB_HEIGHT/2, 0])
        rotate([0, 90, 0]) cylinder(d = CLIP_THICKNESS * 2, h = PCB_WIDTH/2, center = true, $fn = 20);
        translate([0, -PCB_HEIGHT/2, 0])
        rotate([0, 90, 0]) cylinder(d = CLIP_THICKNESS * 2, h = PCB_WIDTH/2, center = true, $fn = 20);
        translate([PCB_WIDTH / 2, 0, 0])
        rotate([90, 0, 0]) cylinder(d = CLIP_THICKNESS * 2, h = PCB_WIDTH/2, center = true, $fn = 20);
        translate([-PCB_WIDTH / 2, 0, 0])
        rotate([90, 0, 0]) cylinder(d = CLIP_THICKNESS * 2, h = PCB_WIDTH/2, center = true, $fn = 20);    
}

module box() {
    difference() {
        roundedcube([PCB_WIDTH + 2 * BOX_THICKNESS, PCB_HEIGHT + 2 * BOX_THICKNESS, MODULE_THICKNESS + 2 * BOX_THICKNESS, ], true, 1.75, "z");

        translate ([0, 0, BOX_THICKNESS]) cube([PCB_WIDTH, PCB_HEIGHT, MODULE_THICKNESS + BOX_THICKNESS], true);
        
        translate([-USB_X_OFFSET, -USB_Y_OFFSET, USB_Z_OFFSET]) #roundedcube([USB_WIDTH, BOX_THICKNESS, USB_HEIGHT], true, 0.75, "y");

        translate([0, 0, MODULE_THICKNESS / 2 + BOX_THICKNESS / 2]) clips();   
    }
}

module cover() {
    difference() {
        cube([PCB_WIDTH-0.2, PCB_HEIGHT-0.2, BOX_THICKNESS], true);
        translate([LED_X_OFFSET, LED_Y_OFFSET, 0]) #cylinder(d = LED_DIAMETER, h = BOX_THICKNESS, center = true, $fn = 20);
        translate([LED_X_OFFSET, LED_Y_OFFSET + LED_SPACING, 0]) #cylinder(d = LED_DIAMETER, h = BOX_THICKNESS, center = true, $fn = 20);
        translate([LED_X_OFFSET, LED_Y_OFFSET + 2 * LED_SPACING, 0]) #cylinder(d = LED_DIAMETER, h = BOX_THICKNESS, center = true, $fn = 20);
        translate([RIBBON_WIDTH/2 - 2, - RIBBON_HEIGHT/2 + PCB_HEIGHT/2 - 2, 0]) cube([RIBBON_WIDTH, RIBBON_HEIGHT, BOX_THICKNESS], center = true);
    }
    clips();
}

box();
translate([0, 0, 20]) cover();