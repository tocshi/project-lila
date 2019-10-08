if((skill >= 0) && (iter0 % 2 == 0)){
	skill--;
	if(skill == 0){
		ds_map_destroy(atkmap);
		instance_destroy();
		exit;
		}
	image_angle += (angle/(room_speed/atkmap[? "atkspeed"]));
}

if((skill >= 0) && (iter0 % 2 == 1)){
	skill--;
	if(skill == 0){
		ds_map_destroy(atkmap);
		instance_destroy();
		exit;
		}
	image_angle -= (angle/(room_speed/atkmap[? "atkspeed"]));
}

