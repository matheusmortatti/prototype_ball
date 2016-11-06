/// @description Insert description here
// You can write your code in this editor

// Movement

// Normal movement
vx = 0;
vy = 0;

// subpixel movement
cx = 0;
cy = 0;

groundAccel = 1.0;
groundFric	= 0.35;
airAccel	= 0.75;
airFric		= 0.01;
vxMax		= 8.0;
vyMax		= 10.0;
jumpHeight	= 6.0;
gravNorm	= 0.50;

// time until the bomb explodes
alarm[0] = random_range(20, 40) * room_speed ;

isGrounded = onGround();

ballArea = instance_create_layer(x, y, layer, oBallArea);