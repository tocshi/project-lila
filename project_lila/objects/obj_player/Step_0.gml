// Calculate stat changes from equipped items...move this to a script later you bimbo 
if(statChange){
	if(!equipApplied){
		for(var i = 0; i < array_length_1d(equips); i++){
			for(var j = 0; j < ds_list_size(global.equipStats)){
				if(!is_undefined(ds_map_find_value(global.itemData[i], global.equipStats[j]))){
					ds_map_set(basestatmap, global.equipStats[j], 
						ds_map_find_value(basestatmap, global.equipStats[j])
						+ ds_map_find_value(global.itemData[i], global.equipStats[j])))
				}
			}
		}
	}
	//copy relevant values from basestatmap to statmap
}

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
		statmap[? "mpregen"] -= 100;
	}
	else{
		infmp = true;
		statmap[? "mpregen"] += 100;
	}	
}

if(keyboard_check_pressed(ord("1"))){
	exit;
}
