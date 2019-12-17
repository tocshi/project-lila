/// @Description input text/execute line
if (keyboard_check_pressed(vk_enter)) {
	switch (keyboard_string) {
		default: ds_list_add(lines, text + " is not a valid command");	
	}
	if (ds_list_size(lines) > 20) {
		ds_list_delete(lines, 0);
	}
	keyboard_string = "";
	caret = 0;
	exit;
}

if (keyboard_check_pressed(vk_left)) {
	 caret++;
	 if (caret > string_length(keyboard_string) ){
		 caret = string_length(keyboard_string);
	 }
}

if (keyboard_check_pressed(vk_right)) {
	 caret--;
	 if (caret < 0) {
		 caret = 0;
	 }
}
