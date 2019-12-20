if(flying){
	image_alpha+=1/30;
	image_xscale-=6/30;
	image_yscale=image_xscale;
}
if(image_alpha >= 1){
	flying = false;
	if((skill % reset) == 0){
		ds_list_clear(hitList);
	}
	skill--;
	
	if(skill <= 0){
		instance_destroy();
		exit;
	}
}

