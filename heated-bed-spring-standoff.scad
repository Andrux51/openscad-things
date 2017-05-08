diameter = 8.25;
height = 8;
thickness = 2.5;

difference() {
    cylinder(d=diameter+thickness,h=height,$fn=64);
    translate([0,0,-1]) cylinder(d=diameter,h=height+2,$fn=64);
}