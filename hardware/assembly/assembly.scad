use <../parts/face.scad>
use <../external/sg90.scad>

module servo_on_face() {
    face();
    rotate([180,0,0])
    translate([-16.7,-12.3/2,-25.6])
    sg90();
}

servo_on_face();