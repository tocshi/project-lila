x = anchor.x;
y = anchor.y;
if((skill >= 0) && (iter % 2 == 0)){
	skill--;
	if(skill == 0){
		ds_map_destroy(atkmap);
		instance_destroy();
		sprite_delete(sprite_index);
		exit;
		}
	image_angle += (angle/(room_speed/atkmap[? "atkspeed"]));
}

if((skill >= 0) && (iter % 2 == 1)){
	skill--;
	if(skill == 0){
		ds_map_destroy(atkmap);
		instance_destroy();
		sprite_delete(sprite_index);
		exit;
		}
	image_angle -= (angle/(room_speed/atkmap[? "atkspeed"]));
}

