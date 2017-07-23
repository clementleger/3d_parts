include <../common/roundedcube.scad>

WISC_CUBE_WIDTH = 27;

module box () {
    difference() {
        roundedcube([WISC_CUBE_WIDTH, WISC_CUBE_WIDTH, WISC_CUBE_WIDTH], center = true, radius = 0.5);
translate ([-WISC_CUBE_WIDTH/2, -WISC_CUBE_WIDTH / 2, WISC_CUBE_WIDTH / 2])rotate ([0, 45, 0]) cube([sqrt(pow(WISC_CUBE_WIDTH, 2) * 2), WISC_CUBE_WIDTH , WISC_CUBE_WIDTH]);

    }
}


rotate ([0, 135, 0]) box();
