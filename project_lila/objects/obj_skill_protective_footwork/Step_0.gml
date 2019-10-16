x = user.x;
y = user.y;
if(user.footwork_charge <= 0 || user.speed == 0){
	instance_destroy();
	ds_map_destroy(atkmap);
	}