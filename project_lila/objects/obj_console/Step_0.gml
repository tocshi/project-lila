/// @Description input text/execute line
// TODO: add to lines normally, as wrapping will be done in draw anyway (can remove script after)
if (!is_active) exit;

if (keyboard_check_pressed(vk_enter)) {
	// TEMPORARY WORKAROUND FOR BACKSLASH BUG!
	if(string_char_at(keyboard_string,string_length(keyboard_string)) == "\\"){
		keyboard_string = "";
	}
	
	ds_list_add(history, keyboard_string + after_caret);
	history_cursor = ds_list_size(history);
	arg_list = split(keyboard_string + after_caret, " ");
	command = get_or_default(arg_list[| 0], "");
	arg1 = get_or_default(arg_list[| 1], "");
	arg2 = get_or_default(arg_list[| 2], "");
	arg3 = get_or_default(arg_list[| 3], "");
	switch (command) {
		case "/changeclass":
			if (!is_string(arg1)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "changeclass"]);
				break;
			}
			arg1 = string_lower(arg1);
			capitalized_first_letter = string_upper(string_char_at(arg1, 1));
			arg1 = string_delete(arg1, 1, 1);
			arg1 = string_insert(capitalized_first_letter, arg1, 1);
			if(global.player.statmap[? "class"] == arg1){
				ds_list_add(lines, command + ": You are already a " + arg1 +"!");
			}
			else if(!change_class(global.player, arg1)){
				ds_list_add(lines, arg1 + " is not a valid class! Valid classes are Knight, Archer, Mage, and Rogue.");
			}
			else{
				ds_list_add(lines, command + ": Player class changed to " + arg1);
			}
			break;
		case "/class":
			ds_list_add(lines, command + ": Your class is " + global.player.statmap[? "class"]);
			break;
		case "/commands":
			if (!string_is_uint(arg1)) {
				arg1 = 1;				
			}
			if (arg1 >= 2) {
				ds_list_add(lines, command + ": pageNum too large. There is only 1 page.");	
			}
			ds_list_add(lines, commands[| arg1 - 1]);
			break;
		case "/cpp":
		case "/cplusplus":
			if (!string_is_int(arg1)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "cpp"]);
			} else {
				global.playerCPP[? global.player.statmap[? "class"]] = real(arg1);
				ds_list_add(lines, command + ": Player's CPP for class " + global.player.statmap[? "class"] + " set to " + arg1);
			}
			break;
		case "/die":
			global.pause = false;
			global.player.statmap[? "hp"] = 0;
			ds_list_add(lines, command + ": Player killed");
			break;
		case "/dummystat":
			if (ds_list_find_index(global.equipStats, arg1) == -1) {
				ds_list_add(lines, command + ": " + arg1 + " is not a valid stat");
			} else if (!string_is_float(arg2)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "dummystat"]);	
			} else {
				with (obj_debug_dummy) {
					basestatmap[? other.arg1] = other.arg2;
				}
				ds_list_add(lines, command + ": Dummy's " + arg1 + " set to " + arg2);
			}
			break;
		case "/give":
			if (arg2 = "") {
				arg2 = 1;
			}
			if (!string_is_uint(arg1) || !string_is_uint(arg2)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "give"]);
				break;
			}
			show_debug_message(ds_list_size(global.itemData));
			if (ds_list_size(global.itemData) < (arg1 - 1) || !is_real(global.itemData[| arg1])) {
				ds_list_add(lines, "Invalid item id: " + arg1);
				break;
			}
			global.playerItems[arg1] += arg2;
			if (findArrayIndex(global.playerInv, arg1) == -1) {
				for (var i=0; i < array_length_1d(global.playerInv); i++) {
					if (global.playerInv[i] == 0) {
						global.playerInv[i] = arg1;
						break;
					}
				}
			}
			
			ds_list_add(lines, string(command) +": " + string(arg2) + " of Item Id " + string(arg1) + " given");
			break;
		case "/givexp":
			if (!string_is_int(arg1)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "givexp"]);
			} else if (real(arg1) < 1) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "givexp"]);
			} else {
				global.playerXP += real(arg1);
				global.playerLevel = floor(power(global.playerXP/100, 10/13)) // inverse of level to XP function
				with(global.player){
					event_perform(ev_other,ev_user0);
				}
				ds_list_add(lines, command + ": Player's total xp set to " + arg1);
			}
			break;
		case "/help":
			if (!is_string(arg1)) {
				ds_list_add(lines, "help : " + help[? ""]);
			} else if (!is_string(help[? arg1])) {
				ds_list_add(lines, command + ": is not a valid command. Use /commands to list commands");
			} else {
				ds_list_add(lines, command + ": " + help[? arg1]);
			}
			break;
		case "/lvl":
		case "/level":
			if (!string_is_int(arg1)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "level"]);
			} else if (real(arg1) < 0) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "level"]);
			} else {
				global.playerLevel = real(arg1);
				global.playerXP = 100*power(global.playerLevel,1.3);
				with(global.player){
					event_perform(ev_other,ev_user0);
				}
				ds_list_add(lines, command + ": Player's level set to " + arg1);
			}
			break;
		case "/playerstat":
			if (!is_string(arg1) || !string_is_float(arg2)){
				ds_list_add(lines, INCORRECT_USAGE + help[? "playerstat"]);	
			} else if (arg1 == "class") {
				ds_list_add(lines, command + ": player class cannot be changed with the /playerstat command. Try /changeclass"); 
			} else if (!ds_map_exists(global.player.statmap, arg1)) {
				ds_list_add(lines, command + ": " + arg1 + " is not a valid stat. Valid stats include " + PLAYER_STAT_LIST);
			} else {
				global.player.basestatmap[? arg1] = real(arg2);
				global.player.statmap[? arg1] = real(arg2);
				ds_list_add(lines, command + ": Player's " + arg1 + " set to " + arg2);
			}
			global.player.statChange = true;
			break;
		case "/setcontrol":
			if (!is_string(arg1) || !is_string(arg2)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "setcontrol"]);
				break;
			}
			ds_list_add(lines, NOT_IMPLEMENTED_YET);
			break;
		default: ds_list_add(lines, command + " is not a valid command. Use /commands to list commands");	
	}
	keyboard_string = "";
	after_caret = "";
	caret = 0;
	exit;
}

// Caret movement logic

if (keyboard_check_pressed(vk_left)) {
	// Caret is the distance from the end of the text input. This is done since typing updates keyboard_string internally and wont update caret
	 caret++;
	 if (caret > string_length(keyboard_string) + string_length(after_caret)){
		 caret = string_length(keyboard_string) + string_length(after_caret);
	 } else {
		 char = string_char_at(keyboard_string, string_length(keyboard_string));	 
		 after_caret = char + after_caret;
		 keyboard_string = string_delete(keyboard_string, string_length(keyboard_string), 1);
	 }
}

if (keyboard_check_pressed(vk_right)) {
	 caret--;
	 if (caret < 0) {
		 caret = 0;
	 } else {
		char = string_char_at(after_caret, 0);
		keyboard_string += char;
		after_caret = string_delete(after_caret, 1, 1);
	 }
}


// History logic

if (keyboard_check_pressed(vk_up)) {
	history_cursor--;
	if (history_cursor < 0) {
		history_cursor = 0;
	}
	caret = 0;
	keyboard_string = history[| history_cursor];
	after_caret = "";
}

if (keyboard_check_pressed(vk_down)) {
	history_cursor++;
	if (history_cursor > ds_list_size(history)) {
		history_cursor = ds_list_size(history);
		keyboard_string = "";
		caret = 0;
	}
	caret = 0;
	keyboard_string = history[| history_cursor];
	after_caret = "";
}

//Keep console in position
if(instance_exists(global.player)){
	x = 0;
	y = camera_get_view_height(global.currentCamera)/2 - HEIGHT/2;
}
