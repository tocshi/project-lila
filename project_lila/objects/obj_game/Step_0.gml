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

if(global.pause){
	var x0 = camera_get_view_x(global.currentCamera);
	var y0 = camera_get_view_y(global.currentCamera);
	
	for(var i = 0; i < 5; ++i){
		//TEMPORARY SINCE CERTAIN GUI CONFIGS HAVE NOT BEEN MADE YET
		if(i > 1){continue;}
		if(mouse_x >= x0+230 + i*230 && mouse_x < x0+450 + i*230 && mouse_y >= y0+820 && mouse_check_button_pressed(mb_left)){
		
			global.gui_state = i+1;
			lastgui = i+1;
			updateGUI();
			global.holding = false;
			global.dragging = false;
		}
	}
}
