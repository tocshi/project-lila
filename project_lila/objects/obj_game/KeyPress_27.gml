if(global.player == noone
	|| room == rm_playerdeath
	|| room == rm_title
){exit;}

if (console != "null" && instance_exists(console)) {
	instance_deactivate_object(console);
}

if(global.pause == false){
	global.gui_state = 0;
	cursor_sprite = -1;
	alarm[0] = 1;
	global.holding = false;
	global.dragging = false;
	camera_set_view_target(global.currentCamera,noone);
}
else {
	global.gui_state = -1;
	global.pause = false;
	global.holding = false;
	global.dragging = false;
	instance_activate_all();
	camera_set_view_target(global.currentCamera,global.player);
	instance_deactivate_object(console);
	if (console != "null") {
		instance_deactivate_object(console);
	}
}

