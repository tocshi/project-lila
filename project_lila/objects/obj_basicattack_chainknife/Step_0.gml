skill--;
if(skill <= 0){
	instance_destroy();
	exit;
}

///

if(skill < duration*0.8 && skill > duration*0.2){mask_index = orig_sprite;}
else{mask_index = spr_empty;}

if(instance_position(x,y,obj_wall_parent)){skill = duration*0.1;}

