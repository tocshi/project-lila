if(keyboard_check_pressed(vk_enter)){
	switch(room){
		case rm_title:
		case rm_playerdeath:
			//temporary!!
			room_goto(rm_debug);
			break;
	
	}
}