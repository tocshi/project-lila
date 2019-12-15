if(flying && !fading){
	speed+=0.1;
	direction = point_direction(x,y,target.x,target.y);
	image_angle = direction;
}
if(time%15 == 0){
	with(instance_create_layer(irandom_range(x-sprite_width/4,x+sprite_width/4),irandom_range(y-sprite_height/4,y+sprite_height/4),"Assets_1",obj_chill_effect)){
		
	}
}
time++;
if(fading){
	image_alpha-=0.02;
	if(image_alpha <= 0){instance_destroy();}
}
