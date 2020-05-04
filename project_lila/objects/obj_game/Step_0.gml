if(keyboard_check_pressed(vk_enter)){
	switch(room){
		case rm_playerdeath:
			//temporary!!
			room_goto(rm_title);
			global.pause = false;
			global.gui_state = -1;
			break;
	}
}

switch(global.cursor_state){
	case 1:
	cursor_sprite = spr_cursor_interact; break;
	default:
	cursor_sprite = spr_cursor; break;
}