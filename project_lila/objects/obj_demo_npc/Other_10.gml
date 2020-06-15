/// @description Insert description here
// You can write your code in this editor
text[0] = "Welcome to the Chronicles of Lila playable demo!";
text[1] = "This game is still in progress. What you're seeing here is a demo that is far far far far from finished. Adam and his team is still actively working on it though!";
text[2] = "You can follow their progress in the development blog (blog link here) or the official Chronicles of Lila Development Discord server (discord.gg/rEGTkZ).";
text[3] = "But for now, please enjoy this demo!";
text[4] = "Proceed to the right for the tutorial (To be implemented later)";
text[5] = "what item u want lul"
text[6] = "here haz 1 potions"
text[7] = "here haz nothing"

speakers = array_create(9,id);
pretext = array_create(9,-1);
posttext = array_create(9,-1);

dialogue_box = create_function_pointer(fp_instance_find, obj_dialogue_box, 0);
reset_dialogue_box = create_function_pointer(fp_event_user, dialogue_box, 0);
pause_dialogue_box = create_function_pointer(fp_variable_instance_set, dialogue_box, "dialogue_pause", true);
unpause_dialogue_box = create_function_pointer(fp_variable_instance_set, dialogue_box, "dialogue_pause", false);
delete_dialogue_buttons = create_function_pointer(destroy_buttons_by_type, "Dialogue");
end_dialogue = create_function_pointer(fp_variable_instance_set, dialogue_box, "last_page", true);

potion_button = instance_create_layer(LEFT_BUTTON_X, BUTTON_Y, "GUIPopUpButton", obj_generic_btn);
with(potion_button){
	type = "Dialogue";
	function = create_function_pointer_list(
					create_function_pointer(fp_variable_instance_set, other.dialogue_box, "answer", "potion"),
					create_function_pointer(fp_variable_instance_set, other.dialogue_box, "page", 6),
					other.unpause_dialogue_box,
					other.reset_dialogue_box,
					other.delete_dialogue_buttons);
	align = CENTRE;
	width = 200;
	height = 50;
	halign = fa_center;
	valign = fa_center;
	left_offset = 0;
	text = "Potion";
	sprite_index = spr_confirmation_button;
	event_perform(ev_other,ev_room_start);
}
instance_deactivate_object(potion_button)

nothing_button = instance_create_layer(RIGHT_BUTTON_X, BUTTON_Y, "GUIPopUpButton", obj_generic_btn);
with(nothing_button){
	type = "Dialogue";
		function = create_function_pointer_list(
					create_function_pointer(fp_variable_instance_set, other.dialogue_box, "answer", "nothing"),
					create_function_pointer(fp_variable_instance_set, other.dialogue_box, "page", 6),
					other.unpause_dialogue_box,
					other.reset_dialogue_box,
					other.delete_dialogue_buttons);
	align = CENTRE;
	width = 200;
	height = 50;
	halign = fa_center;
	valign = fa_center;
	left_offset = 0;
	text = "Nothing";
	sprite_index = spr_confirmation_button;
	event_perform(ev_other,ev_room_start);
}
instance_deactivate_object(nothing_button)

// Create the potion/nothing buttons
posttext[5] = create_function_pointer_list(
				create_function_pointer(fp_activate_object, potion_button),
				create_function_pointer(fp_activate_object, nothing_button),
				pause_dialogue_box);


// Skip if chose nothing 
var answer_equals_nothing = create_function_pointer(
						is_equal,
						create_function_pointer(fp_variable_instance_get, dialogue_box, "answer"),
						"nothing");
pretext[6] = create_function_pointer_list(
				create_function_pointer(
					if_, 
					answer_equals_nothing,
					create_function_pointer_list(
						create_function_pointer(fp_variable_instance_set, dialogue_box, "page", 7),   // skip to page 7 
						reset_dialogue_box),
					create_function_pointer_list(create_function_pointer(do_nothing)))); // else go to page 6
					
// Give potion then quit dialog
posttext[6] = create_function_pointer_list(
				create_function_pointer(addItem, 1),
				end_dialogue);
				
event_inherited();