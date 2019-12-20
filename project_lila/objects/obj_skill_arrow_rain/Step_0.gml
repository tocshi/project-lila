if(skill >= 0){
	if((skill % 60) == 1){
	ds_list_clear(hitList);
	image_alpha = 0.6;
	}
	skill--;
	if(image_alpha > 0){
		image_alpha -= 0.01;
	}
	if(skill == 0){
		instance_destroy();
		exit;
		}
}

