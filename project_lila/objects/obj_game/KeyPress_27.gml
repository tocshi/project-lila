if(global.player == noone
	|| room == rm_playerdeath
	|| room == rm_title
){exit;}

if(global.pause == false){
	global.gui_state = 0;
	cursor_sprite = -1;
	alarm[0] = 1;
	global.holding = false;
	global.dragging = false;
	camera_set_view_target(global.currentCamera,noone);
	updateGUI();
}
else {
	global.gui_state = -1;
	global.pause = false;
	global.holding = false;
	global.dragging = false;
	instance_activate_all();
	camera_set_view_target(global.currentCamera,global.player);
	sprite_delete(paused_state);
}