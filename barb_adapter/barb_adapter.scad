use <../common/threads.scad>

HOSE_INNER_DIAMETER = 8.6;
THREAD_SIZE = 10;
THREAD_DIAMETER = 15.8;
THREAD_OVERLAP = 15;

BOLT_HEIGHT = 5;
WALL_THICKNESS = 2;

$fn = 50;

difference() {
union() {
metric_thread (diameter=THREAD_DIAMETER, pitch = 1.34, length=THREAD_SIZE);
translate([0, 0, THREAD_SIZE]) cylinder(d = THREAD_DIAMETER + 2, h = BOLT_HEIGHT, $fn =6 );
translate([0, 0, THREAD_SIZE + BOLT_HEIGHT]) cylinder(d1 = THREAD_DIAMETER, d2 =  HOSE_INNER_DIAMETER + 1,  h = BOLT_HEIGHT);

translate([0, 0, THREAD_SIZE + BOLT_HEIGHT + BOLT_HEIGHT]) cylinder(d1 = HOSE_INNER_DIAMETER + 1, d2 =  HOSE_INNER_DIAMETER,  h = THREAD_OVERLAP);
}
cylinder(d = HOSE_INNER_DIAMETER - WALL_THICKNESS * 2, h =  THREAD_SIZE + BOLT_HEIGHT + BOLT_HEIGHT + THREAD_OVERLAP);

}