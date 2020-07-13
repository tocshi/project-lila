var obj = argument0;
var num = argument1;

if (!object_exists(obj)) {
	show_debug_message("WARN: Obj doesnt exist");
} else {
	return instance_find(obj, num);
}