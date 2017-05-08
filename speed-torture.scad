difference() {
    cube(20);
    translate([1,1,1]) cube([18,18,19]);
}

translate([30,0,0]) cube(20);

translate([0,25,0]) cube([50,20,1]);
translate([10,0,1]) {
translate([0,30,0]) cylinder(h=20,r1=3,r2=1,$fn=100);
translate([10,30,0]) cylinder(h=20,r1=2,r2=1,$fn=100);
translate([30,30,0]) cylinder(h=20,r1=1,r2=0.5,$fn=100);
translate([20,30,0]) cylinder(h=20,r1=0.5,r2=0.25,$fn=100);
translate([0,40,0]) cylinder(h=20,r1=0.25,r2=0.5,$fn=100);
translate([10,40,0]) cylinder(h=20,r1=0.5,r2=1,$fn=100);
translate([20,40,0]) cylinder(h=20,r1=1,r2=2,$fn=100);
translate([30,40,0]) cylinder(h=20,r1=2,r2=3,$fn=100);
}
