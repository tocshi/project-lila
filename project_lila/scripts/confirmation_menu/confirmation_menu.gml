x = camera_get_view_x(global.currentCamera) + camera_get_view_width(global.currentCamera)/2;
y = camera_get_view_y(global.currentCamera) + camera_get_view_height(global.currentCamera)/2;

var confirm_menu = instance_create_layer(x, y, "GUIPopUp", obj_confirmation_menu);
confirm_menu.text = argument2;

with(instance_create_layer(x - confirm_menu.BTN_SEP, y + confirm_menu.BTN_DEPTH, "GUIPopUpButton", obj_generic_btn)){
	type = "Confirmation";
	function = argument0;
	align = CENTRE;
	width = 200;
	height = 50;
	halign = fa_center;
	valign = fa_center;
	left_offset = 0;
	text = "Yes";
	sprite_index = spr_confirmation_button;
	event_perform(ev_other,ev_room_start);
}

with(instance_create_layer(x + confirm_menu.BTN_SEP, y + confirm_menu.BTN_DEPTH, "GUIPopUpButton", obj_generic_btn)){
	type = "Confirmation";
	function = argument1;
	align = CENTRE;
	width = 200;
	height = 50;
	halign = fa_center;
	valign = fa_center;
	left_offset = 0;
	text = "No";
	sprite_index = spr_confirmation_button;
	event_perform(ev_other,ev_room_start);
}