time++;
if(image_index >= 12){
	image_speed = 0;
	image_alpha -= 1/60;
}
if(!lockon){
	if(instance_exists(target)){
		image_angle = point_direction(x,y,target.x,target.y);
	}
	image_alpha += 0.01;
	if(image_index == 4){image_speed = 0;}
	if(time > 100){
		lockon = true;
		image_speed = 15;
	}
} 
else {
	if(image_index == 9){mask_index = spr_stormpiercer;}
	else{mask_index = spr_empty;}
	if(image_alpha <= 0){
		instance_destroy();
		exit;
	}
}
