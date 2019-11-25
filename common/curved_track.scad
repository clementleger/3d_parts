
module curved_link(thickness, width, diam)
{
    
   difference () {
        union () {
            cylinder(d = diam, h = thickness);
            translate([0, -diam/2, 0]) cube([diam / 2, diam, thickness]);
        }

        cylinder(d = diam - width * 2, h = thickness);
        translate([0, -(diam- width * 2)/2, 0]) cube([diam, diam - width * 2, thickness]);
    }
}

module curved_path(thickness, width, diam, link_count)
{
    translate([-diam/4, 0, 0]) 
    for(link = [0 : link_count - 1]) {
        translate([0, link * ((diam  - width) * 2), 0]) {
            curved_link(thickness, width, diam);
            translate([diam/2, diam - width, 0]) mirror([1, 0, 0]) curved_link(thickness, width, diam);
        }
    }
}
