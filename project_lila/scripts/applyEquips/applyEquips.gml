var target = argument0;

if(!target.equipApplied){
	for(var i = 0; i < array_length_1d(target.equips); i++){
		for(var j = 0; j < ds_list_size(global.equipStats); j++){
			if(!is_undefined(ds_map_find_value(global.itemData[| target.equips[i]], global.equipStats[| j]))){
				ds_map_set(target.basestatmap, global.equipStats[| j], 
				ds_map_find_value(target.basestatmap, global.equipStats[| j]) + 
				ds_map_find_value(global.itemData[| target.equips[i]], global.equipStats[| j]));
			}
		}
	}
}