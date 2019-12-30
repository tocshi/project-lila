event_inherited();
if(global.pause){exit;}

// have shadow clone copy basic attack
if(mouse_check_button_pressed(mb_left) && instance_exists(obj_ally_shadow_clone)){
	
	with(obj_ally_shadow_clone){
		if(user == other.id && atkTimer <= 0){
			speed = 0;
			canAttack = false;
			atkTimer = room_speed/statmap[? "atkspeed"];
			use_basic_attack(self,other.equips[0],50);
		}
	}
}

if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && statmap[? "mp"] >= 20 && canUseSkill && equips[0] > 0){
	// TODO: when teleporting to a trap, no cooldown
	if(!instance_exists(obj_enemy)){exit;}

	s_step_target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	if((point_distance(mouse_x,mouse_y,s_step_target.x,s_step_target.y) <= 128) && (point_distance(x,y,s_step_target.x,s_step_target.y) <= 440)){
		cancel_basic_attack();
		statmap[? "mp"] -= 20;
		cd[1] = maxcd[1];
		atkTimer = 60;
		canMove = false;
		canAttack = false;
		canUseSkill = false;
		isMoving = false;
		alarm[1] = 60;
		alpha = 0;
		mask_index = spr_empty;
	}
}

if(statmap[? "classlvl"] < 2){exit;}
if(keyboard_check_pressed(skill_button[2]) && (cd[2] <= 0) && statmap[? "mp"] >= 10 && canUseSkill && equips[0] > 0){
	statmap[? "mp"] -= 10;
	cd[2] = maxcd[2];
	with(obj_ally_shadow_clone){
		if(user == other.id){
			var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
			effect.vspeed = -1;
			applyBuff(self,3*room_speed,true,"Vicious Venom",buff_generic,true,1,1,spr_buff_potion_sickness,"Your attacks apply a stack of poison",10);
		}
	}
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	applyBuff(self,3*room_speed,true,"Vicious Venom",buff_generic,true,1,1,spr_buff_potion_sickness,"Your attacks apply a stack of poison",10);
}

if(statmap[? "classlvl"] < 3){exit;}
if(keyboard_check_pressed(skill_button[3]) && (cd[3] <= 0) && statmap[? "mp"] >= 0 && canUseSkill && equips[0] > 0){
}

if(statmap[? "classlvl"] < 4){exit;}
if(keyboard_check_pressed(skill_button[4]) && (cd[4] <= 0) && statmap[? "mp"] >= 0 && canUseSkill && equips[0] > 0){
}

if(statmap[? "classlvl"] < 5){exit;}
if(keyboard_check_pressed(skill_button[5]) && (cd[5] <= 0) && statmap[? "mp"] >= 0 && canUseSkill && equips[0] > 0){
}

if(statmap[? "classlvl"] < 6){exit;}
if(keyboard_check_pressed(skill_button[6]) && (cd[6] <= 0) && statmap[? "mp"] >= 0 && canUseSkill && equips[0] > 0){
}

if(statmap[? "classlvl"] < 7){exit;}
if(keyboard_check_pressed(skill_button[7]) && (cd[7] <= 0) && statmap[? "mp"] >= 0 && canUseSkill && equips[0] > 0){
}

if(statmap[? "classlvl"] < 8){exit;}
if(keyboard_check_pressed(skill_button[8]) && (cd[8] <= 0) && statmap[? "mp"] >= 0 && canUseSkill && equips[0] > 0){
}

if(statmap[? "classlvl"] < 9){exit;}
if(keyboard_check_pressed(skill_button[9]) && (cd[9] <= 0) && statmap[? "mp"] >= 50 && canUseSkill && equips[0] > 0){
	statmap[? "mp"] -= 50;
	cd[9] = maxcd[9];
	with(instance_create_layer(x,y,"Instances",obj_ally_shadow_clone)){
		sprite_index = other.sprite_index;
		image_blend = c_gray;
		user = other.id;
		equips = other.equips;
		ds_map_copy(basestatmap,user.basestatmap);
		ds_map_copy(statmap,basestatmap);
		basestatmap[? "hpregen"] = 0;
		basestatmap[? "mpregen"] = 0;
		canKnockback	= true;
		atkelement = other.atkelement;
		
		// Ally HP Bar
		var minihp = instance_create_layer(x, y, "dmgTxt", obj_allyhpbar);
		minihp.hpwidth	= sprite_width;
		minihp.target	= id;
	}
}

if(statmap[? "classlvl"] < 10){exit;}
if(keyboard_check_pressed(skill_button[10]) && (cd[10] <= 0) && statmap[? "mp"] >= 0 && canUseSkill && equips[0] > 0){
}