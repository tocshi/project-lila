
if(mouse_check_button_pressed(mb_right) && canMove){
	
	destX = mouse_x;
	destY = mouse_y;
	instance_create_layer(destX,destY,"Instances",obj_debug_indicator);
	isMoving = true;
	
}

if(isMoving){
	move(movespeed, point_direction(x,y,destX,destY));
}

if (point_distance(x, y, destX, destY) < movespeed){
		speed = 0;
		isMoving = false;
}

if(canMove && !isMoving){
	highRegenThreshold++;
} else {
	highRegenThreshold = 0;
}