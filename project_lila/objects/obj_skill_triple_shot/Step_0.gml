if(collision_point(x, y, target, false, true)){
	dmgCalc(target.id);
	ds_map_destroy(atkmap);
	instance_destroy();
	exit;
}


