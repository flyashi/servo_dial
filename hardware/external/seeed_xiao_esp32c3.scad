board_w=18;
board_l=21.5;
board_th=1;

conn_h=3;
conn_w=9;
conn_l=7;

conn_overhang=2;
corner_r=1.5;

module seeed_xiao_esp32c3() {
    union() {
        color("black") hull() {
            for(extra_w=[0,board_w-corner_r*2]) {
                for (extra_l=[0,board_l-corner_r*2]) {
                    translate([-board_w/2+corner_r+extra_w,-board_l/2+corner_r+extra_l,0])
                    cylinder(h=board_th,r=corner_r,$fn=20);
                }
            }
        }
        color("silver") hull() {
            for(extra_w=[0,conn_w-conn_h])
            translate([-conn_w/2+conn_h/2+extra_w,board_l/2-conn_l+conn_overhang,board_th+conn_h/2])
            rotate([-90,0,0])
            cylinder(h=conn_l,d=conn_h,$fn=20);

        }
    }
}

seeed_xiao_esp32c3();