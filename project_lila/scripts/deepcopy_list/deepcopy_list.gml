/// @description ACTUAL deep copy of nested lists/maps

var list_orig = argument0;
var list_copy = ds_list_create();


for(var i = 0; i < ds_list_size(list_orig); ++i){
	if (!is_string(list_orig[| i])) {
		if(ds_exists(list_orig[| i], ds_type_map)) { // NOTE: list_orig variable is just an integer that represents the index. May not work as intended.
			var map = deepcopy_map(list_orig[| i]);
			ds_list_add(list_copy,map);
		} 
		else if(ds_exists(list_orig[| i], ds_type_list)) {
			var list = deepcopy_list(list_orig[| i]);
			ds_list_add(list_copy,list);
		} else {
			ds_list_add(list_copy, list_orig[| i]);
		}
	} else {
		ds_list_add(list_copy, list_orig[| i]);
	}
}
return list_copy;