if(fading){
	image_alpha-=0.01;
	if(image_alpha <= 0){instance_destroy();}
}
else{
	x = user.x;
	y = user.y;
	time++;
}
if(time%3==0 && !fading){
	with(instance_create_layer(irandom_range(x-64,x+64),irandom_range(y-64,y+64),"Assets_1",obj_channelling_power)){
		target = other.user;
		image_blend = c_aqua;
	}
}

