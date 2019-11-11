statChange = false;

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

if(point_distance(x, y, destX, destY) < statmap[? "movespeed"] && canMove){
		speed = 0;
		isMoving = false;
}


// Double Mana Regen when not doing anything for 90 frames
if(canMove && !isMoving){
	highRegenThreshold++;
} else {
	highRegenThreshold = 0;
}

//DEBUG COOLDOWN RESET AND INFINITE MP AND EQUIP
if(keyboard_check_pressed(vk_tab)){
	for (var i = 0; i < array_length_1d(cd); i++){
		if(cd[i] > 0){cd[i] = 1;}
	}
}

if(keyboard_check_pressed(vk_shift)){
	if(infmp){
		infmp = false;
		basestatmap[? "mpregen"] -= 100;
	}
	else{
		infmp = true;
		basestatmap[? "mpregen"] += 100;
	}	
	recalcStats(self.id);
}

//DEBUG EQUIP/UNEQUIP
if(keyboard_check_pressed(ord("1"))){
	if(debugequip = 1){
		unequipItem(self.id,10);
		unequipItem(self.id,6);
		unequipItem(self.id,7);
		unequipItem(self.id,8);
		unequipItem(self.id,9);
		debugequip = 0;
	}
	else{
		equipItem(self.id,10);
		equipItem(self.id,6);
		equipItem(self.id,7);
		equipItem(self.id,8);
		equipItem(self.id,9);
		debugequip = 1;
	}
}
