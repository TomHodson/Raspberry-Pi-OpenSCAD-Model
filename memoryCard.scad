// Memory Card Holder
// 4/3/2012

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
module box(width,length,height)
{
	cube([width,length,height]);
}

module negativeSpace()
{
translate([-3,1,0]) box(4,12,3);
box(33,14,3);
}

module minimalTolerances()
{
difference()
{
box(37,18,4);
translate([2,2,2]) negativeSpace();
}}

module shape()
{
box(37,18,4);
translate([0,-2,0]) box(37,22,4);
translate([37,9,0]) cylinder(4,11,11);
translate([4,0,0]) cylinder(4,4,4);
translate([4,18,0]) cylinder(4,4,4);
scale ([1.5,1,1]) translate([14,18,0]) cylinder(4,12,12);
scale ([1.5,1,1]) translate([14,0,0]) cylinder(4,12,12);
}

module cutAwayShape()
{
difference()
{
shape();
translate([25,-16,-1]) scale([2,1,1]) cylinder(6,16,16);
translate([25,34,-1]) scale([2,1,1]) cylinder(6,16,16);
}}

module finishedShape()
{
difference()
{
cutAwayShape();
translate([2,2,2]) negativeSpace();
}}




/////////////////////////////////////////////////////////////////////////////////////////////////////////////


//This is the part with the pins
translate ([0,40,0]) finishedShape();
translate ([41,49,3]) cylinder (3,4.8,4.8); // big pin
translate ([4,39,3]) cylinder (3,1.8,1.8); // left small pin
translate ([4,59,3]) cylinder (3,1.8,1.8); // right small pin

//This is the part with the holes
difference()
{
finishedShape();
translate ([41,9,2]) cylinder (3,5,5); // big hole
translate ([4,-1,2]) cylinder (3,2,2); // right small hole
translate ([4,19,2]) cylinder (3,2,2); // left small hole
}































