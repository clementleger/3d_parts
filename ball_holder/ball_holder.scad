include <../common/roundedcube.scad>;

HOLDER_LENGTH = 62;
HOLDER_WIDTH = 8;
HOLDER_HEIGHT = 12;
SUPPORT_DIAMETER = 7.5;
SUPPORT_SPACING = 36.5;

BALL_RUBBER_DIAMETER=5;
$fn = 25;


module holes()
{
    rotate ([90, 0, 0]) {
        translate([- SUPPORT_SPACING /2 - SUPPORT_DIAMETER / 2, 0 , 0]) cylinder(d = SUPPORT_DIAMETER, h = HOLDER_WIDTH, center = true);
        translate([ SUPPORT_SPACING /2 + SUPPORT_DIAMETER / 2, 0 , 0]) cylinder(d = SUPPORT_DIAMETER, h = HOLDER_WIDTH, center = true);
    }
}

module ball_rubber_holes()
{
    rotate ([90, 0, 0]) {
        translate([- BALL_RUBBER_DIAMETER / 3 - 0.5, 0 , 0]) cylinder(d = BALL_RUBBER_DIAMETER, h = HOLDER_WIDTH, center = true);
        translate([ BALL_RUBBER_DIAMETER / 3 + 0.5, 0 , 0]) cylinder(d = BALL_RUBBER_DIAMETER, h = HOLDER_WIDTH, center = true);
    }
}

difference() {
    roundedcube([HOLDER_LENGTH, HOLDER_WIDTH, HOLDER_HEIGHT], center = true, radius = 1.5);
    translate([0, 0 , HOLDER_HEIGHT / 3 - 2])  holes();
    translate([0, 0 , HOLDER_HEIGHT / 2])  holes();
    translate([0, 0 , -HOLDER_HEIGHT / 2]) ball_rubber_holes();
}