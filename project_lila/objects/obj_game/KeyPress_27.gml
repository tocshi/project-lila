if(global.player == 0){exit;}

if(global.pause == false){
	cursor_sprite = -1;
	alarm[0] = 1;
}
else {
	global.pause = false;
	instance_activate_all();
	sprite_delete(paused_state);
}