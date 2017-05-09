totalHeight = 2;
totalWidth = 80;
holePatternWidth = 71.5;
holeDiameter = 4.5;

module outerEdge(borderRadius) {
    difference() {
        hull() {
            translate([borderRadius/2,borderRadius/2,0]) cylinder(d=borderRadius,h=totalHeight,$fn=64);
            translate([totalWidth-borderRadius/2,borderRadius/2,0]) cylinder(d=borderRadius,h=totalHeight,$fn=64);
            translate([borderRadius/2,totalWidth-borderRadius/2,0]) cylinder(d=borderRadius,h=totalHeight,$fn=64);
            translate([totalWidth-borderRadius/2,totalWidth-borderRadius/2,0]) cylinder(d=borderRadius,h=totalHeight,$fn=64);
        }
    }
}

module holePattern() {
    translate([holeDiameter,holeDiameter,-1]) {
        cylinder(d=holeDiameter,h=totalHeight+2,$fn=64);
        translate([holePatternWidth,0,0]) cylinder(d=holeDiameter,h=totalHeight+2,$fn=64);
        translate([0,holePatternWidth,0]) cylinder(d=holeDiameter,h=totalHeight+2,$fn=64);
        translate([holePatternWidth,holePatternWidth,0]) cylinder(d=holeDiameter,h=totalHeight+2,$fn=64);
    }
}

module centerHole() {
    translate([totalWidth/2,totalWidth/2,-1]) {
        cylinder(d=holePatternWidth+holeDiameter,h=totalHeight+2,$fn=64);
    }
}

difference() {
    outerEdge(4);
    holePattern();
    centerHole();
}
