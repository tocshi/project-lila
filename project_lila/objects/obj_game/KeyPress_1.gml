/// @description if global.key_console open console
if (keyboard_check(global.key_console[global.movement_mode])) {
	if (!instance_exists(global.player)) exit;
	if (!instance_exists(console)) {
		console = instance_create_layer(0, 0, "GUIText" , obj_console);
	}
	if (!console.active) {
		alarm[0] = 1;
		global.pause = true;
		global.gui_state = 0;
		keyboard_string = "/";
		console.active = true;
		console.alarm[0] = console.CARET_DELAY;
	}
} 