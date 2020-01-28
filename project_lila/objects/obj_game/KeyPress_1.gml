/// @description if / open console
if (keyboard_check(191)) {
	if (room != rm_debug) exit;
	if (console == "null") {
		console = instance_create_layer(0, 0, "GUIText" , obj_console);
		instance_deactivate_object(console);
	} 
	if (!instance_exists(console)) {
		alarm[0] = 1;
		global.pause = true;
		keyboard_string = "/";
		instance_activate_object(console);
	}
}