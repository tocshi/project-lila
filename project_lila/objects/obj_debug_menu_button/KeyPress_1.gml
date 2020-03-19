switch(type){
	case 0:
		break;
	case 1:
		// leave room if set
		if(keyboard_key == vk_escape){
			var empty = false;
			for(var i = 0; i < array_length_1d(global.options_keys); ++i){
				if(variable_global_get(global.options_keys[i]) == 0){
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
			for(var i = 0; i < array_length_1d(global.options_keys); ++i){
				if(variable_global_get(global.options_keys[i]) == keyboard_key){
					variable_global_set(global.options_keys[i],0);
				}
			}
			variable_global_set(data[0],keyboard_key);
			state = 0;
		}
		break;
	default: show_error("unknown button type specified",true);
}
