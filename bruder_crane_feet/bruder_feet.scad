include <../common/roundedcube.scad>;

THREAD_THICKNESS = 2.5;
THREAD_SPACING = 4;
THREAD_HEIGHT = 5;

PAD_WIDTH = 31;
PAD_BORDER_THICKNESS = 0.5;
PAD_BORDER_WIDTH = 1.5;
PAD_THICKNESS= 2;

FEET_HEIGHT = 75 - PAD_THICKNESS/2;
FEET_DIAMETER = 15;
FEET_INNER_DIAM = 13;

$fn = 20;


module node(pos, d, fn=4) {
  if (pos[0]!=undef && pos[1] != undef && pos[2] != undef){ 
    translate(pos) sphere(d=d, $fn = fn);    
  }
}

/**
* An edge (or line) between 2 nodes
*/
module line(start, end, d, fn=4) {
  hull() {
    node(start,d, fn);
    node(end,d, fn);
  }      
}

module spring(d, dBottom=6, dTop=6, windings=2, height=10, steps=10, wireDiameter=1,fn=10) {
    // we use either d or dBottom&dTop
    r0 = d != undef ? d/2 : dBottom/2;
    r1 = d != undef ?d/2 : dTop/2;
    
    rx = (r0-r1) / (360.0*windings);    
    heightPerDegree = height/windings/360;
    
    for ( angle = [steps : steps : 360*windings] ){
        r = r0 - (angle * rx); 
        x0=r*cos(angle-steps);
        y0=r*sin(angle-steps);
        z0=(angle-steps)*heightPerDegree;
        x=r*cos(angle);
        y=r*sin(angle);
        z=angle*heightPerDegree;

        line([x0,y0,z0],[x,y,z],d=wireDiameter,fn=fn);        
    }
}

module feet_base() {
    difference() {
        cylinder(h = FEET_HEIGHT, d = FEET_DIAMETER, $fn = 40);
        cylinder(h = FEET_HEIGHT, d = FEET_INNER_DIAM, $fn = 40);
    }
    difference() {
        translate([0, 0, FEET_HEIGHT - THREAD_HEIGHT - THREAD_THICKNESS])  
spring(FEET_INNER_DIAM, steps=10, height = THREAD_HEIGHT, windings = 1, wireDiameter = THREAD_THICKNESS);
        difference() {
            cylinder(h = FEET_HEIGHT, d = FEET_DIAMETER * 2, $fn = 40);
            cylinder(h = FEET_HEIGHT, d = FEET_DIAMETER, $fn = 40);
        }
    }
    difference() {
        roundedcube([PAD_WIDTH, PAD_WIDTH, PAD_THICKNESS*2], center = true, radius = 1.5, apply_to = "zmin");
        translate([0, 0, PAD_THICKNESS]) cube([PAD_WIDTH, PAD_WIDTH, PAD_THICKNESS *2], center = true);
    }
    
    difference() {
    #translate([0, 0, PAD_BORDER_THICKNESS/2]) cube([PAD_WIDTH, PAD_WIDTH, PAD_BORDER_THICKNESS *2], center = true);
    #translate([0, 0, PAD_BORDER_THICKNESS/2]) cube([PAD_WIDTH - PAD_BORDER_WIDTH*2, PAD_WIDTH - PAD_BORDER_WIDTH*2, PAD_BORDER_THICKNESS *2], center = true);
    }
}


module support() {
    difference() {
        hull() {
            sphere(d = 7);
            translate([PAD_WIDTH/2, 0, 0]) sphere(d = 1);
            translate([0, 0, 10]) sphere(d = 4);
        }
        translate([-50, -50, -100]) cube([100, 100, 100]);
        translate([-100, -50, 0]) cube([100, 100, 100]);

    }
}

module feet() {
    feet_base();
    rotate ([0, 0, 45]) translate([FEET_INNER_DIAM/2 - 2, 0, 0]) support();
    rotate ([0, 0, 90 + 45]) translate([FEET_INNER_DIAM/2 - 2, 0, 0]) support();
    rotate ([0, 0, -45]) translate([FEET_INNER_DIAM/2 - 2, 0, 0]) support();
    rotate ([0, 0, -90 - 45]) translate([FEET_INNER_DIAM/2 - 2, 0, 0]) support();
}

module feet_cropped()
{

    OFFSET = sqrt(PAD_WIDTH*PAD_WIDTH + PAD_WIDTH*PAD_WIDTH);
    
    difference() {
        feet();
    #rotate([0, 0, 45]) translate([0, OFFSET/2 + 5 - 1.3, 0])cube([10, 10, PAD_THICKNESS*2], center = true);
    rotate([0, 0, 90 + 45]) translate([0, OFFSET/2 + 5 - 1.3, 0])cube([10, 10, PAD_THICKNESS*2], center = true);
    rotate([0, 0, -45]) translate([0, OFFSET/2 + 5 - 1.3, 0])cube([10, 10, PAD_THICKNESS*2], center = true);
    rotate([0, 0, -90 - 45]) translate([0, OFFSET/2 + 5 - 1.3, 0])cube([10, 10, PAD_THICKNESS*2], center = true);
    }
}

feet_cropped();
