if(skill0 >= 0){
	skill0--;
	if(skill0 == 0){instance_destroy();}
	image_angle -= (angle/(room_speed/atkspeed));
}