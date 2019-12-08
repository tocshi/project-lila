if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile")){
	if(!atkmap[? "isPiercing"] && collision_point(x, y, obj_wall_parent, false, true)){
		ds_map_destroy(atkmap);
		atkmap = -1;
		instance_destroy();
	}
}