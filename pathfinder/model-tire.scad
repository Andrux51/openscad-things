// units in mm at 1:25.4 scale (units in inches)
tireHeight = 31;
tireWidth = 10.5;
sidewallHeight = 8;
wheelHeight = 15;
wheelWidth = 10.5;

notchHeight = 0.3;
notchLength = 0.25;


module tire() {
    difference() {
        cylinder(d=tireHeight, h=tireWidth, $fn=64);
        translate([0,0,-1]) cylinder(d=wheelHeight, h=tireWidth+2, $fn=64);
    }
}

module rim() {
    difference() {
        cylinder(d=wheelHeight, h=wheelWidth, $fn=64);
        translate([0,0,-1]) cylinder(d=wheelHeight-1, h=wheelWidth+2, $fn=64);
    }

    difference() {
        translate([0,0,0.5]) cylinder(d=wheelHeight, h=wheelWidth-1, $fn=64);
        cylinder(d=3,h=wheelWidth, $fn=64);
    }
}

translate([tireHeight/2,tireHeight/2,0])
rotate([0,0,0])
{
    color(c=[0.12,0.12,0.12,1])
    /*translate([tireHeight/2,-wheelHeight/2-sidewallHeight,0])*/
        tire();
    color("gray")
    /*translate([tireHeight/2,-wheelHeight/2-sidewallHeight,0])*/
        rim();
}
