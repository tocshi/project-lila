if(instance_exists(user)){
	x += user.x - user.xprevious;
	y += user.y - user.yprevious;
}
skill--;
if(skill <= 0){
	instance_destroy();
}