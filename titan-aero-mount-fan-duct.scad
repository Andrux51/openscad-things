shroudToNozzle = 62;
mountToSickle = 32;
sickleLength = 44;
sickleDepth = 21; // at least - opt for semi-circular
mountOuterX = 17.75;
wallWidth = 1;
heightBelowFan = 17;
heightBeforeBend = 6;
mountInnerY = 13;
mountOuterY = 15.5;
mountHeight = 15;
mountSideHoleWidth = 2.5;
mountSideHoleHeight = 11.5; //1.25 from top/bottom of mount area
stovePipeHeight = 10;

mountToTaper = 55;

module stovePipe() {
    translate([wallWidth*0.5,wallWidth,heightBelowFan-1])
    difference() {
        cube([16.75,12.75,8]);
        translate([wallWidth*1.5,wallWidth*1.5,-1]) cube([13.75,9.75,stovePipeHeight]);
    }
}

module motorSpan() {
    diameter = 8;
    height = 1;

    difference() {
        translate([mountOuterX/2-wallWidth*0.5,0,0]) taperSide(8,wallWidth);
        //translate([mountOuterX/2-wallWidth*1.5,mountToTaper-4,-1]) cube([3,5,6]);
    }

    difference() {
        taperSide(8,mountOuterX);
        translate([wallWidth,wallWidth,wallWidth]) taperSide(8,mountOuterX-wallWidth*2);

        // hole on bottom
        //translate([wallWidth,mountToTaper-wallWidth*2,-1]) cube([mountOuterX-wallWidth*2,wallWidth*2,wallWidth*2]);
    }
    //translate([mountOuterX-wallWidth,0,0]) taperSide(8,1);

    taperTop();
}

module taperSide(diameter, height) {
    hull() {
        translate([0,diameter/2,diameter/2]) rotate([0,90,0]) cylinder(d=diameter,h=height,$fn=64);
        translate([0,0,heightBelowFan-heightBeforeBend]) cube([height,1,1]);
        translate([0,mountInnerY,heightBelowFan-heightBeforeBend]) cube([height,1,1]);
        translate([0,mountToTaper,2]) cube([height,1,1]);
        translate([0,mountToTaper-2,0]) cube([height,1,1]);
    }
}

module taperTop() {
    //translate([0,mountToTaper,1]) cube([mountOuterX,wallWidth,wallWidth]);

    translate([0,0,heightBelowFan-heightBeforeBend]) {
        difference() {
            cube([mountOuterX,mountOuterY-1,heightBeforeBend]);
            translate([wallWidth*2,2,-1]) cube([mountOuterX-2-wallWidth*2, mountOuterY-3-wallWidth*2,heightBeforeBend+2]);
        }


        translate([0,mountOuterY-wallWidth,0]) {
            hull() {
                cube([mountOuterX,wallWidth,wallWidth]);
                translate([0,mountToTaper-mountOuterY+wallWidth,-(heightBelowFan-heightBeforeBend-2)]) cube([mountOuterX,wallWidth,wallWidth]);
            }
        }
    }
}

//translate([10,32.7,19.8])
color("white",0.6)
translate([sickleDepth,0,0]) {
    motorSpan();
    stovePipe();
}

// total height below press fitting = 17mm
