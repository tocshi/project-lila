if(forming){
	image_alpha+=0.12;
	speed-=1;
}
else if(fading){
	image_alpha-=1/25;
}
if(image_alpha >= 1){mask_index = sprite_index;}
else{mask_index = spr_empty;}
if(image_alpha < 0){
	instance_destroy();
}

