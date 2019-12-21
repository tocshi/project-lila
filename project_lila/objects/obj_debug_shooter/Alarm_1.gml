if(canAttack){
	with instance_create_layer(x,y,"Attacks",obj_enemy_attack_ball){
		user = other;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "dmgmod"]			= 100;

		atkmap[? "element"]			= "none";
		atkmap[? "range"]			= 512;

		atkmap[? "isProjectile"]	= true;
		atkmap[? "isPiercing"]		= false;
		atkmap[? "isSingleTarget"]	= true;
		atkmap[? "isSingleHit"]		= true;
	
		speed = 5;
		direction = user.direction;
		image_angle = direction;
		image_blend = c_purple;
		skill = atkmap[? "range"]/speed;
	}
}
alarm[1] = room_speed*2;