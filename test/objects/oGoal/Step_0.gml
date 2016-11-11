/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x+1, y, oBall) or place_meeting(x-1, y, oBall)
	or place_meeting(x, y+1, oBall) or place_meeting(x, y-1, oBall)) {
		instance_destroy(oBall);
}