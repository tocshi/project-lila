var obj = fp_get_val(argument0);
var num = fp_get_val(argument1);

if (!object_exists(obj)) {
	show_debug_message("WARN: Obj doesnt exist");
} else {
	return instance_find(obj, num);
}