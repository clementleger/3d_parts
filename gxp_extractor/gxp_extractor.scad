OUTER_DIAM = 54;
INNER_DIAM = 38;
SCREW_ROD_DIAM = 9;
TOOL_HEIGHT = 20;
$fn = 80;

module external_extractor()
{
    difference() {
        union() {
            translate([0, 0, TOOL_HEIGHT])
            intersection () {
                cylinder(d = OUTER_DIAM, h = TOOL_HEIGHT);
                import(file = "HALLOWTECH_2.stl");
            }

            cylinder(d1 = OUTER_DIAM/6*5, d2 = OUTER_DIAM, h = TOOL_HEIGHT);
        }
        translate([0, 0, TOOL_HEIGHT]) cylinder(d = INNER_DIAM, h = 15);
        translate([0, 0, TOOL_HEIGHT/3]) cylinder(d1 = SCREW_ROD_DIAM, d2 = INNER_DIAM, h = TOOL_HEIGHT/3 * 2);
        cylinder(d = SCREW_ROD_DIAM, h = TOOL_HEIGHT/3);
    }
}

EXT_THICKNESS = 1.5;
INNER_THICKNESS = 4;
OUTER_THICKNESS = 8;

module internal_extractor(diam)
{
    difference() {
        union() {
            cylinder(d = diam + 2 * EXT_THICKNESS, h = OUTER_THICKNESS);
            translate([0, 0, OUTER_THICKNESS]) cylinder(d = diam, h = INNER_THICKNESS);
        }
        cylinder(d = SCREW_ROD_DIAM, h = OUTER_THICKNESS + INNER_THICKNESS);
    }
}


external_extractor();


//internal_extractor(24);