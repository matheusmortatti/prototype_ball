/// @description Insert description here
// You can write your code in this editor

ballArea.x = x;
ballArea.y = y;

with(oPlayer) {
	var hdir = gamepad_axis_value(0, gp_axisrh)
	var vdir = gamepad_axis_value(0, gp_axisrv)
	var angle =  arctan2(vdir, hdir);
	if(kicked and (place_meeting(x, y, oBallArea) or place_meeting(x, y, oBall))) {
		if(abs(hdir) > 0.3) {
			oBall.vx = oBall.vxMax*cos(angle);
		}
		if(abs(vdir) > 0.3) {
			oBall.vy = oBall.vyMax*sin(angle);
		}
	}
}

var tempFric, tempAccel;

if(isGrounded) {
	tempAccel = groundAccel;
	tempFric  = groundFric;
}
else {
	tempAccel = airAccel;
	tempFric  = airFric;
}

if(!isGrounded) {
	vy = approach(vy, vyMax, gravNorm);
}

vx = approach(vx, 0, tempFric)
