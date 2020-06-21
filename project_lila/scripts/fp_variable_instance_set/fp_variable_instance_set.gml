var obj = fp_get_val(argument0);
var name = fp_get_val(argument1);
var val = fp_get_val(argument2);

//show_debug_message("Object " + string(obj) + "'s " + name + " set to " + string(val));

variable_instance_set(obj, name, val);