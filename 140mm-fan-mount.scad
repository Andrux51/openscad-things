module screwHole(diameter,height=6) {
    cylinder(d=diameter,h=height,$fn=64);
}

difference() {
    totalWidth = 140;
    holeDiameter = 130;
    screwDistance = 7.25;

    cube([totalWidth,totalWidth,4.5]);
    translate([totalWidth/2,totalWidth/2,-1]) screwHole(holeDiameter);
    translate([screwDistance,screwDistance,-1]) screwHole(5);
    translate([totalWidth-screwDistance,screwDistance,-1]) screwHole(5);
    translate([screwDistance,totalWidth-screwDistance,-1]) screwHole(5);
    translate([totalWidth-screwDistance,totalWidth-screwDistance,-1]) screwHole(5);
}
