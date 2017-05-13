difference() {
    import("../../things to remix/Nissan_Logo/new_logo.stl");
    translate([0,13,0]) cylinder(d=9,h=6,$fn=64);
}



difference() {
    translate([0,13,0]) cylinder(d=9,h=4,$fn=64);
    translate([0,13.75,0]) cylinder(d=5,h=4,$fn=64);
    cylinder(d=20.25,h=4,$fn=64);
}

cylinder(d=20.25,h=2,$fn=64);
