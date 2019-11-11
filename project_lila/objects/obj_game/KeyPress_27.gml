if(global.player == 0
	|| room == rm_playerdeath
	|| room == rm_title
){exit;}

if(global.pause == false){
	cursor_sprite = -1;
	alarm[0] = 1;
}
else {
	global.pause = false;
	instance_activate_all();
	sprite_delete(paused_state);
}