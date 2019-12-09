if(global.player == 0
	|| room == rm_playerdeath
	|| room == rm_title
){exit;}

if(global.pause == false){
	cursor_sprite = -1;
	alarm[0] = 1;
	global.holding = false;
	global.dragging = false;
}
else {
	global.pause = false;
	global.holding = false;
	global.dragging = false;
	instance_activate_all();
	sprite_delete(paused_state);
}