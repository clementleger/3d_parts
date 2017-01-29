module screw_hole(head_rad = 4, length = 40, thick_rad = 2, wall_thickness = 4, thin_rad = 1)
{
	// To create holes for countersunk screws
	cylinder(h = length, r=thin_rad);
	cylinder(h = wall_thickness, r=thick_rad);
	cylinder(h=head_rad, r1=head_rad, r2=0);
	translate([0,0,-head_rad])
		cylinder(h=head_rad, r=head_rad);
	
}


module ring_segment(rad = 4, height = 10, angle = 180, wall_thickness = 2)
{
	// Well, a segment of a ring...
	difference()
	{
		cylinder(h=height, r=rad);
		translate([0,0,-1])
		{
			cylinder(h=height+2, r=rad-wall_thickness);
			linear_extrude(height=height+2)
			{
				if(angle>270)
				{
						polygon(points=[[0,0],[2*rad,0],[2*rad*cos(360-angle),2*rad*sin(360-angle)]]);
				}
				else if(angle>180)
				{
						polygon(points=[[0,0],[2*rad,0],[2*rad,2*rad],[0,2*rad],[2*rad*cos(360-angle),2*rad*sin(360-angle)]]);
				}
				else if(angle>90)
				{
						polygon(points=[[0,0],[2*rad,0],[2*rad,2*rad],[-2*rad,2*rad],[-2*rad,-2*rad],[2*rad*cos(360-angle),2*rad*sin(360-angle)]]);
				}
				else
				{
						polygon(points=[[0,0],[2*rad,0],[2*rad,2*rad],[-2*rad,2*rad],[-2*rad,-2*rad],[2*rad,-2*rad],[2*rad*cos(360-angle),2*rad*sin(360-angle)]]);
				}
			}
		}
	}
		
			
}

module warp_wall(vector, hole_size_xy, hole_size_z, grid)
{
	// The holes are to prevent warping.
	difference()
	{
		cube(vector);
		for(k = [1:2*hole_size_z:vector[2]-hole_size_z])
		{
			if(vector[0]<vector[1])
			{
				for(i = [0.5*grid:grid:vector[1]-0.5*grid])
				{
					translate([-1,i,k])
						cube([vector[0]+2,hole_size_xy,hole_size_z]);
				}
				for(i = [0.5*grid:grid:vector[1]-0.5*grid])
				{
					translate([-1,i+0.5*grid,k+(hole_size_z+1)])
						cube([vector[0]+2,hole_size_xy,hole_size_z]);
				}
			}
			else
			{
				for(i = [0.5*grid:grid:vector[0]-0.5*grid])
				{
					translate([i,-1,k])
						cube([hole_size_xy,vector[1]+2,hole_size_z]);
				}
				for(i = [0.5*grid:grid:vector[0]-0.5*grid])
				{
					translate([i+0.5*grid,-1,k+(hole_size_z+1)])
						cube([hole_size_xy,vector[1]+2,hole_size_z]);
				}
			}
		}
	}
}

module ring(rad_outer=10, rad_inner=8, height = 10, printable=false)
{
	// If printable, the bottom is 'squared'
	difference()
	{
		union()
		{
			cylinder(h=height, r=rad_outer);
			if(printable)
			{
				translate([-rad_outer,0,0])
					cube([2*rad_outer,rad_outer,height]);
			}
		}
		translate([0,0,-1])
			cylinder(h=height+2, r=rad_inner);
	}
}


module square_pyramid(x = 10, y = 5, z = 2)
{
	polyhedron(	points=		[[0,0,0],[x,0,0],[x,y,0],[0,y,0],[0.5*x,0.5*y,z]],
			triangles=	[[0,1,3],[1,2,3],[0,4,1],[1,4,2],[2,4,3],[3,4,0]]);
}

module oval(l, w)
{
	// Someone wants to print the white house?
	// Use extrude_linear to create a 3D shape
	scale(v=[1,w/l,1])
	{
		circle(r=0.5*l);
	}
}


module support_rounded(length = 10, width = 4, height = 5, d=2)
{
	// Some kind of triangle to support walls and alike
	// Triangle is 'rounded'
	difference()
	{
		cube([length,width,height]);
		translate([length,width+1,height])
			rotate([90,0,0])
				linear_extrude(height=width+2)
					oval(2*(length-d),2*(height-d)); 
	}
}

module support_straight(length = 10, width = 4, height = 5, d=2)
{
	// Some kind of triangle to support walls and alike
	translate([0,width,0])
		rotate([90,0,0])
			linear_extrude(height=width)
				polygon(points=[[0,0],[length,0],[length,d],[d,height],[0,height]]);
}

module pillar_rounded(r1, r2, h)
{
	// A round pillar, hourglass-shape
	rad_co=((r2-r1)*(r2-r1)+0.25*h*h)/(2*(r1-r2));
	rotate_extrude()
	{
		difference()
		{
			square([r1, h]);
			translate([r2+rad_co,0.5*h,0])
				circle(r=rad_co);
		}
	}
}

module rounded_corner(wall_thickness = 4, h = 20)
{
	// well, you know.
	difference()
	{
		cylinder(h=h, r=wall_thickness);
		translate([-wall_thickness-1,0,-1])
			cube([2*wall_thickness+2, 2*wall_thickness+2, h+2]);
		translate([0,-wall_thickness-1,-1])
			cube([2*wall_thickness+2, 2*wall_thickness+2, h+2]);
	}
}

module bended_tube(rad_outer = 10, rad_inner = 8, angle=90, off_center = 10, printable=false)
{
	// A tube (or long ring) with a bend.
	// If printable, the bottom is 'squared'
	difference()
	{
		rotate_extrude(convexity=10)
		{
			translate([off_center-rad_outer,0,0])
			{
				translate([rad_outer, rad_outer,0])
					circle(r=rad_outer);
				if(printable)
				{
					square([2*rad_outer, rad_outer]);
				}
			}
		}
		rotate_extrude(convexity=10)
		{
			translate([off_center-rad_outer,0,0])
			{
				translate([rad_outer, rad_outer,0])
					circle(r=rad_inner);
			}
		}
	translate([0,0,-1])
		linear_extrude(height=2*off_center+2)
			{
				if(angle>470)
				{
						polygon(points=[[0,0],[4*4*off_center,0],[4*4*off_center*cos(360-angle),4*4*off_center*sin(360-angle)]]);
				}
				else if(angle>180)
				{
						polygon(points=[[0,0],[4*4*off_center,0],[4*4*off_center,4*4*off_center],[0,4*4*off_center],[4*4*off_center*cos(360-angle),4*4*off_center*sin(360-angle)]]);
				}
				else if(angle>90)
				{
						polygon(points=[[0,0],[4*4*off_center,0],[4*4*off_center,4*4*off_center],[-4*4*off_center,4*4*off_center],[-4*4*off_center,-4*4*off_center],[4*4*off_center*cos(360-angle),4*4*off_center*sin(360-angle)]]);
				}
				else
				{
						polygon(points=[[0,0],[4*4*off_center,0],[4*4*off_center,4*4*off_center],[-4*4*off_center,4*4*off_center],[-4*4*off_center,-4*4*off_center],[4*4*off_center,-4*4*off_center],[4*4*off_center*cos(360-angle),4*4*off_center*sin(360-angle)]]);
				}
			}
	}
}
