if(skill >= 0){
	if((skill % 30) == 1){
	ds_list_clear(hitList);
	}
	skill--;
	image_alpha-=1/120;
	if(skill == 0){
		instance_destroy();
		exit;
		}
}

