var attack = instance_nearest(x,y,obj_basicattack_parent);
if(attack = noone){exit;}
if(attack.user = self){
	if(variable_instance_exists(attack,"atkmap")){
		ds_map_destroy(attack.atkmap);
		attack.atkmap = -1;
	}
	instance_destroy(attack);
}