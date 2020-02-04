skill--;
if(skill <= 0){
	instance_destroy();
	exit;
}

if(iter % 2 == 0){var damping = 1;}
else{var damping = -1;}

if(skill > duration*0.1){
	speed = dist*10*cos((1/duration)*skill)+9*dist;
	if(iter % 2 == 0){
		direction += (angle/(duration*0.9));
	}
	else {
		direction -= (angle/(duration*0.9));
	}
}
else{
	direction = point_direction(x,y,user.x,user.y)+(skill*damping);
	speed = point_distance(x,y,user.x,user.y)/3;
	if(point_distance(x,y,user.x,user.y) <= 128){skill = 0;}
}
image_angle = point_direction(user.x,user.y,x,y)-(speed*damping)/4;

if(skill < duration*0.52 && skill > duration*0.46){mask_index = orig_sprite;}
else{mask_index = spr_empty;}

if(instance_position(x,y,obj_wall_parent)){skill = duration*0.1;}

