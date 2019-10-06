// Sum up all slows/speedups
speedup = sumMap(speedups, 0);
relative_speedUp = multMap(relative_speedups, 1);
slow = sumMap(slows, 0);
relative_slow = multMap(relative_slows, 1);

// Update movement speed from effects
movespeed = (base_movespeed + speedup - slow) * relative_speedUp * relative_slow;

// Standard Movement
if(mouse_check_button_pressed(mb_right) && canMove){
	
	destX = mouse_x;
	destY = mouse_y;
	instance_create_layer(destX,destY,"Assets_1",obj_player_move_indicator);
	isMoving = true;
	
}

if(isMoving){
	move(movespeed, point_direction(x,y,destX,destY));
}

if (point_distance(x, y, destX, destY) < movespeed){
		speed = 0;
		isMoving = false;
}


// Double Mana Regen when not doing anything for 90 frames
if(canMove && !isMoving){
	highRegenThreshold++;
} else {
	highRegenThreshold = 0;
}