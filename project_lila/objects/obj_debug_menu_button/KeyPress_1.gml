switch(type){
	case 0:
		break;
	case 1:
		// leave room if set
		if(keyboard_key == vk_escape){
			var empty = false;
			for(var i = 0; i < array_length_1d(global.options_keys); ++i){
				if(array_get(variable_global_get(global.options_keys[i]), global.movement_mode) == 0){
					empty = true;
				}
			}
			if(empty){
				show_error("Cannot leave keybind empty!",false);
			}
			else{
				room_goto(rm_title);
				exit;
			}
		}
		// set key if valid key pressed
		if(state == 1){
			var global_option_key = variable_global_get(global.options_keys[i])
			for(var i = 0; i < array_length_1d(global.options_keys); ++i){
				if(array_get(global_option_key, global.movement_mode) == keyboard_key){
					array_set(global_option_key, global.movement_mode, 0)
				}
			}
			array_set(global_option_key, global.movement_mode, keyboard_key);
			state = 0;
		}
		break;
	default: show_error("unknown button type specified",true);
}
