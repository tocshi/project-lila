event_inherited();

if(path_get_length(ai_path) < aggro_range && point_distance(x,y,obj_player.x,obj_player.y) >= 500 && canMove) {
	// show_debug_message("Player within range");
	mp_potential_step(obj_player.x, obj_player.y, statmap[? "movespeed"], false);
}

if(x == xprevious && y == yprevious){standing_still++;}
else{standing_still = 0;}

if(statmap[? "mp"] >= 30 && standing_still >= 30){
	statmap[? "mp"] -= 30;

	isMoving = false;
	canMove = false;
	canUseSkill = false;
	atkTimer = 30;
	speed = 0;
	highRegenThreshold = 0;
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
	
		speed = 8;
		image_blend = c_purple;
		direction = point_direction(x,y,global.player.x,global.player.y);
		image_angle = direction;
		skill = atkmap[? "range"]/speed;
	}
}

recalc_countdown++;
if (recalc_countdown % 30 == 0) {
	getPath(id, obj_player, ai_path);
}
