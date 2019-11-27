if(!instance_exists(target)){	
	exit;
}

with(instance_create_layer(x,y,"Attacks",obj_skill_triple_shot)){
	target = other.target.id;
	atkmap[? "element"] = other.atkelement;
}


if(t_shot_remaining > 0){
	alarm[3] = 7;
	t_shot_remaining--;
}
