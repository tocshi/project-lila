if(fading){
	image_alpha-=0.02;
	if(image_alpha <= 0){instance_destroy();}
}
if(!instance_exists(target)){exit;}
if(flying){
	speed+=0.1;
	if(abs(direction-point_direction(x,y,target.x,target.y)) > 10){
		direction+=0.05*time;
	}
	else{
		direction = point_direction(x,y,target.x,target.y);	
	}
	image_angle = direction;
}
else if(!fading){
	image_alpha+=1/30;
}
if(time%15 == 0){
	with(instance_create_layer(irandom_range(x-sprite_width/4,x+sprite_width/4),irandom_range(y-sprite_height/4,y+sprite_height/4),"Assets_1",obj_chill_effect)){
		
	}
}
time++;

