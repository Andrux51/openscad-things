bandHeight = 125;
bandRadiusTop = 35;
bandRadiusBottom = 65;
bandThickness = 3;

difference() {
    cylinder(r1=bandRadiusBottom,r2=bandRadiusTop,h=bandHeight,$fn=64);
    translate([0,0,-1]) cylinder(r1=bandRadiusBottom-bandThickness/2,r2=bandRadiusTop-bandThickness/2,h=bandHeight+2,$fn=64);
}
