if(skill >= 0){	
	if(collided && skill < 60){
		image_alpha -= 1/60;
	}
	skill--;
	
} else {
	instance_destroy();
	ds_map_destroy(atkmap);
	atkmap = -1;
	exit;
}
