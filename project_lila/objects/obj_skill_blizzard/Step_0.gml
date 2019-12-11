x = user.x;
y = user.y;

if(skill >= 0){
	if((skill % 30) == 1){
	ds_list_clear(hitList);
	image_alpha = 0.4;
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

