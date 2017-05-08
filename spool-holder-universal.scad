topRadius = 12;
bottomRadius = 36;
totalHeight = 30;


// finger-friendly nubs
translate([bottomRadius-3.5,12,0]) cylinder(h=1,d=3,$fn=64);
translate([-bottomRadius+3.5,12,0]) cylinder(h=1,d=3,$fn=64);
translate([12,bottomRadius-3.5,0]) cylinder(h=1,d=3,$fn=64);
translate([12,-bottomRadius+3.5,0]) cylinder(h=1,d=3,$fn=64);
translate([bottomRadius-3.5,-12,0]) cylinder(h=1,d=3,$fn=64);
translate([-bottomRadius+3.5,-12,0]) cylinder(h=1,d=3,$fn=64);
translate([-12,bottomRadius-3.5,0]) cylinder(h=1,d=3,$fn=64);
translate([-12,-bottomRadius+3.5,0]) cylinder(h=1,d=3,$fn=64);

difference() {
    cylinder(h=totalHeight,r1=bottomRadius,r2=topRadius,$fn=64);

    translate([0,0,-1]) {
        cylinder(h=totalHeight+2,d=7.5,$fn=64);

        translate([bottomRadius,0,0]) cylinder(r1=12,r2=20,h=totalHeight+2,$fn=64);
        translate([-bottomRadius,0,0]) cylinder(r1=12,r2=20,h=totalHeight+2,$fn=64);
        translate([0,bottomRadius,0]) cylinder(r1=12,r2=20,h=totalHeight+2,$fn=64);
        translate([0,-bottomRadius,0]) cylinder(r1=12,r2=20,h=totalHeight+2,$fn=64);
        cylinder(h=7,d=21.8,$fn=64);
    }
}
