var name = fp_get_val(argument0);
var val = fp_get_val(argument1);

// show_debug_message("global." + name + " is " + variable_instance_get(obj, name));

return variable_global_set(name, val);