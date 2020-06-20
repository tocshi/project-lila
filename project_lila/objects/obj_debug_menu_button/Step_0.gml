// interact behaviour
if(mouse_check_button_released(global.mouse_interact) || keyboard_check_pressed(global.key_interact)){
	if(mouse_x >= x && mouse_x <= x+width && mouse_y >= y && mouse_y <= y+height){
		if(data[0] == ""){show_error("button data does not exist", true);}
		switch(type){
			case 0:
				room_goto(data[0]);
				break;
			case 1:
				state = 1;
				keyboard_string = "";
				break;
			default: show_error("unknown button type specified",true);
		}
	}
	else{
		switch(type){
			case 0:
				break;
			case 1:
				state = 0;
				break;
			default: show_error("unknown button type specified",true);
		}
	}
}