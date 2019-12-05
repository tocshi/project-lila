event_inherited();
if(global.pause){exit;}

if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && statmap[? "mp"] >= 30 && canUseSkill){
	direction = point_direction(x,y,mouse_x,mouse_y)+180;
	speed = 12;
	
	ds_list_clear(s_shot_hitList);
	spread_angle = point_direction(x,y,mouse_x,mouse_y)-50;
	for(var i = 0; i < 5; ++i){
	    with(instance_create_layer(x,y,"Attacks",obj_skill_spread_shot)){
			ds_map_copy(atkmap,other.statmap);
			user = other.id;
			atkmap[? "dmgmod"] = 80;
			atkmap[? "element"] = other.atkelement;
			atkmap[? "isSingleHit"]	= true;
			atkmap[? "range"] = 320;
			atkmap[? "isProjectile"] = true;
			atkmap[? "isPiercing"] = false;
		
			skill = atkmap[? "range"]/speed;
			direction = other.spread_angle + 25*i;
			image_angle = direction;
		}
	}
	statmap[? "mp"] -= 30;
	cd[1] = maxcd[1];
	atkTimer = 10;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	alarm[1] = 10;
	proc_unyielding_buff();
}

if(statmap[? "classlvl"] < 2){exit;}
if(keyboard_check_pressed(skill_button[2]) && (cd[2] <= 0) && statmap[? "mp"] >= 10){
	
	statmap[? "mp"] -= 10;
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	cd[2] = maxcd[2];
	
	//clear_debuffs(self.id,"slow");
	applyBuff(self.id,3*room_speed,true,"Move Like Wind",buff_generic,false,-1,0,spr_buff_move_like_wind,"Lorem Ipsum");

	statChange = true;
	proc_unyielding_buff();
}


if(statmap[? "classlvl"] < 3){exit;}
if(keyboard_check_pressed(skill_button[3]) && (cd[3] <= 0) && statmap[? "mp"] >= 30 && canUseSkill){
	if(!instance_exists(obj_enemy)){
		exit;
	}
	target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	
	if(point_distance(mouse_x,mouse_y,target.x,target.y) >= 64){
		exit;
	}
	
	statmap[? "mp"] -= 30;
	
	cd[3] = maxcd[3];
	atkTimer = 22;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	t_shot_remaining = 2;
	alarm[3] = 1;
	proc_unyielding_buff();
}

if(statmap[? "classlvl"] < 4){exit;}
if(keyboard_check_pressed(skill_button[4]) && (cd[4] <= 0) && canUseSkill){

	cd[4] = maxcd[4];
	atkTimer = 48;
	canAttack = false;
	canUseSkill = false;
	with(instance_create_layer(x,y,"Attacks",obj_skill_mantle_of_titania)){
		user = other.id;
		ds_map_copy(atkmap,other.statmap);
		atkmap[? "dmgmod"]		= 15;
		atkmap[? "element"]		= "wind";
	}	
	proc_unyielding_buff();
}

if(statmap[? "classlvl"] < 5){exit;}
if(keyboard_check_pressed(skill_button[5]) && (cd[5] <= 0) && statmap[? "mp"] >= 45 && canUseSkill){
	
	statmap[? "mp"] -= 45;

	cd[5] = maxcd[5];
	isMoving = false;
	highRegenThreshold = 0;
	instance_create_layer(mouse_x,mouse_y,"Attacks",obj_skill_gate_of_wind);
	proc_unyielding_buff();
}


if(statmap[? "classlvl"] < 6){exit;}
if(keyboard_check_pressed(skill_button[6]) && (cd[6] <= 0) && statmap[? "mp"] >= 35 && canUseSkill){
	
	statmap[? "mp"] -= 35;

	cd[6] = maxcd[6];
	isMoving = false;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	atkTimer = 30;
	highRegenThreshold = 0;
	
	
	with(instance_create_layer(mouse_x,mouse_y,"Attacks",obj_skill_arrow_rain)){
		user = other.id;
		ds_map_copy(atkmap,other.statmap);
		atkmap[? "dmgmod"]		= 60;
		atkmap[? "element"]		= other.atkelement;
	}	
	proc_unyielding_buff();
}


if(statmap[? "classlvl"] < 7){exit;}



if(statmap[? "classlvl"] < 8){exit;}



if(statmap[? "classlvl"] < 9){exit;}
if(keyboard_check_pressed(skill_button[9]) && (cd[9] <= 0) && statmap[? "mp"] >= 40 && canUseSkill){

	cd[9] = maxcd[9];
	atkTimer = 30;
	canAttack = false;
	canMove = false;
	isMoving = false;
	canUseSkill = false;
	with(instance_create_layer(x,y,"Attacks",obj_skill_tornado_shot)){
		user = other.id;
		ds_map_copy(atkmap,other.statmap);
		atkmap[? "dmgmod"]		= 40;
		atkmap[? "element"]		= "wind";
		atkmap[? "isProjectile"] = true;
		atkmap[? "isPiercing"] = true;
	}	
	proc_unyielding_buff();
}


if(statmap[? "classlvl"] < 10){exit;}
