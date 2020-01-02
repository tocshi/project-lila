if(sprite_index == spr_empty){show_error("Rogue Trap has no sprite!",false);}
skill--;
if(skill > room_speed*30){
	image_xscale+=1/60;
	image_yscale+=1/60;
	image_alpha+=1/100;
}
if(triggered){
	image_xscale+=1/10;
	image_yscale+=1/10;
	image_alpha-=1/20;
}
if(skill <= 0){
	instance_destroy();
}

