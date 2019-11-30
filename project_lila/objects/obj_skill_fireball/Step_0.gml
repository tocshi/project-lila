if(skill >= 0){	
	
	skill--;
	
} else {
	instance_destroy();
	ds_map_destroy(atkmap);
	atkmap = -1;
	exit;
}
