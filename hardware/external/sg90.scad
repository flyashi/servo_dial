servo_l = 22.8;
servo_w = 12.3;
servo_total_h = 30;
servo_top_h = 22.5;
servo_flange_h = 18.2;
servo_flange_th = 2.5;
servo_l_with_flange = 32.2;
servo_flange_l = (servo_l_with_flange - servo_l) / 2;
servo_head_l = 3.2;
servo_head_d = 4.9;
servo_flange_hole_d = 2;
servo_flange_hole_dist = 27.5;
servo_edge_to_flange_hole = (servo_l_with_flange-servo_flange_hole_dist)/2;
servo_head_base_h = servo_total_h - servo_head_l;
servo_flange_hole_w=1;
servo_flange_hole_l=1.5;
servo_head_hole_d = 2;

maincolor="steelblue";

module sg90() {
    union() {
        color(maincolor) cube([servo_l,servo_w,servo_top_h]);
        color(maincolor) translate([-servo_flange_l,0,servo_flange_h-servo_flange_th])
            difference() {
                cube([servo_l_with_flange,servo_w,servo_flange_th]);
                translate([servo_edge_to_flange_hole,servo_w/2,-0.1])
                    cylinder(h=servo_flange_th+0.2,d=servo_flange_hole_d,$fn=20);
                translate([servo_l_with_flange-servo_edge_to_flange_hole,servo_w/2,-0.1])
                    cylinder(h=servo_flange_th+0.2,d=servo_flange_hole_d,$fn=20);
                translate([-0.1,servo_w/2-servo_flange_hole_w/2,-0.1])
                    cube([0.1+servo_flange_hole_l,servo_flange_hole_w,servo_flange_th + 0.2]);
                translate([servo_l_with_flange-servo_flange_hole_l,servo_w/2-servo_flange_hole_w/2,-0.1])
                    cube([0.1+servo_flange_hole_l,servo_flange_hole_w,servo_flange_th + 0.2]);
            }
        color(maincolor) translate([servo_l-servo_w/2,servo_w/2,servo_top_h])
            cylinder(d=servo_w,h=(servo_total_h-servo_top_h-servo_head_l),$fn=50);
        translate([servo_l-servo_w/2,servo_w/2,servo_total_h-servo_head_l])
            color("white") difference() {
                cylinder(d=servo_head_d,h=servo_head_l,$fn=20);
                cylinder(d=servo_head_hole_d,h=servo_head_l + 0.1, $fn=10);
            }
    }
}

sg90();