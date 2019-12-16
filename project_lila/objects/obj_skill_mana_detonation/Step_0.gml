if(time >= 0){time++;}
var roll = random_range(0,100);
if(started){
	if(image_alpha < 1){image_alpha += (120/time)/720;}
	image_xscale += (120/time)/120;
	image_yscale = image_xscale;
}
else if(roll < 10){
	with(instance_create_layer(irandom_range(x-64,x+64),irandom_range(y-64,y+64),"Assets_1",obj_channelling_power)){
		target = other.target;
		sprite_index = spr_mana_detonation;
		alpha_multiplier = 2;
	}
}
if(fading){
	image_alpha-=1/60;
	if(image_alpha <= 0){instance_destroy();}
}
