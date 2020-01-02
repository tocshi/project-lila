event_inherited();
if(global.pause){exit;}

if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && statmap[? "mp"] >= 25 && canUseSkill && equips[0] > 0){
	cd[1] = maxcd[1];
	statmap[? "mp"] -= 25;
	atkTimer = 10;
	canAttack = false;
	canUseSkill = false;
	if(hasBuff(self,"Primordial Mana")){
		removeBuff(self,"Primordial Mana",false);
		with(instance_create_layer(x,y,"Attacks",obj_skill_meteor_drive)){
			user = other.id;
			ds_map_copy(atkmap,other.statmap);
			atkmap[? "dmgmod"]			= 260;
			atkmap[? "element"]			= "fire";
			atkmap[? "range"]			= 512;

			atkmap[? "isProjectile"]	= true;
			atkmap[? "isPiercing"]		= true;
			
		}
	}
	else{
		with(instance_create_layer(x,y,"Attacks",obj_skill_fireball)){
			user = other.id;
			ds_map_copy(atkmap,other.statmap);
			atkmap[? "dmgmod"]			= 180;

			atkmap[? "element"]			= "fire";
			atkmap[? "range"]			= 512;

			atkmap[? "isProjectile"]	= true;
			atkmap[? "isPiercing"]		= false;
			atkmap[? "isSingleTarget"]	= true;
			atkmap[? "isSingleHit"]		= true;
			skill = atkmap[? "range"]/speed;
		}
	}
}

if(statmap[? "classlvl"] < 2){exit;}
if(keyboard_check_pressed(skill_button[2]) && (cd[2] <= 0) && statmap[? "mp"] >= 25 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	statmap[? "mp"] -= 25;

	cd[2] = maxcd[2];
	highRegenThreshold = 0;
	if(hasBuff(self,"Primordial Mana")){
		removeBuff(self,"Primordial Mana",false);
		with(instance_create_layer(x,y,"Attacks",obj_skill_absolute_zero)){
			user = other.id;
			ds_map_copy(atkmap,other.statmap);
			atkmap[? "dmgmod"]		= 640;
			atkmap[? "element"]		= "ice";
		}
	}
	else{
		with(instance_create_layer(x,y,"Attacks",obj_skill_blizzard)){
			user = other.id;
			ds_map_copy(atkmap,other.statmap);
			atkmap[? "dmgmod"]		= 30;
			atkmap[? "element"]		= "ice";
		}
	}	
}

if(statmap[? "classlvl"] < 3){exit;}
if(keyboard_check_pressed(skill_button[3]) && (cd[3] <= 0) && statmap[? "mp"] >= 25 && canUseSkill && equips[0] > 0){
	var next_target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	if(next_target == noone || point_distance(x,y,next_target.x,next_target.y) > 320){exit;}
	cancel_basic_attack();
	ds_list_clear(c_lightning_hitList);
	statmap[? "mp"] -= 25;

	cd[3] = maxcd[3];
	atkTimer = 30;
	canAttack = false;
	canUseSkill = false;
	
	with(instance_create_layer(x,y,"Attacks",obj_skill_chain_lightning)){
		user = other.id;
		anchor = user;
		target = next_target;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "dmgmod"]			= 170;
		atkmap[? "element"]			= "lightning";
			
		atkmap[? "isSingleTarget"]	= true;
		atkmap[? "isSingleHit"]		= true;
		if(hasBuff(user,"Primordial Mana")){
			removeBuff(user,"Primordial Mana",false);
			self.remaining = 8;	
			primordial = true;
		}
		else{
			self.remaining = 3;
		}
			
		image_angle = point_direction(x,y,target.x,target.y);
		image_xscale = point_distance(x,y,target.x,target.y)/sprite_get_width(spr_chain_lightning);
	}
}

if(statmap[? "classlvl"] < 4){exit;}
if(keyboard_check_pressed(skill_button[4]) && (cd[4] <= 0) && statmap[? "mp"] >= 15 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	statmap[? "mp"] -= 15;

	highRegenThreshold = 0;
	isMoving = false;
	
	for(var i = 0; i < instance_number(obj_skill_blink_start); ++i){
		var blink = instance_find(obj_skill_blink_start,i);
		if(blink.user == self){
			instance_create_layer(blink.x,blink.y,"Attacks",obj_skill_blink_end);
			x = blink.x;
			y = blink.y;
			blink.skill = 0;
			exit;
		}
	}
	
	with(instance_create_layer(x,y,"Ground",obj_skill_blink_start)){
		user = other.id;
	}
	var dist = min(point_distance(x,y,mouse_x,mouse_y),420);
	var dir = point_direction(x,y,mouse_x,mouse_y);
	
	var xx = x + dcos(dir)*dist;
	var yy = y - dsin(dir)*dist;
	var attempt = 0;
	while(collision_circle(xx,yy,33,obj_wall_parent,false,true)){
		xx = lerp(xx,x,0.01);
		yy = lerp(yy,y,0.01);
		attempt++;
		if(attempt >= 300){break;}
	}
	var blink = instance_create_layer(xx,yy,"Attacks",obj_skill_blink_end);
	x = xx;
	y = yy;
	cd[4] = 30;
}

if(statmap[? "classlvl"] < 6){exit;}
if(keyboard_check_pressed(skill_button[6]) && (cd[6] <= 0) && statmap[? "mp"] >= 45 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	statmap[? "mp"] -= 45;

	cd[6] = maxcd[6];
	isMoving = false;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	atkTimer = 10;
	highRegenThreshold = 0;
	
	var dist = min(point_distance(x,y,mouse_x,mouse_y),480);
	var dir = point_direction(x,y,mouse_x,mouse_y);
	var xx = x + dcos(dir)*dist;
	var yy = y - dsin(dir)*dist;
	
	with(instance_create_layer(xx,yy,"Terrain",obj_skill_volcano)){
		user = other.id;
	}
}

if(statmap[? "classlvl"] < 7){exit;}
if(keyboard_check_pressed(skill_button[7]) && (cd[7] <= 0) && statmap[? "mp"] >= 45 && canUseSkill && equips[0] > 0){
	ds_list_clear(i_salvo_targets);
	var targets = collision_circle_list(x,y,480,obj_enemy,true,true,i_salvo_targets,false);
	if(targets <= 0){exit;}
	
	cancel_basic_attack();
	statmap[? "mp"] -= 45;
	
	var remaining = 6;
	ds_list_clear(i_salvo_hitList);
	ds_list_shuffle(i_salvo_targets);
	
	cd[7] = maxcd[7];
	isMoving = false;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	atkTimer = 30;
	highRegenThreshold = 0;
	
	while(remaining > 0){
		for(var i = 0; i < ds_list_size(i_salvo_targets); ++i){
			with(instance_create_layer(x+i_salvo_coords[remaining-1,0],y+i_salvo_coords[remaining-1,1],"Attacks",obj_skill_icicle_salvo)){
				user = other.id;
				ds_map_copy(atkmap,other.statmap);
				atkmap[? "dmgmod"]			= 220;
				atkmap[? "element"]			= "ice";
				atkmap[? "isProjectile"]	= true;
				atkmap[? "isPiercing"]		= false;
				
				target = other.i_salvo_targets[| i];
				direction = point_direction(other.x,other.y,x,y);
				image_angle = direction;
			}
			remaining--;
			if(remaining <= 0){break;}
		}
	}	
}

if(statmap[? "classlvl"] < 8){exit;}
if(keyboard_check_pressed(skill_button[8]) && (cd[8] <= 0) && statmap[? "mp"] >= 45 && canUseSkill && equips[0] > 0){
	cancel_basic_attack();
	statmap[? "mp"] -= 45;

	cd[8] = maxcd[8];
	isMoving = false;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	atkTimer = 10;
	
	var dist = min(point_distance(x,y,mouse_x,mouse_y),480);
	var dir = point_direction(x,y,mouse_x,mouse_y);
	var xx = x + dcos(dir)*dist;
	var yy = y - dsin(dir)*dist;
	
	with(instance_create_layer(xx,yy-600,"Attacks",obj_skill_lightning_rod)){
		user = other.id;
		ds_map_copy(atkmap,other.statmap);
		atkmap[? "dmgmod"]		= 150;
		atkmap[? "element"]		= "lightning";
	}
}

if(statmap[? "classlvl"] < 9){exit;}
if(keyboard_check_pressed(skill_button[9]) && (cd[9] <= 0) && statmap[? "mp"] >= 40 && canUseSkill && equips[0] > 0){
	var next_target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	if(next_target == noone || point_distance(x,y,next_target.x,next_target.y) > 320){exit;}
	cancel_basic_attack();
	cd[9] = maxcd[9];
	statmap[? "mp"] -= 40;
	isMoving = false;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	atkTimer = 30;
	with(instance_create_layer(next_target.x,next_target.y,"Attacks",obj_skill_mana_detonation)){
		user = other;
		target = next_target;
		atkmap[? "dmgmod"]		= 340;
		atkmap[? "element"]		= "none";
	}
}

if(statmap[? "classlvl"] < 10){exit;}
if(keyboard_check_pressed(skill_button[10]) && (cd[10] <= 0) && statmap[? "mp"] >= 25 && canUseSkill && equips[0] > 0){
	cd[10] = maxcd[10];
	statmap[? "mp"] -= 25;
	highRegenThreshold = 0;
	applyBuff(self,maxcd[10],true,"Primordial Mana",buff_generic,true,1,1,spr_buff_primordial_mana,"Enhances your next basic elemental spell with Primordial Mana.",0);
	with(instance_create_layer(x,y+sprite_height/2,"Attacks",obj_skill_primordial_mana)){
		user = other;
	}
}