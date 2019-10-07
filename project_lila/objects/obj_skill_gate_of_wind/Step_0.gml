if(!active){
	image_alpha += 0.02;
	image_yscale += 4/30;
	image_xscale += 1/30;
}


if((skill > 0) && active){
	skill--;
	if(skill <= 0){
		instance_destroy();
		ds_map_destroy(atkmap);
		exit;
	}
}

