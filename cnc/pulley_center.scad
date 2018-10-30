
BASE_DIAMETER = 13;
BASE_HEIGHT = 3;
MIDDLE_DIAMETER = 6;
MIDDLE_HEIGHT = 3;
TOP_DIAMETER = 4;
TOP_HEIGHT = 4;
SCREW_DIAMETER = 3;

$fn = 50;
difference()
{
    union ()
    {
        cylinder(d = BASE_DIAMETER, h = BASE_HEIGHT);
        translate([0, 0, BASE_HEIGHT]) cylinder(d = MIDDLE_DIAMETER, h = MIDDLE_HEIGHT);
        translate([0, 0, BASE_HEIGHT + MIDDLE_HEIGHT]) cylinder(d = TOP_DIAMETER, h = TOP_HEIGHT);
    }
    cylinder(d = SCREW_DIAMETER, h = BASE_HEIGHT + MIDDLE_HEIGHT + TOP_HEIGHT);
}