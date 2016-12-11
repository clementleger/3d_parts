include <roundedcube.scad>;

roundedcube([3.5, 11, 4], true, 1.75, "z");

scale([1,1,0.2]) roundedcube([4, 12, 2], true, 1.75, "zmin");

translate([0,0,2.5])
scale([1,1,0.1])
roundedcube([6, 15, 2], true, 3, "zmin" );
