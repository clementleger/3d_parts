
LABEL_HOLDER_WIDTH = 60;
LABEL_HOLDER_HEIGHT = 35;
LABEL_HOLDER_THICKNESS = 2;
LABEL_HOLDER_ROUND_SIZE= 3;

LABEL_THICKNESS = 0.5;
LABEL_CLIP_THICKNESS = 0.5;

LABEL_CLIP_LENGTH= 3;

$fn = 100;




module label_holder_base() {
    difference() {
    resize([LABEL_HOLDER_ROUND_SIZE*2, LABEL_HOLDER_HEIGHT]) circle(d = 10);

    translate([0, -LABEL_HOLDER_HEIGHT/2]) square([LABEL_HOLDER_ROUND_SIZE, LABEL_HOLDER_HEIGHT]);
    }

    translate([0, -LABEL_HOLDER_HEIGHT/2]) square([LABEL_HOLDER_THICKNESS, LABEL_HOLDER_HEIGHT]);
}

module label_holder() {
    translate([-LABEL_THICKNESS - LABEL_CLIP_THICKNESS, 0])
    difference() {
    label_holder_base() ;
    offset(delta = -LABEL_CLIP_THICKNESS) label_holder_base() ;
       square([100, LABEL_HOLDER_HEIGHT - LABEL_CLIP_LENGTH * 2], center = true);
    }
    color("green") label_holder_base() ;
}

linear_extrude(height = LABEL_HOLDER_WIDTH) label_holder();