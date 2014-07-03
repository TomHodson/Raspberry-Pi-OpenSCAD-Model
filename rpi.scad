//everything in mm

use <pin_headers.scad>;

width = 56;
length = 85;
height = 1.5;


module ethernet ()
	{
	//ethernet port
	color("silver")
	translate([length-20,1.5,height]) cube([21.2,16,13.3]); 
	}


module usb ()
	{
	//usb port
	color("silver")
	translate([length-9.5,25,height]) cube([17.3,13.3,16]);
	}

module composite ()
	{
	//composite port
	translate([length-43.6,width-12,height])
		{
		color("yellow")
		cube([10,10,13]);

		translate([5,19,8])
		rotate([90,0,0])
		color([.9,.9,.9])
		cylinder(h = 9.3, r = 4.15, $fs=.5);
		}
	}

module audio ()
	{
	//audio jack
	translate([length-26,width-11.5,height])
		{
		color([.4,.4,.95])
		cube([12.1,11.5,10.1]);
		translate([6,11.5,10.1-(6.7/2)])
		rotate([-90,0,0])
		color([.4,.4,.95])
		cylinder(h = 3.5, r = 6.7/2, $fs=.5);
		}
	}


module gpio ()
	{
	//headers
	rotate([0,0,180])
	translate([-1,-width+6,height])
	off_pin_header(rows = 13, cols = 2);
	}

module hdmi ()
	{
	color ("silver")
	translate ([37.1,-1,height])
	cube([15.1,11.7,8-height]);
	}

module power ()
	{
	color("silver")
	translate ([-0.8,3.8,height])
	cube ([5.6, 8,4.4-height]);
	}

module sd ()
	{
	color ([0,0,0])
	translate ([0.9, 15.2,-5.2+height ])
	cube ([16.8, 28.5, 5.2-height]);

	color ([.2,.2,.7])
	translate ([-17.3,17.7,-2.9])
	cube ([32, 24, 2] );
	}

module mhole ()
	{
	cylinder (r=3/2, h=height+.2, $fs=0.1);
	}

module pcb ()
	{
		difference ()
		{
		color([0.2,0.5,0])
		linear_extrude(height = height)
		square([length,width]); //pcb
		translate ([25.5, 18,-0.1]) mhole (); 
		translate ([length-5, width-12.5, -0.1]) mhole (); 
		}
	}

module leds()
	{
		// act
		color([0.9,0.1,0,0.6])
		translate([length-11.5,width-7.55,height]) led();
		// pwr
		color([0.9,0.1,0,0.6])
		translate([length-9.45,width-7.55,height]) led();

		// fdx
		color([0.9,0.1,0,0.6])
		translate([length-6.55,width-7.55,height]) led();
		// lnk
		color([0.9,0.1,0,0.6])
		translate([length-4.5,width-7.55,height]) led();
		// 100
		color([0.9,0.1,0,0.6])
		translate([length-2.45,width-7.55,height]) led();
	}
module led()
	{
		cube([1.0,1.6,0.7]);
	}

module rpi ()
	{
		pcb ();
		ethernet ();
		usb (); 
		composite (); 
		audio (); 
		gpio (); 
		hdmi ();
		power ();
		sd ();
		leds ();
	}

rpi (); 
