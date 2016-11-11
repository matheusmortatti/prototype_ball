/// @description Insert description here
// You can write your code in this editor

var kLeft, kRight, kUp, kDown, kJump, kJumpReleased, kKick, tempAccel, tempFric;

kLeft			= keyboard_check(vk_left)	|| gamepad_axis_value(pad_num, gp_axislh) < -0.4;
kRight			= keyboard_check(vk_right)	|| gamepad_axis_value(pad_num, gp_axislh) > 0.4;
kUp				= keyboard_check(vk_up)		|| gamepad_axis_value(pad_num, gp_axislv) < -0.4;
kDown			= keyboard_check(vk_down)	|| gamepad_axis_value(pad_num, gp_axislv) > 0.4;

kJump			= keyboard_check_pressed(ord("C"))	|| gamepad_button_check_pressed(pad_num, gp_shoulderlb);
kJumpReleased	= keyboard_check_released(ord("C"))	|| gamepad_button_check_released(pad_num, gp_shoulderlb);
kKick			= keyboard_check_pressed(ord("X"))	|| gamepad_button_check_pressed(pad_num, gp_shoulderrb);

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

if(kLeft and !kRight) {
	if (vx > 0)
		vx = approach(vx, 0, tempFric);
	vx = approach(vx, -vxMax, tempAccel);
}
else if(kRight and !kLeft) {
	if (vx < 0)
		vx = approach(vx, 0, tempFric);
	vx = approach(vx, vxMax, tempAccel);
}

if(!kLeft and !kRight) {
	vx = approach(vx, 0, tempFric);
}

if(kJump) {
	  if(isGrounded) {
		vy = -jumpHeight;
	  }
}
else if(kJumpReleased) {
	if(vy < 0) 
		vy *= 0.25
}

if(kDown && !kLeft && !kRight && place_meeting(x, y+1, oParJumpThru))
	y++;

kicked = kKick;