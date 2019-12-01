if(other.atkmap[? "isProjectile"] == true){
	ds_map_destroy(other.atkmap);
	other.atkmap = -1;
	instance_destroy(other);
	user.statmap[? "mp"] += 0.1*(user.statmap[? "maxmp"]-user.statmap[? "mp"]);
}

