// Double Mana Regen when not doing anything for 90 frames
if(canMove && !isMoving){
	highRegenThreshold++;
} else {
	highRegenThreshold = 0;
}

if(global.pause){exit;}

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

// Use Items On Hotbar
for(var i = 0; i < 10; i++){
	if(keyboard_check_pressed(skill_button[i+11])){
		if(itemBar[i] > 0){
			if(ds_map_find_value(global.itemData[| itemBar[i]], "type") == "equippable"){
				if(isInArray(equips,itemBar[i])){
					useItem(self.id,itemBar[i]);
				}
				else{
					// For future sounds
					continue;
				}
			}
			else{useItem(self.id,itemBar[i]);}
		}
	}
}

//DEBUG COOLDOWN RESET AND INFINITE MP AND EQUIP
if(keyboard_check_pressed(vk_tab)){
	for (var i = 0; i < array_length_1d(cd); i++){
		if(cd[i] > 0){cd[i] = 1;}
	}
	for (var i = 0; i < array_length_1d(itemcd); i++){
		if(itemcd[i] > 0){itemcd[i] = 1;}
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

statChange = false;

// Unleash Mode
if(keyboard_check(skill_button[0]) && unleashGauge > 0 && essence >= unleashGauge && atkTimer <= 0){
	
	var effect = instance_create_layer(x,y,"Assets_1",obj_debug_indicator);
	effect.image_alpha = 0.3;
	effect.direction = irandom_range(0,359);
	effect.speed = 1;
	
	atkTimer++;
	if(mouse_check_button_pressed(mb_left)){
		var modifier = essence/unleashGauge;
		use_unleash_skill(modifier);
		essence = -1;
		cd[0] = unleashGauge*room_speed;
	}
	if(mouse_check_button_pressed(mb_right)){
		statmap[? "hp"] += (statmap[? "maxhp"]/100)*essence;
		essence = 0;
		canMove = false;
	}
}