for(var i = 0; i < array_length_1d(global.options_keys); ++i){
	with(instance_create_layer(room_width*(3/8),room_height/8 + ((i*room_height)/30),"GUIText",obj_debug_menu_button)){
		type = 1;
		data = array_create(1,global.options_keys[i]);
		text_font = fnt_gui_small;
		width = room_width/4;
		height = room_height/30;
	}
}

