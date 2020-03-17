if(!instance_exists(obj_game)){
	instance_create_depth(0,0,399,obj_game);
}

with(instance_create_layer(room_width/2-room_width/8,room_height/2,"GUIText",obj_debug_menu_button)){
	data = ["rm_debug","START"];
	width = room_width/4;
	height = room_height/6;
}
with(instance_create_layer(room_width/2-room_width/8,room_height*0.67,"GUIText",obj_debug_menu_button)){
	data = ["rm_options","OPTIONS"];
	width = room_width/4;
	height = room_height/8;
}