HEIGHT = 25;
DIAMETER= 6.5;
INNER_HOLE_DIAMETER = 3.35;
INNER_HOLE_HEIGHT = 10;

$fn = 50;

difference() {
    union () {
        cylinder(h = HEIGHT, d = DIAMETER);
        translate([0, 0, HEIGHT]) resize([DIAMETER, DIAMETER, DIAMETER / 2]) sphere(d = DIAMETER);
    }
    cylinder(h = INNER_HOLE_HEIGHT, d = INNER_HOLE_DIAMETER);
    translate([0, 0, 12
  ]) rotate([0, 90, 0]) cylinder(h = DIAMETER + 2, d = 3, center = true);
}
