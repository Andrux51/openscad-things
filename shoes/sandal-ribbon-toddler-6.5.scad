translate([-37,-55,0]) import("toddler-6.5-sole.stl");

module strapHole(posX,posY) {
    translate([posX,posY,4]) {
        difference() {
            translate([0,1.5,2]) hull() {
                rotate([0,90,0]) cylinder(d=6,h=4,$fn=64);
                translate([0,5,0]) rotate([0,90,0]) cylinder(d=6,h=4,$fn=64);
            }
            //cube([4,8,4]);
            translate([-1, 1, 0]) cube([6,6,3]);
        }
    }
}

strapHole(40,120);
strapHole(10,40);
strapHole(51,40);
