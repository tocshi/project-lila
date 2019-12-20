if(other.atkmap[? "isProjectile"] == true){
	instance_destroy(other);
	user.statmap[? "mp"] += 0.1*(user.statmap[? "maxmp"]-user.statmap[? "mp"]);
}

