use <../parts/face.scad>
use <../external/sg90.scad>
use <../external/seeed_xiao_esp32c3.scad>

module servo_on_face() {
    face();
    rotate([180,0,90])
    translate([-16.7,-12.3/2,-25.6+0.5])
    sg90();
    rotate([180,0,90])
    translate([-16.7,-15-12.3/2,-25.6-4.3+0.5])
    sg90();
    rotate([0,0,-120])
    translate([0,30,6.5])

    seeed_xiao_esp32c3();
}

servo_on_face();