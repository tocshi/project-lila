if(collided){exit;}
if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile")){
	if(!atkmap[? "isPiercing"] && collision_point(x, y, obj_wall_parent, true, true)){
		mask_index = spr_empty;
		speed = 0;
		skill += 3*room_speed;
		collided = true;
	}
}
