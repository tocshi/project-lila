event_inherited();
if(global.pause){exit;}

if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && statmap[? "mp"] >= 20 && equips[0] > 0){
	
	statmap[? "mp"] -= 20;
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	cd[1] = maxcd[1];
	
	applyBuff(self.id,5*room_speed,true,"Empowered",buff_empowered,false,-1,1,spr_buff_empowered,"Lorem Ipsum",0);

	statChange = true;
}

if(statmap[? "classlvl"] < 2){exit;}
if(keyboard_check_pressed(skill_button[2]) && (cd[2] <= 0) && statmap[? "mp"] >= 30 && equips[0] > 0){
	var range_check = instance_nearest(x,y,obj_enemy);
	if(distance_to_object(range_check) > 300){exit;}
	
	statmap[? "mp"] -= 30;
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	cd[2] = maxcd[2];
	
	var hit = min(10,collision_circle_list(x,y,320,obj_enemy,true,true,f_challenge_list,false));
	applyBuff(self,6*room_speed,true,"Fearless Challenge",buff_generic,false,hit,10,spr_buff_TODO,"Lorem Ipsum",0);
	for(var i = 0; i < ds_list_size(f_challenge_list); ++i){
		var target = f_challenge_list[| i];
		applyBuff(target,6*room_speed,true,"Taunt",buff_generic,false,-1,1,spr_buff_TODO,"Lorem Ipsum",self);
		var effect = instance_create_layer(target.x-(target.sprite_width/2),target.y-(target.sprite_height/2),"Assets_1",obj_taunt_effect);
		effect.user = target;
	}
	ds_list_clear(f_challenge_list);
}

if(statmap[? "classlvl"] < 3){exit;}
if(keyboard_check_pressed(skill_button[3]) && (cd[3] <= 0) && statmap[? "mp"] >= 30 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	
	ds_list_clear(scList);
	statmap[? "mp"] -= 30;
	
	cd[3] = maxcd[3];
	atkTimer = 30;
	highRegenThreshold = 0;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	
	direction = point_direction(x,y,mouse_x,mouse_y);
	speed = 15;
	
	applyBuff(self.id,30,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum",0);

	shield_charge = 29;

}

if(statmap[? "classlvl"] < 4){exit;}
if(keyboard_check_pressed(skill_button[4]) && (cd[4] <= 0) && statmap[? "mp"] >= 20 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	
	statmap[? "mp"] -= 20;
	cd[4] = maxcd[4];
	atkTimer = 30;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	highRegenThreshold = 0;
	with(instance_create_layer(x,y,"Attacks",obj_skill_roundslash)){
		user = other.id;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "element"] = other.atkelement;
		sprite = make_sprite_from_item(user.equips[0]);
		sprite_index = sprite;
		enemies = collision_circle_list(x, y, sprite_width, obj_enemy, false, true, enemylist, false);
		atkmap[? "dmgmod"] = 130 + 10*enemies;
	}
	

}

if(statmap[? "classlvl"] < 5){exit;}
if(keyboard_check_pressed(skill_button[5]) && (cd[5] <= 0) && statmap[? "mp"] >= 25 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	
	if(instance_exists(obj_ally)){
		target = instance_nearest(mouse_x,mouse_y,obj_ally);

		if((point_distance(mouse_x,mouse_y,target.x,target.y) <= 128) && (point_distance(x,y,target.x,target.y) <= 448)){
			speed = 15;
			following_ally = true;
			atkTimer = clamp(round(point_distance(x,y,target.x,target.y)/15),1,30);
			canMove = false;
			canAttack = false;
			canUseSkill = false;
			isMoving = false;
		}
		else {
			target = self.id;
			applyBuff(target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum",0);

		}
				
	}
	else {
		target = self.id;
		applyBuff(target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum",0);
	}
	
	statmap[? "mp"] -= 25;
	
	cd[5] = maxcd[5];
	highRegenThreshold = 0;

}

if(statmap[? "classlvl"] < 6){exit;}

if(statmap[? "classlvl"] < 7){exit;}
if(keyboard_check_pressed(skill_button[7]) && (cd[7] <= 0) && statmap[? "mp"] >= 20 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	
	direction = point_direction(x,y,mouse_x,mouse_y)+180;
	speed = 8;
	
	if(hasBuff(self.id,"Protective Footwork II")){
		removeBuff(self.id,"Protective Footwork II",false);
		cd[7] = maxcd[7];
		protective_footwork_mod = 400;
	}
	else if(hasBuff(self.id,"Protective Footwork I")){
		applyBuff(self.id,180,false,"Protective Footwork II",buff_protective_footwork,false,-1,0,spr_buff_protective_footwork2,"Lorem Ipsum",0);
		removeBuff(self.id,"Protective Footwork I",false);
		cd[7] = 0.8*room_speed;
		protective_footwork_mod = 240;
	}
	else{
		cd[7] = 0.8*room_speed;
		applyBuff(self.id,180,false,"Protective Footwork I",buff_protective_footwork,false,-1,0,spr_buff_protective_footwork1,"Lorem Ipsum",0);
		protective_footwork_mod = 160;
	}
		
	statmap[? "mp"] -= 20;
	atkTimer = 15;
	highRegenThreshold = 0;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	applyBuff(self.id,30,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum",0);
	alarm[7] = 20;
	

}

if(statmap[? "classlvl"] < 8){exit;}
if(keyboard_check_pressed(skill_button[8]) && (cd[8] <= 0) && statmap[? "mp"] >= 25 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	
	statmap[? "mp"] -= 25;

	cd[8] = maxcd[8];
	isMoving = false;
	canMove = false;
	canUseSkill = false;
	atkTimer = 20;
	speed = 0;
	highRegenThreshold = 0;
	var skillobj = instance_create_layer(x,y,"Attacks",obj_skill_shield_bash);
	skillobj.direction = point_direction(x,y,mouse_x,mouse_y);
	skillobj.image_angle = point_direction(x,y,mouse_x,mouse_y);
	skillobj.speed = 5;
	
	if(hasBuff(self.id,"Knight's Shield")){
		skillobj.buffed = true;
		skillobj.atkmap[? "dmgmod"] = 270;
		skillobj.atkmap[? "element"] = "none";
		skillobj.image_blend = c_yellow;
	}
	else{
		skillobj.buffed = false;
		skillobj.atkmap[? "dmgmod"] = 90;
		skillobj.atkmap[? "element"] = "none";
	}
}

if(statmap[? "classlvl"] < 9){exit;}
if(keyboard_check_pressed(skill_button[9]) && (cd[9] <= 0) && canUseSkill && equips[0] > 0){
	
	with(obj_skill_aegis_aura){
		if(user == other.id){
		instance_destroy();
		exit;
		}
	}
	with(instance_create_layer(x,y,"Ground",obj_skill_aegis_aura)){
		user = other.id;
	}
	cd[9] = maxcd[9];
}

if(statmap[? "classlvl"] < 10){exit;}
if(isBlocking && cd[10] <= 0){
	applyBuff(self.id,99*room_speed,true,"Knight's Shield: Enhanced",buff_generic,false,-1,0,spr_buff_knights_shield_plus,"Lorem Ipsum",0);
}
