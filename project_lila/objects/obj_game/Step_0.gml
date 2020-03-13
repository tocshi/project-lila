if(keyboard_check_pressed(vk_enter)){
	switch(room){
		case rm_title:
		case rm_playerdeath:
			//temporary!!
			room_goto(rm_debug);
			global.pause = false;
			break;
	}
}

switch(global.cursor_state){
	case 1:
	cursor_sprite = spr_cursor_interact; break;
	default:
	cursor_sprite = spr_cursor; break;
}