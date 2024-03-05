face_d=90;
face_th=3;


// servo calculations
servo_flange_len=4.7;
servo_flange_hole_to_edge_dist=2.35;
servo_width=12.3;
servo_len=22.8;

servo_left_flange_hole_to_hole = servo_flange_len+servo_len - servo_width/2 - servo_flange_hole_to_edge_dist;
servo_right_flange_hole_to_hole = servo_width/2 + servo_flange_len - servo_flange_hole_to_edge_dist;

servo_holder_h=4.3;
servo_holder_d=4;

servo_holder_hole_h=10;
servo_holder_hole_d=2;

module servo_support() {
    difference() {
        cylinder(h=servo_holder_h,d=4,$fn=20);
        translate([0,0,servo_holder_h-servo_holder_hole_h])
            cylinder(h=servo_holder_hole_h+0.1,d=servo_holder_hole_d,$fn=20);
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
                cylinder(d=13,h=face_th+0.2,$fn=50);
        }
        // servo support
        translate([-servo_left_flange_hole_to_hole,0,face_th])
            servo_support();
        translate([servo_right_flange_hole_to_hole,0,face_th])
            servo_support();
    }
}

face();