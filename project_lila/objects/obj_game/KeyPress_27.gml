if(global.pause == false){
	global.pause = true;
	instance_deactivate_all(true);
	screen_save(working_directory + "temp\paused_state.png");
	paused_state = sprite_add(working_directory + "temp\paused_state.png",1,false,false,0,0);
}
else {
	global.pause = false;
	instance_activate_all();
	sprite_delete(paused_state);
}