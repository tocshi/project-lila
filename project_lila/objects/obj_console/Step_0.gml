/// @Description input text/execute line
if (keyboard_check_pressed(vk_escape)) {
		active = !active;
		caret = 0;
}
if (!active) exit;
if (keyboard_check_pressed(vk_enter)) {
	switch (keyboard_key) {
		default: list_add(lines, text + " is not a valid command");	
	}
	if (ds_list_size(lines) > 20) {
		ds_list_delete(lines, 0);
	}
	keyboard_key = "";
	caret = 0;
	exit;
}

if (keyboard_check_pressed(vk_left)) {
	 caret++;
	 if (caret > string_length(keyboard_key) ){
		 caret = string_length(keyboard_key);
	 }
}

if (keyboard_check_pressed(vk_right)) {
	 caret--;
	 if (caret < 0) {
		 caret = 0;
	 }
}
