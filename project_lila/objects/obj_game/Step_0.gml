if(keyboard_check_pressed(vk_enter)){
	switch(room){
		case rm_title:
		case rm_playerdeath:
			//temporary!!
			room_goto(rm_demo);
			global.pause = false;
			break;
	}
}

// DEBUG CLASS CHANGE
if(!global.pause){
	if(keyboard_check_pressed(vk_f1)){
		change_class(global.player,"Knight");
	}
	if(keyboard_check_pressed(vk_f2)){
		change_class(global.player,"Archer");
	}
	if(keyboard_check_pressed(vk_f3)){
		change_class(global.player,"Mage");
	}
}
