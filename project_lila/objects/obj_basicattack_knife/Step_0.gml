skill--;
if(instance_exists(user)){
	x += user.x - user.xprevious;
	y += user.y - user.yprevious;
}
if(skill == 0){
	alarm[1] = 120;
	speed = 0;
	image_alpha = 0;
	mask_index = spr_empty;
}
