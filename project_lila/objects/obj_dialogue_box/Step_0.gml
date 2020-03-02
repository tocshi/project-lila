// Probably not optimal but it does the job for now
if(global.pause != true){
	global.pause = true;
}

// Increments char counter for typewriter effect
if(!pause && time % textspeed == 0 && char_counter < string_length(text[page])){
	// play a sound here lol
	char_counter++;
	
	switch(string_char_at(text[page], char_counter)){	
		case ",":
		case ";":
		case ":": pause = true; alarm[1] = textspeed*10; break;
		case ".":
		case "?":
		case "!": pause = true; alarm[1] = textspeed*20; break;
	}
}

// when interact button is pressed
if((keyboard_check_pressed(vk_escape) || keyboard_check_pressed(global.key_interact) || mouse_check_button_pressed(global.mouse_interact)) && !instance_exists(obj_console)){
	if(char_counter < string_length(text[page])){
		char_counter = string_length(text[page]);
	}
	else{
		if(page = array_length_1d(text)-1){
			instance_destroy();
			exit;
		}
		page++;
		portrait_sprite = speakers[page].portrait_sprite;
		name = speakers[page].name;
		voice_sound = speakers[page].voice_sound;
		alarm[0] = 1;
		time = 0;
		char_counter = 0;
	}
}


