event_inherited();

if(!instance_exists(target)){target = global.player;}

if(path_get_length(ai_path) < aggro_range && point_distance(x,y,target.x,target.y) >= 64 && canMove || collision_line(x,y,target.x,target.y,obj_wall_parent,true,true)) {
	// show_debug_message("Player within range");
	mp_potential_step(target.x, target.y, statmap[? "movespeed"], false);
}

if(point_distance(x,y,target.x,target.y) < 80){standing_still++;}
else{standing_still = 0;}

if(point_distance(x,y,target.x,target.y) < 120 && statmap[? "mp"] >= 30 && standing_still >= 30){
	statmap[? "mp"] -= 30;

	isMoving = false;
	canMove = false;
	canUseSkill = false;
	atkTimer = 30;
	speed = 0;
	highRegenThreshold = 0;
	with instance_create_layer(x,y,"Attacks",obj_enemy_attack_bash){
		user = other;
		target = other.target;
		ds_map_copy(atkmap,user.statmap);
		speed = 5;
		atkmap[? "dmgmod"] = 150;
		atkmap[? "element"] = "none";
		image_angle = point_direction(x,y,target.x,target.y);
		direction = image_angle;
	}
}

recalc_countdown++;
if (recalc_countdown % 30 == 0) {
	getPath(id, target, ai_path);
}
