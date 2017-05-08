armLength = 24;
armDiameter = 8;
wallWidth = 3;
diameter = 54;
height = 100; // probably need a better measurement here

module rollingPin() {
    difference() {
        cylinder(d=diameter,h=height,$fn=64);
        translate([0,0,0]) cylinder(d=diameter-wallWidth*2,h=height+2,$fn=64);
    }

    cylinder(d=armDiameter,h=height,$fn=64);

    rollingPinLeg();
    rotate([0,0,120]) rollingPinLeg();
    rotate([0,0,240]) rollingPinLeg();

    difference() {
        cylinder(d=diameter,h=height,$fn=4);
        cylinder(d=diameter-wallWidth*wallWidth,h=height,$fn=4);
    }
}

module rollingPinLeg(width=wallWidth) {
    translate([-width/2,-1,0]) cube([width,diameter/2,height]);
}

module rollingPinArm() {
    translate([diameter/2,0,diameter/2]) rotate([-90,0,0]) cylinder(d=armDiameter,h=armLength,$fn=64);

    // supports
    translate([diameter/2-armDiameter/2,-2,0]) cube([armDiameter,armLength-4,1]);
    translate([diameter/2-armDiameter/8,0,0]) cube([armDiameter/4,armDiameter/2,diameter/2-armDiameter/2]);
    translate([diameter/2-armDiameter/8,armLength/2-1,0]) cube([armDiameter/4,armDiameter/2,diameter/2-armDiameter/2]);
}

color("LimeGreen") translate([diameter/2,armLength,diameter/2])
    rotate([-90,0,0])
        rollingPin();

color("SteelBlue") {
    rollingPinArm();
    translate([0,height+armLength*2,0]) mirror([0,1,0]) rollingPinArm();
}
