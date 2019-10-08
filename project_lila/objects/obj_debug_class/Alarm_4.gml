if(!instance_exists(target)){	
	exit;
}

var skillobj = instance_create_layer(x,y,"Attacks",obj_skill_triple_shot);
skillobj.target = target.id;

if(t_shot_remaining > 0){
	alarm[4] = 7;
	t_shot_remaining--;
}
