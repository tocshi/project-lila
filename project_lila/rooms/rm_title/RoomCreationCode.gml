if(!instance_exists(obj_game)){
	instance_create_layer(0,0,"Game",obj_game);
}

with(instance_create_layer(room_width/2-room_width/8,room_height/2,"GUIText",obj_debug_menu_button)){
	switch(os_get_config()){
		case "debug":
		data = [rm_debug,"START"];
		break;
		case "demo":
		data = [global.lastRoom,"START"];
		break;
		default:
		show_error("You have not set a compilation config!",true);
	}
	width = room_width/4;
	height = room_height/6;
}
with(instance_create_layer(room_width/2-room_width/8,room_height*0.67,"GUIText",obj_debug_menu_button)){
	data = [rm_options,"OPTIONS"];
	width = room_width/4;
	height = room_height/8;
}