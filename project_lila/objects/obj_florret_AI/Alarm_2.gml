/// @description Shoot pellet
if (cur_atk < num_atks) {
	with instance_create_layer(x,y,"Attacks",obj_enemy_attack_ball){
		user = other;
		ds_map_copy(atkmap, user.statmap);
		atkmap[? "dmgmod"]			= 100;

		atkmap[? "element"]			= "none";
		atkmap[? "range"]			= 512;

		atkmap[? "isProjectile"]	= true;
		atkmap[? "isPiercing"]		= false;
		atkmap[? "isSingleTarget"]	= true;
		atkmap[? "isSingleHit"]		= true;
	
		speed = 5;
		direction = user.shoot_dir + irandom_range(-10, 10);
		image_angle = direction;
		image_blend = c_purple;
		skill = atkmap[? "range"]/speed;
	}
	alarm[2] = BETWEEN_PELLET_TIME;	
} else {
	show_debug_message("start move");
	alarm[1] = num_atks * BURROW_TIME;	
}
cur_atk ++;
