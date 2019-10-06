if((skill[0] >= 0) && (iter0 % 2 == 0)){
	skill[0]--;
	if(skill[0] == 0){
		ds_map_destroy(atkmap);
		instance_destroy();
		exit;
		}
	image_angle += (angle/(room_speed/atkmap[? "atkspeed"]));
}

if((skill[0] >= 0) && (iter0 % 2 == 1)){
	skill[0]--;
	if(skill[0] == 0){
		ds_map_destroy(atkmap);
		instance_destroy();
		exit;
		}
	image_angle -= (angle/(room_speed/atkmap[? "atkspeed"]));
}


if(skill[6] >= 0){
	if((skill[6] % 60) == 1){
	ds_list_clear(hitList);
	image_alpha = 0.6;
	}
	skill[6]--;
	if(image_alpha > 0){
		image_alpha -= 0.01;
	}
	if(skill[6] == 0){
		instance_destroy();
		ds_map_destroy(atkmap);
		exit;
		}
}

