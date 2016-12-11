use <threads.scad>

lid_height = 18;
smooth_height = 4;
inner_diameter = 63;
lid_thickness = 1.5;
thread_thickness = 2.5;
text_height = 0.5;
thread_height = lid_height - smooth_height - lid_thickness;
font_style = "Sugarpunch DEMO:style=Regular";
lid_text = "Yaourt !";
/* Lid itself */
difference() {
cylinder( h = lid_height, d = inner_diameter + (lid_thickness * 2), center = false, $fn=80);
color([0, 1, 0])  cylinder( h = smooth_height, d = inner_diameter, center = false, $fn=80);
color([1, 0, 0]) translate ([0, 0, smooth_height]) metric_thread (diameter=inner_diameter, pitch=4, length=thread_height, internal=false, n_starts=4, thread_size=thread_thickness, groove=true, angle = 68, leadin = 0);
color([1, 0, 1]) translate ([0, 0, lid_height - text_height]) linear_extrude(height = 0.5, center = false)  text(font= font_style, text = lid_text, halign = "center", valign = "center");
}