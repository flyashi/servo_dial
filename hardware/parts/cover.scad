outer_d=90;
th=2.5;
inner_h=30;
outer_h=inner_h+th;
inner_d=outer_d-2*th;

chord_h=35;

// math!
chord_w = 2 * sqrt(outer_d*outer_d/4-chord_h*chord_h);

mount_hole_dist = 60;
mount_hole_d = 4.3;

module cover() {
    union() {
        difference() {
            // outer shell
            cylinder(h=outer_h,d=outer_d,$fn=500);
            // remove inner shell
            translate([0,0,-0.1])
                cylinder(h=inner_h+0.1,d=inner_d,$fn=200);
            // cutout bottom below chord
            translate([-outer_d,-outer_d+0.1,-0.1]) cube([outer_d*2,outer_d+0.1-chord_h,outer_h+0.2]);

            // mount holes
            translate([-mount_hole_dist/2,0,inner_h-0.01])
                cylinder(d1=mount_hole_d,d2=mount_hole_d+2*th,h=th+0.02,$fn=50);
            translate([mount_hole_dist/2,0,inner_h-0.01])
                cylinder(d1=mount_hole_d,d2=mount_hole_d+2*th,h=th+0.02,$fn=50);

            // hanging hole
            translate([0,25,inner_h-0.01]) {
                cylinder(d=15,h=th+0.02,$fn=100);
                translate([-4,0,0]) cube([8,10,th+0.02]);
                translate([0,10,0]) cylinder(d=8,h=th+0.02,$fn=100);
            }

            // power hole
            rotate([90,0,60])
            translate([0,6.5,0]) {
                translate([-4,0,0]) cylinder(h=outer_d,d=6,$fn=20);
                translate([4,0,0])  cylinder(h=outer_d,d=6,$fn=20);
                translate([-4,-3,0]) cube([8,6,outer_d]);
            }
        }
        // add bottom chord
        translate([-chord_w/2,-chord_h,0])
            cube([chord_w,th,outer_h]);
    }
}

cover();