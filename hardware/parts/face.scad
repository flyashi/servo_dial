face_d=90;
face_th=2.5;


// servo calculations
servo_flange_len=4.7;
servo_flange_hole_to_edge_dist=2.35;
servo_width=12.3;
servo_len=22.8;

servo_left_flange_hole_to_hole = servo_flange_len+servo_len - servo_width/2 - servo_flange_hole_to_edge_dist;
servo_right_flange_hole_to_hole = servo_width/2 + servo_flange_len - servo_flange_hole_to_edge_dist;

servo_1_hole_d = 13;
servo_2_hole_d = 10;

servo_1_holder_h=4.3;
servo_holder_d=4;

servo_2_holder_h=8.6;

servo_holder_hole_h=10;
servo_holder_hole_d=2;

servo_2_offset = 15;

mount_d = 6;
mount_h = 30; // check me!
mount_hole_h = mount_h - 5;  // leave 5mm at the bottom? too much?
mount_hold_d = 3.45; // #8 75%

mount_hole_dist = 60;

module servo_support(len) {
    difference() {
        cylinder(h=len,d=servo_holder_d,$fn=20);
        translate([0,0,len-servo_holder_hole_h])
            cylinder(h=servo_holder_hole_h+0.1,d=servo_holder_hole_d,$fn=20);
    }
}

module rear_mount(len) {
    difference() {
        cylinder(h=len,d=mount_d,$fn=20);
        translate([0,0,len-mount_hole_h])
            cylinder(h=mount_hole_h+0.1,d=mount_hold_d,$fn=20);
    }
}

module module_holder() {
    union() {
        //cube([15,2.5,10]);
        mw=18.5;
        rotate([90,0,0]) linear_extrude(15) {
            polygon(points=[
                [0,0],
                [0,2],
                [1,3],
                [0,4],
                [0,5],
                [1,6],
                [0,7],
                [-2,7],
                [-2,0]
            ]);
            polygon(points=[
                [mw,0],
                [mw,2],
                [mw-1,3],
                [mw,4],
                [mw,5],
                [mw-1,6],
                [mw,7],
                [mw+2,7],
                [mw+2,0]
            ]);
        }
        translate([-2,0,0]) cube([mw+4,2,5]);
    }
}

module face() {
    union() {
        // face
        difference() {
            // main cylinder
            cylinder(h=face_th,d=face_d,$fn=100);
            // cutout for servo 1
            translate([0,0,-0.1])
                cylinder(d=servo_1_hole_d,h=face_th+0.2,$fn=50);
            translate([0,-8,-0.1])
                cylinder(d=7,h=face_th+0.2,$fn=50);
            translate([-3.5,-8,-0.1]) 
                cube([7,7,face_th+0.2]);
            // cutout for servo 2
            translate([-servo_2_offset,0,-0.1])
                cylinder(d=servo_2_hole_d,h=face_th+0.2,$fn=50);
            
        }
        // servo supports - servo 1
        translate([0, -servo_left_flange_hole_to_hole,face_th])
            servo_support(servo_1_holder_h);
        translate([0, servo_right_flange_hole_to_hole,face_th])
            servo_support(servo_1_holder_h);

        // servo supports - servo 2
        translate([-servo_2_offset, -servo_left_flange_hole_to_hole,face_th])
            servo_support(servo_2_holder_h);
        translate([-servo_2_offset, servo_right_flange_hole_to_hole,face_th])
            servo_support(servo_2_holder_h);
        
        // rear mounts
        translate([-mount_hole_dist/2, 0, face_th])
            rear_mount(mount_h);
        translate([mount_hole_dist/2, 0, face_th])
            rear_mount(mount_h);
        
        // module holder
        rotate([0,0,60])

        translate([-9.25,-19,face_th])
            module_holder();
    }
}

face();