/// @description Open console
if (room != rm_debug) exit;
if (instance_exists(console)) {
	instance_deactivate_object(console);
} else {
	instance_activate_object(console);
}