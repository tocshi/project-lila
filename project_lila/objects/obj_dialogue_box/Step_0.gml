if(global.pause != true){
	global.pause = true;
}

// when interact button is pressed
if(keyboard_check_pressed(global.key_interact) || mouse_check_button_pressed(mb_left)){
	if(page = array_length_1d(text)-1){
		instance_destroy();
		exit;
	}
	page++;
}
