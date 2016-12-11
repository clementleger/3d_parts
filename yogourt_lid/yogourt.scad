use <threads.scad>

lid_height = 15;
inner_diameter = 63;
lid_thickness = 1.5;
thread_thickness = 2;
/* Lid itself */
difference() {
cylinder( h = lid_height, d = inner_diameter + (lid_thickness * 2), center = true, $fn=80);
color([1, 0, 0]) translate([0, 0, -(lid_height / 2 - lid_thickness)]) metric_thread (diameter=inner_diameter, pitch=4, length=lid_height - lid_thickness, internal=false, n_starts=4, thread_size=thread_thickness, groove=true, angle = 65);
}
