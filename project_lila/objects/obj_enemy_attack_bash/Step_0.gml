if(!instance_exists(user)){instance_destroy();}
skill--;
if(instance_exists(target)){image_angle = point_direction(x,y,target.x,target.y);}
direction = image_angle;
speed -= 0.4;
if(skill <= 0){
	instance_destroy();
}