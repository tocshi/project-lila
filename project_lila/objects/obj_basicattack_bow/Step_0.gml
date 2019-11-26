x = anchor.x;
y = anchor.y;
skill--;
if(skill == 0){
	ds_map_destroy(atkmap);
	instance_destroy();
	sprite_delete(sprite_index);
	exit;
}

