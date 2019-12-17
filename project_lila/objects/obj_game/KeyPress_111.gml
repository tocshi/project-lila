/// @description Open console
if (room != rm_debug) exit;
if (console == "null") {
	console = instance_create_layer(0, 0, "GUIText" , obj_console);
	instance_deactivate_object(console);
}
if (instance_exists(console)) {
	instance_deactivate_object(console);
} else {
	instance_activate_object(console);
}