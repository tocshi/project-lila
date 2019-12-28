event_inherited();

if(path_get_length(ai_path) < aggro_range && point_distance(x,y,obj_player.x,obj_player.y) >= 64 && canMove || collision_line(x,y,global.player.x,global.player.y,obj_wall_parent,true,true)) {
	// show_debug_message("Player within range");
	mp_potential_step(obj_player.x, obj_player.y, statmap[? "movespeed"], false);
}

if(x == xprevious && y == yprevious){standing_still++;}
else{standing_still = 0;}

if(point_distance(x,y,global.player.x,global.player.y) < 120 && statmap[? "mp"] >= 30 && standing_still >= 5){
	statmap[? "mp"] -= 30;

	isMoving = false;
	canMove = false;
	canUseSkill = false;
	atkTimer = 30;
	speed = 0;
	highRegenThreshold = 0;
	with instance_create_layer(x,y,"Attacks",obj_enemy_attack_bash){
		user = other;
		ds_map_copy(atkmap,user.statmap);
		speed = 5;
		atkmap[? "dmgmod"] = 150;
		atkmap[? "element"] = "none";
	}
}

recalc_countdown++;
if (recalc_countdown % 30 == 0) {
	getPath(id, obj_player, ai_path);
}
