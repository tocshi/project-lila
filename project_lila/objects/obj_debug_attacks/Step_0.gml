if((skill[0] >= 0) && (iter0 % 2 == 0)){
	skill[0]--;
	if(skill[0] == 0){instance_destroy();}
	image_angle += (angle/(room_speed/atkspeed));
}

if((skill[0] >= 0) && (iter0 % 2 == 1)){
	skill[0]--;
	if(skill[0] == 0){instance_destroy();}
	image_angle -= (angle/(room_speed/atkspeed));
}
