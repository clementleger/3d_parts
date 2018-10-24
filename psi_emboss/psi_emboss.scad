
scale([0.5, 0.5, 0.5]) {

    color("blue") import("Psi.stl", convexity=3);
    translate([60, 0, 0]) cube([190, 70, 4], center = true);
    translate([145, -19, 0]) color("green")  linear_extrude(10)  mirror(0, 0, 1) text("MF", size = 40, font = "Latin Modern Roman:style=10 Bold");
}