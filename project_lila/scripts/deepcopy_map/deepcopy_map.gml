/// @description ACTUAL deep copy of nested lists/maps

var map_orig = argument0;
var map_copy = ds_map_create();

var map_size = ds_map_size(map_orig) ;
var curr_key = ds_map_find_first(map_orig);
for (var i = 0; i < map_size; i++;) {
	if(!is_string(map_orig[? curr_key])) {
		if(ds_exists(map_orig[? curr_key], ds_type_map)) {
			var map = deepcopy_map(map_orig[? curr_key]);
			ds_map_add(map_copy,curr_key,map);
		} 
		else if(ds_exists(map_orig[? curr_key], ds_type_list)) {
			var list = deepcopy_list(map_orig[? curr_key]);
			ds_map_add(map_copy,curr_key,list);
		} else {
			ds_map_add(map_copy,curr_key,map_orig[? curr_key]);
		}
	} else {
		ds_map_add(map_copy,curr_key,map_orig[? curr_key]);
	}
	curr_key = ds_map_find_next(map_orig, curr_key);
}

return map_copy;