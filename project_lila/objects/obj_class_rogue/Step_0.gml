event_inherited();
if(global.pause){exit;}

// have shadow clone copy basic attack
if(mouse_check_button(mb_left) && instance_exists(obj_ally_shadow_clone)){
	
	with(obj_ally_shadow_clone){
		if(user == other.id && atkTimer <= 0){
			speed = 0;
			canAttack = false;
			atkTimer = room_speed/statmap[? "atkspeed"];
			use_basic_attack(self,other.equips[0],50);
		}
	}
}

// Use Skill
switch(useSkill){
	case "Shadow Step":
	if(!instance_exists(obj_enemy) && !instance_exists(obj_skill_rogue_trap)){exit;}

	var target0 = instance_nearest(mouse_x,mouse_y,obj_enemy);
	var target1 = instance_nearest(mouse_x,mouse_y,obj_skill_rogue_trap);
	if(target0 == noone){
		s_step_target = target1;
	}
	else if(target1 == noone){
		s_step_target = target0;
	}
	else{
		if(point_distance(mouse_x,mouse_y,target0.x,target0.y) > point_distance(mouse_x,mouse_y,target1.x,target1.y)){
			s_step_target = target1;
		}
		else{
			s_step_target = target0;
		}
	}
	if((point_distance(mouse_x,mouse_y,s_step_target.x,s_step_target.y) <= 128) && (point_distance(x,y,s_step_target.x,s_step_target.y) <= 440)){
		cancel_basic_attack();
		use_skill_mp(useSkill,"")
		set_skill_cd(useSkill,"");
		atkTimer = 60;
		alarm[1] = atkTimer;
		canMove = false;
		canAttack = false;
		canUseSkill = false;
		isMoving = false;
		alarm[2] = 60;
		image_alpha = 0;
		mask_index = spr_empty;
	}
	break;
	
	case "Vicious Venom":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
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
	break;
	
	case "Dual Traps":
	var dist = point_distance(x,y,mouse_x,mouse_y);
	if(dist > 420){exit;}
	var dir = point_direction(x,y,mouse_x,mouse_y);
	var xx = x + dcos(dir)*dist;
	var yy = y - dsin(dir)*dist;
	cancel_basic_attack();
	
	if(hasBuff(self.id,"Enable Shock Trap")){
		removeBuff(self.id,"Enable Shock Trap",false);
		set_skill_cd(useSkill,"");
		with(instance_create_layer(xx,yy,"Ground",obj_skill_rogue_trap)){
			sprite_index = spr_shock_trap;
			user = other.id;
		}
	}
	else{
		set_skill_cd(useSkill,0.8*room_speed);
		applyBuff(self.id,180,false,"Enable Shock Trap",buff_shock_trap,false,-1,0,spr_buff_electrified,"Lorem Ipsum",0);
		with(instance_create_layer(xx,yy,"Terrain",obj_skill_rogue_trap)){
			sprite_index = spr_poison_trap;
			user = other.id;
		}
		set_skill_data("Dual Traps","sprmap",3);
	}		
	use_skill_mp(useSkill,"")
	atkTimer = 10;
	alarm[1] = atkTimer;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	break;
	
	case "Triple Fangs":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	with(obj_ally_shadow_clone){
		if(user == other.id){
			cancel_basic_attack();
			t_fang = 0;
			direction = point_direction(x,y,mouse_x,mouse_y);
			atkTimer = 30;
			alarm[1] = atkTimer;
			canMove = false;
			canAttack = false;
			canUseSkill = false;
			isMoving = false;
			alarm[5] = 8;
		}
	}
	
	cancel_basic_attack();
	t_fang = 0;
	direction = point_direction(x,y,mouse_x,mouse_y);
	atkTimer = 30;
	alarm[1] = atkTimer;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	alarm[5] = 8;
	break;
	
	case "Swift Slicer":
	if(!instance_exists(obj_enemy)){exit;}
	s_slicer_target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	if((point_distance(mouse_x,mouse_y,s_slicer_target.x,s_slicer_target.y) <= 128) && (point_distance(x,y,s_slicer_target.x,s_slicer_target.y) <= 400)){
		cancel_basic_attack();
		use_skill_mp(useSkill,"")
		set_skill_cd(useSkill,"");
		atkTimer = 20;
		alarm[1] = atkTimer;
		canMove = false;
		canAttack = false;
		canUseSkill = false;
		isMoving = false;
		s_slicer_remaining = 5;
		alarm[7] = 20;
		applyBuff(self,120,false,"Invulnerable",buff_generic,true,-1,0,spr_empty,"",0);
		var dir = point_direction(x,y,s_slicer_target.x,s_slicer_target.y);
		dir = random_range(dir-10,dir+10);
		with(instance_create_layer(s_slicer_target.x,s_slicer_target.y,"Attacks",obj_skill_shadow_step)){
			user = other;
			target = other.s_slicer_target;
			atkmap[? "dmgmod"]		= 70;
			atkmap[? "element"]		= "none";
			sprite_index = spr_swift_slicer;
			image_xscale = min(point_distance(user.x,user.y,target.x,target.y)/64,2);
			clamp(image_xscale,0.8,2);
			image_angle = dir;
		}
		x = s_slicer_target.x + 64 * dcos(dir);
		y = s_slicer_target.y - 64 * dsin(dir);
	}
	break;
	
	case "Living Shadow":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	with(instance_create_layer(x,y,"Instances",obj_ally_shadow_clone)){
		sprite_index = other.sprite_index;
		image_blend = c_gray;
		user = other.id;
		equips = other.equips;
		ds_map_copy(basestatmap,user.basestatmap);
		ds_map_copy(statmap,basestatmap);
		statmap[? "hp"] = statmap[? "maxhp"];
		basestatmap[? "hpregen"] = 0;
		basestatmap[? "mpregen"] = 0;
		canKnockback	= true;
		atkelement = other.atkelement;
		
		// Ally HP Bar
		var minihp = instance_create_layer(x, y, "dmgTxt", obj_allyhpbar);
		minihp.hpwidth	= sprite_width;
		minihp.target	= id;
	}
	break;
	
	case "Slippery Save":
	if(instance_exists(obj_ally)){
		var ally = instance_nearest(mouse_x,mouse_y,obj_ally);
		if((point_distance(mouse_x,mouse_y,ally.x,ally.y) <= 32) && (point_distance(x,y,ally.x,ally.y) <= 360)){
			applyBuff(ally,180,true,"Invisible",buff_invisible,false,-1,0,spr_buff_move_like_wind,"Can't see this, can't touch this!",0);
			with(instance_create_layer(ally.x,ally.y,"Instances",obj_ally_shadow_dummy)){
				sprite_index = ally.sprite_index;
				image_blend = c_ltgray;
				user = ally;
				basestatmap[? "finalshld"] = 9999;
				canKnockback	= true;
				change_all_enemy_target(self);
			}
		}
		else {
			applyBuff(self,180,true,"Invisible",buff_invisible,false,-1,0,spr_buff_move_like_wind,"Can't see this, can't touch this!",0);
			with(instance_create_layer(x,y,"Instances",obj_ally_shadow_dummy)){
				sprite_index = other.sprite_index;
				image_blend = c_ltgray;
				user = other.id;
				basestatmap[? "finalshld"] = 9999;
				canKnockback	= true;
				change_all_enemy_target(self);
			}
		}			
	}
	else {
		applyBuff(self,180,true,"Invisible",buff_invisible,false,-1,0,spr_buff_move_like_wind,"Can't see this, can't touch this!",0);
		with(instance_create_layer(x,y,"Instances",obj_ally_shadow_dummy)){
			sprite_index = other.sprite_index;
			image_blend = c_ltgray;
			user = other.id;
			basestatmap[? "finalshld"] = 9999;
			canKnockback	= true;
			change_all_enemy_target(self);
		}
	}
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	highRegenThreshold = 0;
	break;

	default:
	break;
}

// use passive skills
if(cd[findArrayIndex(skills,"Vitality Thief")+1] <= 0 && canUseSkill && equips[0] > 0 && statmap[? "hp"] < statmap[? "maxhp"] && isInArray(skills,"Vitality Thief")){
	if(v_thief_count >= 5){
		apply_heal(self, 0.05, "missing_health")
		v_thief_target = noone;
		v_thief_count = 0;
		set_skill_cd("Vitality Thief","");
	}
}