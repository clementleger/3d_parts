use <../common/chamfered_screw_hole.scad>;

// Ball joint in SCAD by Erik de Bruijn
// Based on a design by Makerblock ( http://makerblock.com/2010/03/blender-help/ )
size=7; // size of the ball joint
joint_spacing =0.01; // some space between them?
joint_thickness = 2; // thickness of the arms
joint_arms = 6; // how many arms do you want?
arm_width = 3; // actually: how much is removed from the arms Larger values will remove more

threaded_rod_diameter = 8;

//render settings
$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice

//ball();
joint();
//demo(); // turn on animation, FPS 15, steps 200
module demo()
{
ball();
rotate([sin($t*720)*28,cos($t*360*4)*28,cos($t*360*2)*20]) joint();

}
module print()
{
  translate([size*2+10,0,0]) ball();
  rotate([0,180,0]) joint();
}

module ball()
{
    difference() {
        union() {
            sphere(r=size);
            translate([0,0,-size]) cylinder(r1=6,r2=5.5,h=3);
            translate([0,0,-size-3]) cylinder(r=6,h=3);
        }
        translate([0, 0, -6]) cylinder(d = threaded_rod_diameter, h = size * 2, center = true);
    }
}

SCREW_HEAD_SIZE = 2;
SCREW_HEAD_DIAMETER = 8;
SCREW_DIAMETER = 4;
SCREW_SIZE = 10;

module joint()
{
    difference() {
    union() {
        difference()
        {
            sphere(r=size+joint_spacing+joint_thickness);
            sphere(r=size+joint_spacing);
            translate([0,0,-size-3.5]) cube([size+joint_spacing+joint_thickness+25,size+joint_spacing+joint_thickness+25,18],center=true);
            for(i=[0:joint_arms])
            {
                rotate([0,0,360/joint_arms*i]) translate([-arm_width/2,0, -size/2-4])
                    cube([arm_width,size+joint_spacing+joint_thickness+20,size+6]);
            }
        }
        difference() {
            
            translate([0,0,size-1]) cylinder(r=6,h=5);
            sphere(r=size+joint_spacing);

        }
    }
        translate([0, 0, SCREW_HEAD_SIZE + SCREW_SIZE +size + 1  ]) union() {
     mirror([0, 0, 1]) chamfered_screw_hole(SCREW_DIAMETER, SCREW_SIZE, SCREW_HEAD_DIAMETER, SCREW_HEAD_SIZE);
    translate([0, 0, -SCREW_HEAD_SIZE - SCREW_SIZE - 8]) cylinder(d = SCREW_HEAD_DIAMETER, h=8);
    }
}
}