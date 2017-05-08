module wide() {
    cube([150,3,0.5]);
}

wide();
cube([3,60,0.5]);
translate([0,60,0]) wide();
