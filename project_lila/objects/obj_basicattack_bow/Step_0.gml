if(instance_exists(anchor)){
	x = anchor.x;
	y = anchor.y;
}
skill--;
if(skill == 0){
	instance_destroy();
	exit;
}

