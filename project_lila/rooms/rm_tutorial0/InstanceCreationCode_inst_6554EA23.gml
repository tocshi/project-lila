text[0] = "Welcome to the tutorial, which aims to demonstrate the mechanics we’ve built into Project Lila so far!";
text[1] = "Before we begin, which combat style do you prefer?";
text[2] = "Cool, now do you prefer to be more defensive or offensive?";
text[3] = "Cool, now do you imagine yourself wielding a bow and arrow, or using magic?";
text[4] = "Here you go, I’ve granted you some basic items to start you off.\n Now proceed to the next sign to learn how to use them!";

speakers = array_create(9,id);
pretext = array_create(9,-1);
posttext = array_create(9,-1);

create_melee_button = call(
						dialogue_button,
						call_list(
							call(fp_variable_instance_set, dialogue_box, "page", 2),
							unpause_dialogue_box,
							reset_dialogue_box,
							delete_dialogue_buttons),
						1,
						2,
						"Melee",
						spr_confirmation_button);
						
create_ranged_button = call(
						dialogue_button,
						call_list(
							call(fp_variable_instance_set, dialogue_box, "page", 3),
							unpause_dialogue_box,
							reset_dialogue_box,
							delete_dialogue_buttons),
						2,
						2,
						"Ranged",
						spr_confirmation_button);


create_defensive_button = call(
							dialogue_button,
							call_list(
								call(fp_variable_instance_set, dialogue_box, "answer", "Knight"),
								call(fp_variable_instance_set, dialogue_box, "page", 4),
								unpause_dialogue_box,
								reset_dialogue_box,
								delete_dialogue_buttons),
							1,
							2,
							"Defensive",
							spr_confirmation_button);
							
create_offensive_button = call(
							dialogue_button,
							call_list(
								call(fp_variable_instance_set, dialogue_box, "answer", "Rogue"),
								call(fp_variable_instance_set, dialogue_box, "page", 4),
								unpause_dialogue_box,
								reset_dialogue_box,
								delete_dialogue_buttons),
							2,
							2,
							"Offensive",
							spr_confirmation_button);

create_archer_button = call(
						dialogue_button,
						call_list(
							call(fp_variable_instance_set, dialogue_box, "answer", "Archer"),
							call(fp_variable_instance_set, dialogue_box, "page", 4),
							unpause_dialogue_box,
							reset_dialogue_box,
							delete_dialogue_buttons),
						1,
						2,
						"I like to shoot arrows!",
						spr_confirmation_button);

create_mage_button = call(
						dialogue_button,
						call_list(
							call(fp_variable_instance_set, dialogue_box, "answer", "Mage"),
							call(fp_variable_instance_set, dialogue_box, "page", 4),
							unpause_dialogue_box,
							reset_dialogue_box,
							delete_dialogue_buttons),
						2,
						2,
						"I like to use magic!",
						spr_confirmation_button);

// Create the potion/nothing buttons
posttext[1] = call_list(
				create_melee_button,
				create_ranged_button,
				pause_dialogue_box);

// Create offensive/defensive buttons
posttext[2] = call_list(
				create_defensive_button,
				create_offensive_button,
				pause_dialogue_box);
				
// Create archer/mage buttons
posttext[3] = call_list(
				create_archer_button,
				create_mage_button,
				pause_dialogue_box);

answer = _value(single_call(fp_variable_instance_get, dialogue_box, "answer"));

var answer_equals_knight = _value(
								single_call(
									is_equal,
									answer,
									"Knight"));

var answer_equals_rogue = _value(
								single_call(
									is_equal,
									answer,
									"Rogue"));

var answer_equals_archer = _value(
								single_call(
									is_equal,
									answer,
									"Archer"));

var answer_equals_mage = _value(
								single_call(
									is_equal,
									answer,
									"Mage"));
pretext[4] = call_list(
				call(change_class, player, answer),
				call(
					if_, 
					answer_equals_knight,
					single_call(addItem, 1),
					single_call(do_nothing)),
				call(
					if_, 
					answer_equals_rogue,
					single_call(addItem, 1),
					single_call(do_nothing)),
				call(
					if_, 
					answer_equals_archer,
					single_call(addItem, 1),
					single_call(do_nothing)),
				call(
					if_, 
					answer_equals_mage,
					single_call(addItem, 1),
					single_call(do_nothing)));
					

				