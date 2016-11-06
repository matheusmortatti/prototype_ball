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
groundFric	= 2.0;
airAccel	= 0.75;
airFric		= 0.01;
vxMax		= 5.50;
vyMax		= 10.0;
jumpHeight	= 8.0;
gravNorm	= 0.60;

kicked = false;

playerNum = 0;

isGrounded = onGround();