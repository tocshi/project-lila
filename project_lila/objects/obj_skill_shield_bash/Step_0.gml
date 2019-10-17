skill--;
speed -= 0.4;
if(skill <= 0){
	instance_destroy();
	ds_map_destroy(atkmap);
}