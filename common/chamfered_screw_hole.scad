module chamfered_screw_hole(screw_diameter, screw_length, head_diameter, head_length)
{
    cylinder(h = screw_length,d = screw_diameter);
    translate([0, 0, screw_length]) cylinder(h = head_length,d2 = head_diameter, d1 = screw_diameter);
}
