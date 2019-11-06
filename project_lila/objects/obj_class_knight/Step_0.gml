event_inherited();

if(mouse_check_button_pressed(mb_left) && (cd[0] <= 0) && canAttack){
	
	speed = 0;
	isMoving = false;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	cd[0] = room_speed/statmap[? "atkspeed"];
	atkTimer = cd[0];
	
	var basic_attack = instance_create_layer(x,y,"Attacks",obj_basicattack_longsword);
	iter0++;
	basic_attack.iter0 = self.iter0;
	
	ds_map_copy(basic_attack.atkmap,statmap);
	basic_attack.atkmap[? "dmgmod"]			= 100;
	if(empowered_buff){
		basic_attack.atkmap[? "dmgmod"]		= 250;
		removeBuff(self.id,"Empowered");
	}
	basic_attack.atkmap[? "element"]		= "none";
	
	basic_attack.atkmap[? "sourceX"]		= x;
	basic_attack.atkmap[? "sourceY"]		= y;
	basic_attack.atkmap[? "flinch_amount"]	= 4;
	
	basic_attack.atkmap[? "isBasicAttack"]	= true;
	basic_attack.atkmap[? "isSingleHit"]	= true;

}


if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && statmap[? "mp"] >= 20 && canUseSkill){
	
	statmap[? "mp"] -= 20;
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	cd[1] = maxcd[1];
	
	var skillobj = instance_create_layer(x,y,"Attacks",obj_skill_empowered_strike);
	skillobj.atkmap[? "isBuff"] = true;
	
	var buff_array = array_create(6,false);
	buff_array[0] = 3*room_speed;
	buff_array[1] = true;
	buff_array[2] = "Empowered";
	buff_array[3] = buff_empowered;
	buff_array[5] = -1;
	buff_array[6] = 0;
	ds_list_add(buff,buff_array);
	relative_speedups[? "Empowered"] = 2;

	empowered_buff = true;
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
	
	applyBuff(self.id,30,true,"Knight's Shield",buff_knights_shield,false,-1,0);

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
	var skillobj = instance_create_layer(x,y,"Attacks",obj_skill_roundslash);
	skillobj.user  = self.id;

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
			applyBuff(target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0);

		}
				
	}
	
	statmap[? "mp"] -= 25;
	
	cd[5] = maxcd[5];
	highRegenThreshold = 0;

}

if(statmap[? "classlvl"] < 6){exit;}
if(!allRounderApplied){
	origatk = statmap[? "atk"];
	origdef = statmap[? "def"];
	statmap[? "atk"] += origdef*0.3;
	statmap[? "def"] += origatk*0.3;
	allRounderApplied = true;
}


if(statmap[? "classlvl"] < 7){exit;}
if(keyboard_check_pressed(skill_button[7]) && (cd[7] <= 0) && statmap[? "mp"] >= 20 && canUseSkill){
	
	
	
	direction = point_direction(x,y,mouse_x,mouse_y)+180;
	speed = 8;
	
	if(hasBuff(self.id,"Protective Footwork II")){
		removeBuff(self.id,"Protective Footwork II");
		cd[7] = maxcd[7];
		protective_footwork_mod = 400;
	}
	else if(hasBuff(self.id,"Protective Footwork I")){
		applyBuff(self.id,180,false,"Protective Footwork II",buff_protective_footwork,false,-1,0);
		removeBuff(self.id,"Protective Footwork I");
		cd[7] = 0.8*room_speed;
		protective_footwork_mod = 240;
	}
	else{
		cd[7] = 0.8*room_speed;
		applyBuff(self.id,180,false,"Protective Footwork I",buff_protective_footwork,false,-1,0);
		protective_footwork_mod = 160;
	}
		
	statmap[? "mp"] -= 20;
	atkTimer = 15;
	highRegenThreshold = 0;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	applyBuff(self.id,22,true,"Knight's Shield",buff_knights_shield,false,-1,0);
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


if(statmap[? "classlvl"] < 10){exit;}

