event_inherited();
if(global.pause){exit;}

if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && statmap[? "mp"] >= 20){
	
	statmap[? "mp"] -= 20;
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	cd[1] = maxcd[1];
	
	applyBuff(self.id,5*room_speed,true,"Empowered",buff_empowered,false,-1,1,spr_buff_empowered,"Lorem Ipsum");

	statChange = true;
}

if(statmap[? "classlvl"] < 2){exit;}

if(statmap[? "classlvl"] < 3){exit;}
if(keyboard_check_pressed(skill_button[3]) && (cd[3] <= 0) && statmap[? "mp"] >= 30 && canUseSkill){
	
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
	
	applyBuff(self.id,30,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum");

	shield_charge = 29;

}

if(statmap[? "classlvl"] < 4){exit;}
if(keyboard_check_pressed(skill_button[4]) && (cd[4] <= 0) && statmap[? "mp"] >= 20 && canUseSkill){
	
	
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
		atkmap[? "element"] = other.atkelement;
		sprite = make_sprite_from_item(user.equips[0]);
		sprite_index = sprite;
		enemies = collision_circle_list(x, y, sprite_width, obj_enemy, false, true, enemylist, false);
		atkmap[? "dmgmod"] = 130 + 10*enemies;
	}
	

}

if(statmap[? "classlvl"] < 5){exit;}
if(keyboard_check_pressed(skill_button[5]) && (cd[5] <= 0) && statmap[? "mp"] >= 25 && canUseSkill){
	
	
	
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
			applyBuff(target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum");

		}
				
	}
	
	statmap[? "mp"] -= 25;
	
	cd[5] = maxcd[5];
	highRegenThreshold = 0;

}

if(statmap[? "classlvl"] < 6){exit;}

if(statmap[? "classlvl"] < 7){exit;}
if(keyboard_check_pressed(skill_button[7]) && (cd[7] <= 0) && statmap[? "mp"] >= 20 && canUseSkill){
	
	
	
	direction = point_direction(x,y,mouse_x,mouse_y)+180;
	speed = 8;
	
	if(hasBuff(self.id,"Protective Footwork II")){
		removeBuff(self.id,"Protective Footwork II",false);
		cd[7] = maxcd[7];
		protective_footwork_mod = 400;
	}
	else if(hasBuff(self.id,"Protective Footwork I")){
		applyBuff(self.id,180,false,"Protective Footwork II",buff_protective_footwork,false,-1,0,spr_buff_protective_footwork2,"Lorem Ipsum");
		removeBuff(self.id,"Protective Footwork I",false);
		cd[7] = 0.8*room_speed;
		protective_footwork_mod = 240;
	}
	else{
		cd[7] = 0.8*room_speed;
		applyBuff(self.id,180,false,"Protective Footwork I",buff_protective_footwork,false,-1,0,spr_buff_protective_footwork1,"Lorem Ipsum");
		protective_footwork_mod = 160;
	}
		
	statmap[? "mp"] -= 20;
	atkTimer = 15;
	highRegenThreshold = 0;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	applyBuff(self.id,22,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum");
	alarm[7] = 20;
	

}

if(statmap[? "classlvl"] < 8){exit;}
if(keyboard_check_pressed(skill_button[8]) && (cd[8] <= 0) && statmap[? "mp"] >= 25 && canUseSkill){
	
	statmap[? "mp"] -= 25;

	cd[8] = maxcd[8];
	isMoving = false;
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
if(keyboard_check_pressed(skill_button[9]) && (cd[9] <= 0) && canUseSkill){
	
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
	applyBuff(self.id,99*room_speed,true,"Knight's Shield: Enhanced",buff_generic,false,-1,0,spr_buff_knights_shield_plus,"Lorem Ipsum");
}
