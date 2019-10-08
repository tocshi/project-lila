event_inherited();

if(!instance_exists(target)){	
	instance_destroy();
	ds_map_destroy(atkmap);
	exit;
} else {
	direction = point_direction(x,y,target.x,target.y);
	image_angle = direction;
	image_alpha = 1;
}


