/// moveEntity()

var vxNew, vyNew;

// handle sub pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;


// Horizontal
repeat(abs(vxNew)) {

	// move up the slope
	if(place_meeting(x + sign(vxNew), y, oParSolid) and !place_meeting(x + sign(vxNew), y-1, oParSolid)) {
		y--;
	}
	
	// move down the slope
	if(/*place_meeting(x+sign(vxNew), y, oParSolid) and*/ !place_meeting(x+sign(vxNew), y+1, oParSolid) and place_meeting(x+sign(vxNew), y+2, oParSolid)) {
		y++;
	}

	if(!place_meeting(x + sign(vxNew), y, oParSolid)) {
		x += sign(vxNew);
	}
	else {
		vx = 0;
		break;
	}
}


// Vertical
repeat(abs(vyNew)) {
	if(!place_meeting(x , y + sign(vyNew), oParSolid)) {
		y += sign(vyNew);
	}
	else {
		vy = 0;
		vyNew = 0;
		break;
	}
	
	if(vyNew > 0 && place_meeting(x, y+1, oParJumpThru) && !place_meeting(x, y, oParJumpThru)) {
		vy = 0;
		vyNew = 0;
	}
}