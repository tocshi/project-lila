/// @description if / open console
if (keyboard_check(191)) {
	if (!instance_exists(global.player)) exit;
	if (console == noone) {
		console = instance_create_layer(0, 0, "GUIText" , obj_console);
		instance_deactivate_object(console);
	}
	alarm[0] = 1;
	global.pause = true;
	global.gui_state = 0;
	keyboard_string = "/";
	instance_activate_object(console);
} 