var num_buttons = 0;
var left_margin = room_width*(3/8);
var top_margin = room_height/8;
var bottom_margin = room_height/8;
var button_panel_height = room_height - top_margin - bottom_margin;
var button_height = button_panel_height;
var current_button = 0;

if (global.movement_mode == 0) {
	num_buttons = array_length_1d(global.options_keys);
} else if (global.movement_mode == 1) {
	num_buttons = array_length_1d(global.options_keys) + array_length_1d(global.options_directional_keys) + global.movement_mode;	
}

button_height /= num_buttons;
var button_width = room_width/4;

// Button to toggle between movement modes
var movement_mode_to_change_to = global.movement_mode == 0 ? 1 : 0;
var movement_mode_button_text = "Movement mode: " + (global.movement_mode == 0 ? "Mouse" : "Keyboard");
with(instance_create_layer(left_margin, top_margin + current_button * button_height, "GUIText", obj_generic_btn)) {
	type = "Movement mode";
	function = call_list(
					call(fp_variable_global_set, "movement_mode", movement_mode_to_change_to),
					call(fp_room_goto, rm_options));
	align = TOP_LEFT;
	width = button_width;
	height = button_height;
	halign = fa_left;
	valign = fa_middle;
	left_offset = 10;
	text = movement_mode_button_text;
	sprite_index = spr_black_gray_hover_rectangle;
	event_perform(ev_other,ev_room_start);
}
current_button ++;

// Directional buttons

if (global.movement_mode == 1) {
	for(var i = 0; i < array_length_1d(global.options_directional_keys); ++i){
		with(instance_create_layer(left_margin, top_margin + current_button * button_height,"GUIText", obj_debug_menu_button)){
			type = 1;
			data = array_create(1,global.options_directional_keys[i]);
			text_font = fnt_gui_small;
			width = button_width;
			height = button_height;
		}
		current_button ++;
	}
}

// Other buttons

for(var i = 0; i < array_length_1d(global.options_keys); ++i){
	with(instance_create_layer(left_margin, top_margin + current_button * button_height, "GUIText", obj_debug_menu_button)){
		type = 1;
		data = array_create(1,global.options_keys[i]);
		text_font = fnt_gui_small;
		width = button_width;
		height = button_height;
	}
	current_button ++;
}

