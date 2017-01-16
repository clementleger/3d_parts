include <../common/roundedcube.scad>;

THICKNESS = 7.8;
NEMA17_WIDTH = 42;
NEMA17_HOLE_DIAMETER = 25;
SCREW_DIAMETER = 3.5;
NEMA17_SCREW_SPACING = 31;
FRAME_HOLE_SPACING = 20;

INSERT_SIZE = 7.7;
INSERT_HOLE_SIZE = INSERT_SIZE + 10;
INSERT2_SIZE = THICKNESS * 2 - INSERT_SIZE;
NUT_SIZE = 6;
NUT_THICKNESS = 2;

module nema_hole () {
    translate ([NEMA17_SCREW_SPACING/2, NEMA17_SCREW_SPACING/2, 0]) cylinder(h = THICKNESS, d = SCREW_DIAMETER, center = true);
}

module nema_holes() {
        nema_hole();
        mirror ([1, 0, 0]) nema_hole();
        mirror ([1, 1, 0]) nema_hole();
        mirror ([0, 1, 0]) nema_hole();
}

module frame_hole() 
{
    translate([FRAME_HOLE_SPACING / 2, 0, 0]) rotate ([90, 0, 0]) cylinder(h = INSERT_HOLE_SIZE, d = SCREW_DIAMETER, center = true);
}

module frame_holes()
{
    translate([0, NEMA17_WIDTH / 2 + INSERT_SIZE - INSERT_HOLE_SIZE / 2 + 1, 0])
    union (){
        frame_hole();
        mirror([1, 0, 0]) frame_hole();
    }
}


module nut_hole() 
{
    translate([FRAME_HOLE_SPACING / 2, 0, 0]) cube([NUT_SIZE, NUT_THICKNESS, THICKNESS], center = true);
}

module nut_holes() 
{
    translate([0, NEMA17_WIDTH / 2, 0])
    union (){
        nut_hole();
        mirror([1, 0, 0]) nut_hole();
    }
}


difference () {
    union () {
        difference () {
            roundedcube ([NEMA17_WIDTH, NEMA17_WIDTH, THICKNESS], true, 2, "z");
            cylinder(h = THICKNESS, d = NEMA17_HOLE_DIAMETER, center = true);
            nema_holes();
        }



        translate ([0, NEMA17_WIDTH / 2 + INSERT_SIZE / 2, 0])  
        difference () {
            cube ([35, INSERT_SIZE, THICKNESS], center = true);
        }
        translate ([0, NEMA17_WIDTH / 2 + INSERT_SIZE + INSERT2_SIZE / 2, 0])  cube ([9.7, INSERT2_SIZE, THICKNESS], center = true);
    }
    
    color("green") frame_holes() ;
    color ("yellow") nut_holes();
}
