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

if(keyboard_check_pressed(skill_button[2]) && (cd[2] <= 0) && statmap[? "mp"] >= 20 && canUseSkill){
	
	statmap[? "mp"] -= 20;
	cd[2] = maxcd[2];
	atkTimer = 10;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	highRegenThreshold = 0;
	instance_create_layer(x,y,"Attacks",obj_skill_fireball);

}


if(keyboard_check_pressed(skill_button[4]) && (cd[4] <= 0) && statmap[? "mp"] >= 30 && canUseSkill){
	
	if(!instance_exists(obj_enemy)){
		exit;
	}
	target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	
	if(point_distance(mouse_x,mouse_y,target.x,target.y) >= 64){
		exit;
	}
	
	statmap[? "mp"] -= 30;
	
	cd[4] = maxcd[4];
	atkTimer = 22;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	highRegenThreshold = 0;
	t_shot_remaining = 2;
	alarm[4] = 1;
}


if(keyboard_check_pressed(skill_button[6]) && (cd[6] <= 0) && statmap[? "mp"] >= 35 && canUseSkill){
	
	statmap[? "mp"] -= 35;

	cd[6] = maxcd[6];
	isMoving = false;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	atkTimer = 30;
	highRegenThreshold = 0;
	
	
	var skillobj = instance_create_layer(mouse_x,mouse_y,"Attacks",obj_skill_arrow_rain);
	
	ds_map_copy(skillobj.atkmap,statmap);
	skillobj.atkmap[? "dmgmod"]			= 60;
	skillobj.atkmap[? "element"]		= "none";
	
	skillobj.atkmap[? "sourceX"]		= mouse_x;
	skillobj.atkmap[? "sourceY"]		= mouse_y;
}

if(keyboard_check_pressed(skill_button[7]) && (cd[7] <= 0) && statmap[? "mp"] >= 45 && canUseSkill){
	
	statmap[? "mp"] -= 45;

	cd[7] = maxcd[7];
	isMoving = false;
	highRegenThreshold = 0;
	instance_create_layer(mouse_x,mouse_y,"Attacks",obj_skill_gate_of_wind);

}




