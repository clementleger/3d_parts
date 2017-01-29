/* chamfers for openscad
 *
 *
 * (c) alj_rprp 2013 license GPL2.1
 */

// interface :
// chamfer				(len,r,rs)           : rounding of edge along z
// cylinder_chamfer	(majr,r,rs)				: circular rounding 
// rnd_wedge 			(len,lr,angle,r,rs)  : wedge with 1 rounded angle
// circular_rnd_wedge(majr,lr,angle,r,rs) : circular wedge/ 1 rounded angle

// len	: length of extrusion
// r		: rounding radius
// majr	: major radius of circular extrusion
// lr		: dist from left side of rounding center
// angle	: angle of wedge
// rs		: resolution - number of lines in the rounding
//
// use rs =0 for straight line chamfer in both chamfers
// wedges will look funny with rs < 5 or 6


$fn=64; 

//example=true;
example=true;

if(example==true) {
	chamfer(1,1,rs=10);
//	translate([0,0,-1.5]) cylinder_chamfer(2.4,1,rs=2);
//	translate([4,0,0]) rnd_wedge (1,1,30.0,0.3,rs=10);
//	translate([4,0,-1.5]) 
//		circular_rnd_wedge (0.5,0.5,30.0,0.3,rs=10);
}


module cylinder_chamfer(majr,r,rs=4)
{
	t=majr-r;
	p=r+0.1;
	rotate_extrude()	difference(){
		translate([t,0])square([p,p]);
		translate([t,0])circle(r,$fn=(rs+1)*4);
	}
}

module chamfer(len, r, t = 0.1, rs=4)
{
	p = t + 0.1;
	linear_extrude(height=len) difference()
	{
		square([p,p]);
		circle(r,$fn=(rs+1)*4);
	}
}

/*
 * lr = position centre rayon
 *	x1 = x component hypothenuse normal
 * x2 = x component up to point
 *
 * x1 = rr*sin(a)
 * x2 = y2/tan(a)
 *	y2 = rr*cos(a)+rr  
 *
 * base = lr + x1 + x2
 * base = lr + rr*( sin(a)+(cos(a)+1)/tan(a) 
*/
module rnd_wedge (len,lr,angle,r,rs=6) {
	rr=r*(sin(angle)+(cos(angle)+1)/tan(angle));
	ratio=(lr+rr)/lr;
	base=lr*ratio;
	b=base*tan(angle);
	h=base/cos(angle);

	linear_extrude(height=len)union(){
		polygon([[0,0],[lr,0],[lr+r*sin(angle),r*(1+cos(angle))],[0,b]]);
		translate([lr,r])intersection() {
			circle(r,$fn=(rs+1)*4);
			translate([0,-r-0.05])square([r+0.1,2*r+0.1]);
		}
	}
}

module circular_rnd_wedge (majr,lr,angle,r,rs=6) {
	rr=r*(sin(angle)+(cos(angle)+1)/tan(angle));
	ratio=(lr+rr)/lr;
	base=lr*ratio;
	b=base*tan(angle);
	h=base/cos(angle);

	rotate_extrude()translate([majr,0]) union(){
		polygon([[0,0],[lr,0],[lr+r*sin(angle),r*(1+cos(angle))],[0,b]]);
		translate([lr,r])intersection() {
			circle(r,$fn=(rs+1)*4);
			translate([0,-r-0.05])square([r+0.1,2*r+0.1]);
		}
	}
}
