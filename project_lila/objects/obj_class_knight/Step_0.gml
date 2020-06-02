event_inherited();
if(global.pause){exit;}

// Use Skill
switch(useSkill){
	case "Empowered Strike":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	
	applyBuff(self.id,5*room_speed,true,"Empowered",buff_empowered,false,-1,1,spr_buff_empowered,"Lorem Ipsum",0);
	statChange = true;
	break;
	
	case "Fearless Challenge":
	var range_check = instance_nearest(x,y,obj_enemy);
	if(distance_to_object(range_check) > 300){exit;}
	
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	
	var hit = min(10,collision_circle_list(x,y,320,obj_enemy,true,true,f_challenge_list,false));
	applyBuff(self,6*room_speed,true,"Fearless Challenge",buff_generic,false,hit,10,spr_buff_TODO,"Lorem Ipsum",0);
	for(var i = 0; i < ds_list_size(f_challenge_list); ++i){
		var target = f_challenge_list[| i];
		applyBuff(target,6*room_speed,true,"Taunt",buff_generic,false,-1,1,spr_buff_TODO,"Lorem Ipsum",self);
		var effect = instance_create_layer(target.x-(target.sprite_width/2),target.y-(target.sprite_height/2),"Assets_1",obj_taunt_effect);
		effect.user = target;
	}
	ds_list_clear(f_challenge_list);
	break;
	
	case "Shield Charge":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
	ds_list_clear(scList);
	atkTimer = 30;
	highRegenThreshold = 0;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	
	charge_direction = point_direction(x,y,mouse_x,mouse_y);
	
	applyBuff(self.id,30,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum",0);

	shield_charge = 29;
	with(instance_create_layer(x,y,"Attacks",obj_skill_shield_charge)){
		user = other.id;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "element"] = other.atkelement;
		atkmap[? "dmgmod"] = 50;
		speed = 30;
		direction = user.charge_direction;
		image_angle = direction;
	}
	break;
	
	case "Roundslash":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
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
	break;
	
	case "Guardian":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
	
	if(instance_exists(obj_ally)){
		guardian_target = instance_nearest(mouse_x,mouse_y,obj_ally);

		if((point_distance(mouse_x,mouse_y,guardian_target.x,guardian_target.y) <= 128) && (point_distance(x,y,guardian_target.x,guardian_target.y) <= 448)){
			speed = 15;
			following_ally = true;
			atkTimer = clamp(round(point_distance(x,y,guardian_target.x,guardian_target.y)/15),1,30);
			canMove = false;
			canAttack = false;
			canUseSkill = false;
			isMoving = false;
		}
		else {
			guardian_target = self.id;
			applyBuff(guardian_target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum",0);
		}		
	}
	else {
		guardian_target = self.id;
		applyBuff(guardian_target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum",0);
	}
	
	highRegenThreshold = 0;
	break;
	
	case "Protective Footwork":
	use_skill_mp(useSkill,"")
	cancel_basic_attack();
	
	direction = point_direction(x,y,mouse_x,mouse_y)+180;
	speed = 8;
	
	if(hasBuff(self.id,"Protective Footwork II")){
		removeBuff(self.id,"Protective Footwork II",false);
		set_skill_cd(useSkill,"");
		protective_footwork_mod = 400;
	}
	else if(hasBuff(self.id,"Protective Footwork I")){
		applyBuff(self.id,180,false,"Protective Footwork II",buff_protective_footwork,false,-1,0,spr_buff_protective_footwork2,"Lorem Ipsum",0);
		removeBuff(self.id,"Protective Footwork I",false);
		set_skill_cd(useSkill,0.8*room_speed);
		protective_footwork_mod = 240;
		set_skill_data(useSkill,"sprmap",8);
	}
	else{
		set_skill_cd(useSkill,0.8*room_speed);
		applyBuff(self.id,180,false,"Protective Footwork I",buff_protective_footwork,false,-1,0,spr_buff_protective_footwork1,"Lorem Ipsum",0);
		protective_footwork_mod = 160;
		set_skill_data(useSkill,"sprmap",7);
	}
		
	atkTimer = 15;
	highRegenThreshold = 0;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	applyBuff(self.id,30,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_buff_knights_shield,"Lorem Ipsum",0);
	alarm[7] = 20;
	break;
	
	case "Shield Bash":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
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
	break;
	
	case "Aegis Aura":
	with(obj_skill_aegis_aura){
		if(user == other.id){
			instance_destroy();
			set_skill_data("Aegis Aura","sprmap",10);
			cd[findArrayIndex(other.skills,"Aegis Aura")+1] = get_skill_data("Aegis Aura","cd")*room_speed;
			exit;
		}
	}
	with(instance_create_layer(x,y,"Ground",obj_skill_aegis_aura)){
		user = other.id;
	}
	set_skill_data(useSkill,"sprmap",11);
	set_skill_cd(useSkill,"");
	break;

	default:
	break;
}

// use passive skills
if(isBlocking && cd[findArrayIndex(skills,"Greater Shielding")+1] <= 0){
	applyBuff(self.id,99*room_speed,true,"Knight's Shield: Enhanced",buff_generic,false,-1,0,spr_buff_knights_shield_plus,"Lorem Ipsum",0);
}
