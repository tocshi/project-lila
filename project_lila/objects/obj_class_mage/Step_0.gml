event_inherited();
if(global.pause){exit;}

if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && statmap[? "mp"] >= 20 && canUseSkill){
	statmap[? "mp"] -= 20;
	cd[1] = maxcd[1];
	atkTimer = 10;
	canAttack = false;
	canUseSkill = false;
	with(instance_create_layer(x,y,"Attacks",obj_skill_fireball)){
		user = other.id;
		ds_map_copy(atkmap,other.statmap);
		atkmap[? "dmgmod"]			= 120;

		atkmap[? "element"]			= "fire";
		atkmap[? "range"]			= 512;

		atkmap[? "isProjectile"]	= true;
		atkmap[? "isPiercing"]		= false;
		atkmap[? "isSingleTarget"]	= true;
		atkmap[? "isSingleHit"]		= true;
		skill = atkmap[? "range"]/speed;
	}
}

if(statmap[? "classlvl"] < 2){exit;}
if(keyboard_check_pressed(skill_button[2]) && (cd[2] <= 0) && statmap[? "mp"] >= 20 && canUseSkill){
	cancel_basic_attack();
	statmap[? "mp"] -= 20;

	cd[2] = maxcd[2];
	highRegenThreshold = 0;
	
	with(instance_create_layer(x,y,"Attacks",obj_skill_blizzard)){
		user = other.id;
		ds_map_copy(atkmap,other.statmap);
		atkmap[? "dmgmod"]		= 25;
		atkmap[? "element"]		= "ice";
	}	
}

if(statmap[? "classlvl"] < 3){exit;}
if(keyboard_check_pressed(skill_button[3]) && (cd[3] <= 0) && statmap[? "mp"] >= 20 && canUseSkill){
	var next_target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	if(next_target == noone || point_distance(x,y,next_target.x,next_target.y) > 320){exit;}
	cancel_basic_attack();
	ds_list_clear(c_lightning_hitList);
	statmap[? "mp"] -= 20;

	cd[3] = maxcd[3];
	atkTimer = 30;
	canAttack = false;
	canUseSkill = false;
	
	with(instance_create_layer(x,y,"Attacks",obj_skill_chain_lightning)){
		user = other.id;
		anchor = user;
		target = next_target;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "dmgmod"]			= 90;
		atkmap[? "element"]			= "lightning";
			
		atkmap[? "isSingleTarget"]	= true;
		atkmap[? "isSingleHit"]		= true;
		remaining = 3;	
		
		image_angle = point_direction(x,y,target.x,target.y);
		image_xscale = point_distance(x,y,target.x,target.y)/sprite_get_width(spr_chain_lightning);
	}
}

if(statmap[? "classlvl"] < 4){exit;}
if(keyboard_check_pressed(skill_button[4]) && (cd[4] <= 0) && statmap[? "mp"] >= 0 && canUseSkill){
}

if(statmap[? "classlvl"] < 5){exit;}
if(keyboard_check_pressed(skill_button[5]) && (cd[5] <= 0) && statmap[? "mp"] >= 0 && canUseSkill){
}

if(statmap[? "classlvl"] < 6){exit;}
if(keyboard_check_pressed(skill_button[6]) && (cd[6] <= 0) && statmap[? "mp"] >= 0 && canUseSkill){
}

if(statmap[? "classlvl"] < 7){exit;}
if(keyboard_check_pressed(skill_button[7]) && (cd[7] <= 0) && statmap[? "mp"] >= 0 && canUseSkill){
}

if(statmap[? "classlvl"] < 8){exit;}
if(keyboard_check_pressed(skill_button[8]) && (cd[8] <= 0) && statmap[? "mp"] >= 0 && canUseSkill){
}

if(statmap[? "classlvl"] < 9){exit;}
if(keyboard_check_pressed(skill_button[9]) && (cd[9] <= 0) && statmap[? "mp"] >= 40 && canUseSkill){
}

if(statmap[? "classlvl"] < 10){exit;}
if(keyboard_check_pressed(skill_button[10]) && (cd[10] <= 0) && statmap[? "mp"] >= 0 && canUseSkill){
}