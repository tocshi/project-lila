event_inherited();

if(mouse_check_button_pressed(mb_left) && (cd[0] <= 0)){
	
	speed = 0;
	isMoving = false;
	canMove = false;
	cd[0] = room_speed/statmap[? "atkspeed"];
	
	var basic_attack = instance_create_layer(x,y-32,"Attacks",obj_basicattack_longsword);
	iter0++;
	basic_attack.iter0 = self.iter0;
	
	ds_map_copy(basic_attack.atkmap,statmap);
	basic_attack.atkmap[? "dmgmod"]			= 100;
	if(empowered_buff){
		basic_attack.atkmap[? "dmgmod"]		= 250;
		removeBuff("Empowered");
	}
	basic_attack.atkmap[? "element"]		= "none";
	
	basic_attack.atkmap[? "sourceX"]		= x;
	basic_attack.atkmap[? "sourceY"]		= y;
	basic_attack.atkmap[? "flinch_amount"]	= 4;
	
	basic_attack.atkmap[? "isBasicAttack"]	= true;
	basic_attack.atkmap[? "isSingleHit"]	= true;

}

if(keyboard_check_pressed(skill_button[1]) && (cd[1] <= 0) && statmap[? "mp"] >= 20){
	
	statmap[? "mp"] -= 20;
	var effect = instance_create_layer(x,y,"Instances",obj_debug_indicator);
	effect.vspeed = -1;
	cd[1] = room_speed*5;
	
	var skillobj = instance_create_layer(x,y-32,"Attacks",obj_skill_empowered_strike);
	skillobj.atkmap[? "isBuff"] = true;
	
	var buff_array = array_create(5,false);
	buff_array[0] = 3*room_speed;
	buff_array[1] = true;
	buff_array[2] = "Empowered";
	buff_array[3] = buff_empowered;
	ds_list_add(buff,buff_array);
	statmap[? "movespeed"] *=2;
	empowered_buff = true;

}

if(keyboard_check_pressed(skill_button[6]) && (cd[6] <= 0) && statmap[? "mp"] >= 35){
	
	statmap[? "mp"] -= 35;
	speed = 0;
	isMoving = false;
	cd[6] = room_speed*12;
	
	var skillobj = instance_create_layer(mouse_x,mouse_y,"Attacks",obj_skill_arrow_rain);
	skillobj.skill_index = 6;
	
	ds_map_copy(skillobj.atkmap,statmap);
	skillobj.atkmap[? "dmgmod"]			= 60;
	skillobj.atkmap[? "element"]		= "none";
	
	skillobj.atkmap[? "sourceX"]		= mouse_x;
	skillobj.atkmap[? "sourceY"]		= mouse_y;
}

