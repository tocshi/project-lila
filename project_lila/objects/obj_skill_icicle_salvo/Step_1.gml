if((point_distance(x,y,target.x,target.y) < 64 || !instance_exists(target)) && flying){
	alarm[2] = 1;
}
if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile")){
	if(!atkmap[? "isPiercing"] && collision_point(x, y, obj_wall_parent, false, true) && flying){
		alarm[2] = 1;
	}
}

