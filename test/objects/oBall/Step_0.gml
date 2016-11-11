/// @description Insert description here
// You can write your code in this editor

ballArea.x = x;
ballArea.y = y;

with(oPlayer) {
	if (contrPlugged) {
		var hdir = gamepad_axis_value(0, gp_axisrh)
		var vdir = gamepad_axis_value(0, gp_axisrv)
		var angle =  arctan2(vdir, hdir);
		if(kicked and (place_meeting(x, y, oBallArea) or place_meeting(x, y, oBall))) {
			if(abs(hdir) > 0.3) {
				other.vx = other.vxMax*cos(angle);
			}
			if(abs(vdir) > 0.3) {
				other.vy = other.vyMax*sin(angle);
			}
		}
	}
	else {
		var hdir = 0;
		var vdir = 0;
		var kLeft, kRight, kUp, kDown; 
		
		kLeft			= keyboard_check(vk_left);
		kRight			= keyboard_check(vk_right);
		kUp				= keyboard_check(vk_up);
		kDown			= keyboard_check(vk_down);
		
		if(kicked and (place_meeting(x, y, oBallArea) or place_meeting(x, y, oBall))) {
			if(!kLeft and !kRight)
				hdir = 0;
			else if(kLeft and !kRight)
				hdir = -1;
			else if (!kLeft and kRight)
				hdir = 1;
			
			if(!kUp and !kDown)
				vdir = 0;
			else if(kUp and !kDown)
				vdir = -1;
			else if (!kUp and kDown)
				vdir = 1;
				
			if(hdir != 0 and vdir != 0) {
				hdir /= sqrt(2);
				vdir /= sqrt(2);
			}
			
			other.vx = other.vxMax*hdir;
			other.vy = other.vyMax*vdir;
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
