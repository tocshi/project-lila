/// @description Set relative layer
// You can write your code in this editor

show_debug_message("Layer is " + string(layer));
layer = layer_get_id("Game");
show_debug_message("depth is " + string(depth));

// Reset sprmap values upon room change
for(var i = 0; i < ds_list_size(global.skillData); ++i) {
	var curr_map = global.skillData[| i];
	curr_map[? "sprmap"]	= curr_map[? "sprmap0"];
}