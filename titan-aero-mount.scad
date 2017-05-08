// https://a.pololu-files.com/picture/0J2980.600.jpg?3f407000ec6d25bd67f05491164d86cc

motorPlateSide = 42.3;
motorHoleDistance = 5.75;
motorHoleSpan = 31;
motorLength = 38;

floorDepth = 55;

module motorPlaceholder() {
    screwDiameter = 3;

    difference() {
        cube([motorLength,motorPlateSide,motorPlateSide]);
        translate([-1,motorHoleDistance,5.5]) rotate([0,90,0]) screwHole(d=3,h=50);
        translate([-1,motorHoleDistance,motorPlateSide-5.5]) rotate([0,90,0]) screwHole(d=3,h=50);
        translate([-1,motorPlateSide-motorHoleDistance,5.5]) rotate([0,90,0]) screwHole(d=3,h=50);
        translate([-1,motorPlateSide-motorHoleDistance,motorPlateSide-5.5]) rotate([0,90,0]) screwHole(d=3,h=50);
    }
}

module screwHole(d,h=3) {
    cylinder(h=h,d=d,$fn=100);
}


module backPlate() {
    union() {
        translate([62,floorDepth,82]) rotate([90,90,180]) import("X-carriage_E3D-Titan_plate_v2.stl");
        translate([0,floorDepth,0]) cube([62,3,4]);
        translate([0,floorDepth,0]) cube([3,3,6]);
        translate([61,floorDepth,0]) cube([15,3,46]);
    }
}

module roundedSlit(l, d=3) {
    translate([d/2, d/2, d/2])
    hull() {
        rotate([0,90,0]) cylinder(h=3,d=d,$fn=100);
        translate([0,l,0]) rotate([0,90,0]) cylinder(h=3,d=d,$fn=100);
    }
}

module motorMount() {
    // motor screw plate
    translate([32,0,3]) {
        difference() {
            cube([3,floorDepth,motorPlateSide+0.25]);
            // TODO: put screw holes in
            translate([-1,motorPlateSide/2+0.25,motorPlateSide/2+0.25]) rotate([0,90,0]) screwHole(d=26,h=6);
            translate([-1,motorHoleDistance,motorHoleDistance]) rotate([0,90,0]) screwHole(d=3,h=5);
            translate([-1,motorHoleSpan+motorHoleDistance,motorHoleSpan+motorHoleDistance]) rotate([0,90,0]) screwHole(d=3,h=5);
            translate([-1,motorHoleSpan+motorHoleDistance,motorHoleDistance]) rotate([0,90,0]) screwHole(d=3,h=5);
            translate([-1,motorHoleDistance,motorHoleSpan+motorHoleDistance]) rotate([0,90,0]) screwHole(d=3,h=5);

            // motor spindle slot
            translate([0,18.5,26]) cube([3,5.5,20]);
        }
    }

    // front plate
    translate([32,-3,0]) {
        difference() {
            cube([motorPlateSide+2.7,3,motorPlateSide+3.25]);

            translate([8,-1,31]) rotate([-90,0,0]) screwHole(d=5,h=5);
            translate([8,-1,7]) rotate([-90,0,0]) screwHole(d=5,h=5);

            /*translate([25,-1,7]) rotate([-90,0,0]) screwHole(d=4,h=5);
            translate([25,-1,13.25]) rotate([-90,0,0]) screwHole(d=4,h=5);
            translate([25,-1,19.5]) rotate([-90,0,0]) screwHole(d=4,h=5);
            translate([25,-1,25.75]) rotate([-90,0,0]) screwHole(d=4,h=5);
            translate([25,-1,32]) rotate([-90,0,0]) screwHole(d=4,h=5);*/
        }

    }

    // mount floor
    difference() {
        translate([32,0,0]) cube([45,floorDepth,3]);
        /*translate([40,45,0]) screwHole(3);
        translate([57,45,0]) screwHole(3);
        translate([70,45,0]) screwHole(3);*/
    }

    // back side for bracing
    *difference() {
        translate([35,motorPlateSide,3]) cube([motorPlateSide,3,motorPlateSide]);
        translate([39.5,motorPlateSide+3,31]) rotate([90,0,0]) screwHole(7);
        translate([39.5,motorPlateSide+3,7]) rotate([90,0,0]) screwHole(7);
        translate([49.5,motorPlateSide+3,32]) rotate([90,0,0]) screwHole(8);
        translate([56.5,motorPlateSide+3,7]) rotate([90,0,0]) screwHole(7);
        translate([56.5,motorPlateSide+3,22]) rotate([90,0,0]) screwHole(7);
    }

    // fan mount side
    *difference() {
        translate([74,0,3]) cube([3,8,43.35]);
        /*translate([77,45.5,10]) rotate([0,-90,0]) screwHole(3);
        translate([77,45.5,24]) rotate([0,-90,0]) screwHole(3);
        translate([77,45.5,38]) rotate([0,-90,0]) screwHole(3);*/
    }

    // top slant for bracing
    *hull() {
        translate([32,0,motorPlateSide+3.25]) cube([3,1,0.8]);
        translate([32,50,motorPlateSide+3.25]) cube([1,1,0.8]);
        translate([75,49.5,motorPlateSide+3.25]) cube([1,1.5,0.8]);
        translate([75,45,motorPlateSide+3.25]) cube([1,1.5,0.8]);
    }
}

module fanClip() {
    holeDiameter = 2;
    offset = 3;

    // front
    *difference() {
        cube([50,2,50]);
        for(i = [1:9]) {
            translate([offset + i*(holeDiameter*2),-holeDiameter/2,9]) rotate([90,0,90]) roundedSlit(31,holeDiameter);
        }
        translate([4,3,46]) rotate([90,0,0]) screwHole(3);
        translate([44,3,6]) rotate([90,0,0]) screwHole(3);
    }

    // bottom
    *translate([33,0,0])
    difference() {
        cube([14,floorDepth+0.5,3]);
        /*translate([8,8,0]) screwHole(3);*/
        /*for(i = [1:9]) {
            translate([4 + i*(holeDiameter*2),5,-2]) rotate([0,-90,0]) roundedSlit(34,holeDiameter);
        }*/
        translate([5,45,0]) screwHole(3);
        translate([5,45,-1.25]) screwHole(5.2);
    }

    // right side
    translate([44,0,3])
    difference() {
        cube([3,floorDepth,50]);

        // fan mounts onto this side
        translate([3.2,45.5,6]) rotate([0,-90,0]) screwHole(d=2.85,h=4);
        translate([3.2,5.5,46]) rotate([0,-90,0]) screwHole(d=2.85,h=4);
    }
}

module extruderSection() {
    extruderFloorDepth = 28;

    translate([0,floorDepth-extruderFloorDepth,0]) {
        cube([32,extruderFloorDepth,3]);

        difference() {
            translate([0,26.5,3]) cube([77,2,motorPlateSide+14]);
            translate([5,28.5,7]) rotate([90,0,0]) screwHole(3);
            translate([57,28.5,7]) rotate([90,0,0]) screwHole(3);
            translate([5,28.5,21.75]) rotate([90,0,0]) screwHole(3);
            translate([57,28.5,21.75]) rotate([90,0,0]) screwHole(3);
            translate([12.5,28.5,32]) rotate([90,0,0]) screwHole(8);
            translate([49.5,28.5,32]) rotate([90,0,0]) screwHole(8);

            translate([22,28.5,31]) rotate([90,0,0]) screwHole(4);
            translate([40,28.5,31]) rotate([90,0,0]) screwHole(4);
            translate([22,28.5,7]) rotate([90,0,0]) screwHole(4);
            translate([40,28.5,7]) rotate([90,0,0]) screwHole(4);

            translate([6,29,53]) rotate([90,0,0]) screwHole(d=4,h=5);
            translate([24,29,53]) rotate([90,0,0]) screwHole(d=4,h=5);
            translate([38,29,53]) rotate([90,0,0]) screwHole(d=4,h=5);
            translate([56,29,53]) rotate([90,0,0]) screwHole(d=4,h=5);
            translate([70,29,53]) rotate([90,0,0]) screwHole(d=4,h=5);
        }
    }
}

translate([0,3,0]) {
    *translate([35,0,3]) motorPlaceholder();

    *color("CornflowerBlue") backPlate();

    color("Violet") motorMount();

    color("LimeGreen") extruderSection();

    color("Orange") translate([30,0,-3]) fanClip();
}
