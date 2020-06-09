/// @description Set relative layer
// You can write your code in this editor

show_debug_message("Layer is " + string(layer));
layer = layer_get_id("Game");
show_debug_message("depth is " + string(depth));

for(var i = 0; i < ds_list_size(global.skillDataDefault); ++i){
	if(ds_map_find_value(global.skillDataDefault[| i],"name") == "Aegis Aura"){
		show_debug_message("original sprmap is " + string(ds_map_find_value(global.skillDataDefault[| i],"sprmap")))
	}
}
ds_list_copy(global.skillData,global.skillDataDefault);
for(var i = 0; i < ds_list_size(global.skillData); ++i){
	if(ds_map_find_value(global.skillData[| i],"name") == "Aegis Aura"){
		show_debug_message(string(ds_map_find_value(global.skillData[| i],"sprmap")))
	}
}
for(var i = 0; i < ds_list_size(global.skillDataDefault); ++i){
	if(ds_map_find_value(global.skillDataDefault[| i],"name") == "Aegis Aura"){
		show_debug_message(string(ds_map_find_value(global.skillDataDefault[| i],"sprmap")))
	}
}