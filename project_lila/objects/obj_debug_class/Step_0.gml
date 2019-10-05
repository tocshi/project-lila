event_inherited();

if(mouse_check_button_pressed(mb_left) && (cd[0] <= 0)){
	
	speed = 0;
	isMoving = false;
	canMove = false;
	cd[0] = room_speed/atkspeed;
	
	var basic_attack = instance_create_layer(x,y-32,"Attacks",obj_debug_attacks);
	basic_attack.skill_index = 0;
	basic_attack.atkspeed = self.atkspeed;
	iter0++;
	basic_attack.iter0 = self.iter0;
	
	//I am not doing this correctly
	basic_attack.atk			= atk;
	basic_attack.dmgmod			= 100;
	if(empowered_buff){
		basic_attack.dmgmod		= 250;
		removeBuff("Empowered");
	}
	basic_attack.element		= "none";
	basic_attack.atkspeed		= atkspeed;
	basic_attack.fire_atk		= fire_atk;
	basic_attack.ice_atk		= ice_atk;
	basic_attack.lightning_atk	= lightning_atk;
	basic_attack.earth_atk		= earth_atk;
	basic_attack.wind_atk		= wind_atk;
	basic_attack.light_atk		= light_atk;
	basic_attack.dark_atk		= dark_atk;
	basic_attack.critrate		= critrate;
	basic_attack.critdmg		= critdmg;
	basic_attack.finaldmg		= finaldmg;
	
	basic_attack.sourceX		= x;
	basic_attack.sourceY		= y;
	basic_attack.flinch_amount	= 4;
	
	basic_attack.isBasicAttack	= true;
	basic_attack.isSingleHit	= true;

}

if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && mp >= 20){
	
	mp -= 20;
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	cd[1] = room_speed*5;
	
	var skillobj = instance_create_layer(x,y-32,"Attacks",obj_debug_attacks);
	skillobj.atkspeed = atkspeed;
	skillobj.skill_index = 1;
	skillobj.isBuff	= true;
	
	var buff_array = array_create(5,false);
	buff_array[0] = 3*room_speed;
	buff_array[1] = true;
	buff_array[2] = "Empowered";
	buff_array[3] = buff_empowered;
	ds_list_add(buff,buff_array);
	movespeed *=2;
	empowered_buff = true;

}

if(keyboard_check_pressed(skill_button[6]) && (cd[6] <= 0) && mp >= 35){
	
	mp -= 35;
	speed = 0;
	isMoving = false;
	cd[6] = room_speed*12;
	
	var skillobj = instance_create_layer(mouse_x,mouse_y,"Attacks",obj_debug_attacks);
	skillobj.skill_index = 6;
	
	//I am not doing this correctly
	skillobj.atk			= atk;
	skillobj.dmgmod			= 60;

	skillobj.element		= "none";
	skillobj.atkspeed		= atkspeed;
	skillobj.fire_atk		= fire_atk;
	skillobj.ice_atk		= ice_atk;
	skillobj.lightning_atk	= lightning_atk;
	skillobj.earth_atk		= earth_atk;
	skillobj.wind_atk		= wind_atk;
	skillobj.light_atk		= light_atk;
	skillobj.dark_atk		= dark_atk;
	skillobj.critrate		= critrate;
	skillobj.critdmg		= critdmg;
	skillobj.finaldmg		= finaldmg;
	
	skillobj.sourceX		= mouse_x;
	skillobj.sourceY		= mouse_y;
	//skillobj.flinch_amount	= 4;

}

