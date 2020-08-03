var obj = fp_get_val(argument0);
var name = fp_get_val(argument1);

// show_debug_message("Object " + string(obj) + "'s " + name + " is " + variable_instance_get(obj, name));

return variable_instance_get(obj, name);