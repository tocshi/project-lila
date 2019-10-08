// Sum up all slows/speedups
speedup = sumMap(speedups, 0);
relative_speedUp = multMap(relative_speedups, 1);
slow = sumMap(slows, 0);
relative_slow = multMap(relative_slows, 1);

// Update movement speed from effects
statmap[? "movespeed"] = (statmap[? "base_movespeed"] + speedup - slow) * relative_speedUp * relative_slow;

// Standard Movement
if(mouse_check_button_pressed(mb_right) && canMove){
	
	destX = mouse_x;
	destY = mouse_y;
	instance_create_layer(destX,destY,"Assets_1",obj_player_move_indicator);
	isMoving = true;
	
}

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

//DEBUG COOLDOWN RESET
if(keyboard_check_pressed(vk_tab)){
	for (var i = 0; i < array_length_1d(cd); i++){
		if(cd[i] > 0){cd[i] = 1;}
	}
}
