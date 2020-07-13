// Constructor for dialogue button

button = instance_create_layer(0, 0, "GUIPopUpButton", obj_dialogue_btn);
with(button){
	type = "Dialogue";
	function = argument0;
	button_number = argument1;
	number_of_buttons = argument2;
	text = argument3;
	sprite_index = argument4;
	event_perform(ev_other, ev_room_start);
}

return button;