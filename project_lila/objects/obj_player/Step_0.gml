// Double Mana Regen when not doing anything for 90 frames
if(canMove && !isMoving && !atkTimer){
	highRegenThreshold++;
} else {
	highRegenThreshold = 0;
}

//STAT CLAMPING
statmap[? "atkspeed"] = clamp(statmap[? "atkspeed"],0.01,5);
statmap[? "movespeed"] = clamp(statmap[? "movespeed"],0,20);
statmap[? "hp"] = clamp(statmap[? "hp"],0,statmap[? "maxhp"]);
statmap[? "mp"] = clamp(statmap[? "mp"],0,statmap[? "maxmp"]);
statmap[? "hpshield"] = max(statmap[? "hpshield"],0);
statmap[? "finalshld"] = clamp(statmap[? "finalshld"],-100,100);
essence = clamp(essence,-1,unleashGauge*3);

// Interact with NPCs
var hovered_npc = instance_position(mouse_x,mouse_y,obj_npc);
if(hovered_npc != noone && hovered_npc.interactable){
	global.cursor_state = 1;
	if(!global.pause && distance_to_object(hovered_npc) <= 72 && ((keyboard_check_pressed(global.key_interact) || mouse_check_button_pressed(global.mouse_interact)))){
		hovered_npc.trigger_interact = true;
		global.pause = true;
	}
}
else{
	global.cursor_state = 0;
}

if(global.pause){
	isMoving = false;
	exit;}

//SET CAMERA SPEED
var cam_speed = point_distance(x,y,camera_get_view_x(global.currentCamera)+camera_get_view_width(global.currentCamera)/2,
								camera_get_view_y(global.currentCamera)+camera_get_view_height(global.currentCamera)/2)/32;
camera_set_view_speed(global.currentCamera,cam_speed,cam_speed);

// Standard Movement
switch(global.controls_state){
	case 0:
	if(mouse_check_button(mb_right) && canMove){
		if(point_distance(x,y,mouse_x,mouse_y) > 8){
			destX = mouse_x;
			destY = mouse_y;
			isMoving = true;
			instance_destroy(obj_player_move_indicator);
			with(instance_create_layer(destX,destY,"Assets_1",obj_player_move_indicator)){player = other;}
		}
	}
	break;
	
	case 1:
	destX = x;
	destY = y;
	if(keyboard_check(global.key_up)){
		destY -= statmap[? "movespeed"];
	}
	if(keyboard_check(global.key_down)){
		destY += statmap[? "movespeed"];
	}
	if(keyboard_check(global.key_left)){
		destX -= statmap[? "movespeed"];
	}
	if(keyboard_check(global.key_right)){
		destX += statmap[? "movespeed"];
	}
	if(destX != x || destY != y){isMoving = true;}
	break;
	
	case 2:
	default:
	show_error("dong status expanded",true);
}

if((point_distance(x, y, destX, destY) < statmap[? "movespeed"] && canMove)){
	isMoving = false;
}

if(isMoving && canMove){
	move(statmap[? "movespeed"], point_direction(x,y,destX,destY));
}

// Stop movement if player can't move
if(x == xprevious && y == yprevious){
	isMoving = false;
}

// Use Items On Hotbar
for(var i = 0; i < 10; ++i){
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
	for (var i = 0; i < array_length_1d(cd); ++i){
		if(cd[i] > 0){cd[i] = 1;}
	}
	for (var i = 0; i < array_length_1d(itemcd); ++i){
		if(itemcd[i] > 0){itemcd[i] = 1;}
	}
}
/*
if(keyboard_check_pressed(vk_shift)){
	switch(inftoggle){
		case 0:
		case 2:
		basestatmap[? "mpregen"] += 100;
		break;
		
		case 1:
		basestatmap[? "hpregen"] += 100;
		basestatmap[? "mpregen"] -= 100;
		break;
		
		case 3:
		inftoggle = -1
		basestatmap[? "hpregen"] -= 100;
		basestatmap[? "mpregen"] -= 100;
		break;
	}
	inftoggle++;	
	recalcStats(self.id);
}*/

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

// Basic Attack
if(mouse_check_button(mb_left) && (atkTimer <= 0) && canAttack){
	
	speed = 0;
	//isMoving = false;
	//canMove = false;
	canAttack = false;
	//canUseSkill = false;
	atkTimer = room_speed/statmap[? "atkspeed"];
	use_basic_attack(self,equips[0],100);

}