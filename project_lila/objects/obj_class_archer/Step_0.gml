event_inherited();
if(global.pause){exit;}

// Use Skill
switch(useSkill){
	case "Spread Shot":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
	
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
	atkTimer = 10;
	
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isMoving = false;
	alarm[1] = 10;
	break;
	
	case "Move Like Wind":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	
	//clear_debuffs(self.id,"slow");
	applyBuff(self.id,3*room_speed,true,"Move Like Wind",buff_generic,false,-1,0,spr_buff_move_like_wind,"Lorem Ipsum",0);

	statChange = true;
	break;
	
	case "Triple Shot":
	target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	var atkrange = ds_map_find_value(global.itemData[| equips[0]],"atkrange");
	if(target == noone || point_distance(x,y,target.x,target.y) > atkrange){exit;}
	else if(point_distance(mouse_x,mouse_y,target.x,target.y) >= 64){exit;}
	
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
	atkTimer = 21;
	canAttack = false;
	canUseSkill = false;
	t_shot_remaining = 2;
	alarm[3] = 1;
	break;
	
	case "Mantle of Titania":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
	atkTimer = 48;
	canAttack = false;
	canUseSkill = false;
	with(instance_create_layer(x,y,"Attacks",obj_skill_mantle_of_titania)){
		user = other.id;
		ds_map_copy(atkmap,other.statmap);
		atkmap[? "dmgmod"]		= 15;
		atkmap[? "element"]		= "wind";
	}	
	break;
	
	case "Gate of Wind":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	isMoving = false;
	highRegenThreshold = 0;
	instance_create_layer(mouse_x,mouse_y,"Attacks",obj_skill_gate_of_wind);
	break;
	
	case "Arrow Rain":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
	isMoving = false;
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	atkTimer = 30;
	alarm[1] = 30;
	highRegenThreshold = 0;
	
	with(instance_create_layer(mouse_x,mouse_y,"Attacks",obj_skill_arrow_rain)){
		user = other.id;
		ds_map_copy(atkmap,other.statmap);
		atkmap[? "dmgmod"]		= 60;
		atkmap[? "element"]		= other.atkelement;
	}	
	break;
	
	case "Fae Blessing":
	if(instance_exists(obj_ally)){
		var bless_target = instance_nearest(mouse_x,mouse_y,obj_ally);

		if((point_distance(mouse_x,mouse_y,bless_target.x,bless_target.y) <= 128) && (point_distance(x,y,bless_target.x,bless_target.y) <= 450)){
			use_skill_mp(useSkill,"")
			set_skill_cd(useSkill,(get_skill_data(useSkill,"cd")*room_speed)/2);
			applyBuff(bless_target,10*room_speed,true,"Fae Blessing",buff_generic,false,-1,0,spr_buff_TODO,"Lorem Ipsum",0);
		}
		else{exit;}
	}
	break;
	
	case "Tornado Shot":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	cancel_basic_attack();
	atkTimer = 30;
	canAttack = false;
	alarm[1] = 30;
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
	break;

	default:
	break;
}

// Use Passive Skills
if(useSkill != "" && isInArray(skills,"Unyielding Arrows")){
	applyBuff(self,180,true,"Unyielding Arrows",buff_generic,false,1,10,spr_buff_unyielding,"Grants 2% crit chance per stack.",0);
}
if(isInArray(skills,"Fae Blessing") && cd[findArrayIndex(skills,"Fae Blessing")+1] <= 0 && equips[0] > 0 && statmap[? "hp"] < statmap[? "maxhp"]*0.3){
	set_skill_cd("Fae Blessing","");
	applyBuff(self,10*room_speed,true,"Fae Blessing",buff_generic,false,-1,0,spr_buff_TODO,"Lorem Ipsum",0);
}

