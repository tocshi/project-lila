/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < array_length_1d(global.options_keys); ++i){
	if(array_get(variable_global_get(global.options_keys[i]), global.movement_mode) == 0){
		show_error("Cannot leave keybind empty!",false);
	}
}
