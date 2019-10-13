if(isMoving){
	move(statmap[? "movespeed"], point_direction(x,y,destX,destY));
}

if (point_distance(x, y, destX, destY) < statmap[? "movespeed"]){
		speed = 0;
		isMoving = false;
}


// Double Mana Regen when not doing anything for 90 frames
if(canMove && !isMoving){
	highRegenThreshold++;
} else {
	highRegenThreshold = 0;
}