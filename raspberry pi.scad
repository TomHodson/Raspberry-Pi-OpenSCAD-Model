//everything in mm

use <pin_headers.scad>;

width = 56;
length = 85;
height = 1.6;

color([0,1,0]) import("pi.STL");


translate([-length/2,width/2 + 10,0])
{
color([0.2,0.5,0])
linear_extrude(height = 1.6)
square([length,width]); //pcb

//ethernet port
color("silver")
translate([length-20,1.5,height]) cube([21.2,16,13.3]); 

//usb port
color("silver")
translate([length-9.5,25,height]) cube([17.3,13.3,16]);

//composite port
translate([length-43.6,width-12,height]){
	color("yellow")
	cube([10,10,13]);
	translate([5,19,8])
	rotate([90,0,0])
	color("silver")
	cylinder(h = 9, r = 4.15);
}

//audio jack
translate([length-26,width-11.5,height]){
	color("yellow")
	cube([12,11.5,13]);
	translate([6,11.5,8])
	rotate([-90,0,0])
	color("silver")
	cylinder(h = 3.5, r = 4.15);
}

//headers
rotate([0,0,180])
translate([-1,-width+6,height])
off_pin_header(rows = 13, cols = 2);
}