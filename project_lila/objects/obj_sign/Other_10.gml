text[0] = "Welcome to the Project Lila playable demo!";
text[1] = "This game is still in progress. What you're seeing here is a demo that is far far far far from finished. Adam and his team is still actively working on it though!";
text[2] = "You can follow their progress in the development blog (blog link here) or the official Project Lila Development Discord server (discord.gg/rEGTkZ).";
text[3] = "But for now, please enjoy this demo!";
text[4] = "Proceed to the right to play what we have so far.";
text[5] = "what item u want lul"
text[6] = "here haz 1 potions"
text[7] = "here haz 1 nothing"

speakers = array_create(9,id);
pretext = array_create(9,-1);
posttext = array_create(9,-1);

dialogue_box = single_call(fp_instance_find, obj_dialogue_box, 0);
reset_dialogue_box = call(fp_event_user, dialogue_box, 0);
pause_dialogue_box = call(fp_variable_instance_set, dialogue_box, "dialogue_pause", true);
unpause_dialogue_box = call(fp_variable_instance_set, dialogue_box, "dialogue_pause", false);
delete_dialogue_buttons = call(destroy_buttons_by_type, "Dialogue");
end_dialogue = call(fp_variable_instance_set, dialogue_box, "last_page", true);

create_potion_button = single_call(
						dialogue_button,
						call_list(
							call(fp_show_debug_message("Potion")),
							call(fp_variable_instance_set, dialogue_box, "answer", "potion"),
							call(fp_variable_instance_set, dialogue_box, "page", 6),
							unpause_dialogue_box,
							reset_dialogue_box,
							delete_dialogue_buttons),
						1,
						2,
						"A potion",
						spr_confirmation_button);

create_nothing_button = single_call(
						dialogue_button,
						call_list(
							call(fp_show_debug_message("Nothing")),
							call(fp_variable_instance_set, dialogue_box, "answer", "nothing"),
							call(fp_variable_instance_set, dialogue_box, "page", 6),
							unpause_dialogue_box,
							reset_dialogue_box,
							delete_dialogue_buttons),
						2,
						2,
						"A nothing",
						spr_confirmation_button);

// Create the potion/nothing buttons
posttext[5] = call_list(
				call(fp_variable_instance_set, self, "potion_button", create_potion_button),
				call(fp_variable_instance_set, self, "nothing_button", create_nothing_button),
				pause_dialogue_box);


// Skip if chose nothing 
var answer_equals_nothing = single_call(
								is_equal,
								single_call(fp_variable_instance_get, dialogue_box, "answer"),
								"nothing");
pretext[6] = call_list(
				call(
					if_, 
					answer_equals_nothing,
					call_list(
						call(fp_variable_instance_set, dialogue_box, "page", 7),   // skip to page 7 
						reset_dialogue_box),
					single_call(do_nothing))); // else go to page 6
					
// Give potion then quit dialog
posttext[6] = call_list(
				call(addItem, 1),
				end_dialogue);
				
event_inherited();

bubble = -1;