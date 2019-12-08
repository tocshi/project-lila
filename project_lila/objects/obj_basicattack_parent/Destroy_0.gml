sprite_delete(sprite_index);
if(variable_instance_exists(self,"atkmap")){
	if(ds_exists(atkmap,ds_type_map)){	
		ds_map_destroy(atkmap);
		atkmap = -1;
	}
}
