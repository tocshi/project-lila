if(!instance_exists(target)){	
	exit;
}

with(instance_create_layer(x,y,"Attacks",obj_skill_triple_shot)){
	ds_map_copy(atkmap,other.statmap);
	user = other.id;
	target = other.target.id;
	atkmap[? "element"] = other.atkelement;
	atkmap[? "dmgmod"]			= 80;
	atkmap[? "isProjectile"]	= true;
	atkmap[? "isPiercing"]		= false;
	atkmap[? "isSingleTarget"]	= true;
}


if(t_shot_remaining > 0){
	alarm[3] = 7;
	t_shot_remaining--;
}
