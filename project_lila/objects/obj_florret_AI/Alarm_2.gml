/// @description Shoot pellet
show_debug_message(image_xscale)
var spread = MOVING_SPREAD;
if (target.x == target.xprevious && target.y == target.yprevious) {
	spread = STILL_SPREAD;	
}
if (cur_atk < num_atks) {
	with instance_create_layer(x + sprite_width/4,y - sprite_height/2, "Attacks", obj_enemy_attack_ball){
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
		direction = user.shoot_dir + irandom_range(-spread, spread);
		image_angle = direction;
		image_blend = c_purple;
		skill = atkmap[? "range"]/speed;
		image_xscale = 0.25;
		image_yscale = 0.25;
	}
	alarm[2] = 60/statmap[? "atkspeed"];	
} else {
	alarm[5] = num_atks * BURROW_TIME + BASE_BURROW_TIME;	
}
cur_atk ++;
