translate([0, 0, -2]) import("CrossfireCanopy.stl", convexity=3);

// Back reinforcement
translate ([165, 43.5, 0])
hull () {
cube([5.2, 6, 14]);
translate ([0, 0, 14]) cube([4, 6, 14]);
translate ([0, 0, 28]) cube([3, 6, 4]);
translate ([0, 0, 32]) cube([1.5, 6, 4]);
}

translate ([165, 80, 0])
hull () {
cube([5.2, 6, 14]);
translate ([0, 0, 14]) cube([4, 6, 14]);
translate ([0, 0, 28]) cube([3, 6, 4]);
translate ([0, 0, 32]) cube([1.5, 6, 4]);
}


translate([49, 32, 0]) rotate([0, 0, 35]) 
hull () {
    cube([13, 6, 12]);
    translate([1.5, 0, 12]) cube([11.5, 6, 6]);
    translate([2.5, 0, 18]) cube([10.5, 6, 6]);
    translate([4, 0, 24]) cube([9, 6, 3]);
    translate([5.4, 0, 27]) cube([7.6, 6, 3]);
    translate([7, 0, 30]) cube([6, 6, 2]);
}

translate([46, 93, 0]) 
rotate([0, 0, - 35]) 
hull () {
    cube([13, 6, 12]);
    translate([1.5, 0, 12]) cube([11.5, 6, 6]);
    translate([2.5, 0, 18]) cube([10.5, 6, 6]);
    translate([4, 0, 24]) cube([9, 6, 3]);
    translate([5.4, 0, 27]) cube([7.6, 6, 3]);
    translate([7, 0, 30]) cube([6, 6, 2]);
}