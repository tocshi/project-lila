var list = argument0;
for (var i = 0; i < ds_list_size(list); i++) {
	var ret = execute_function_pointer(list[| i]);
}
return ret;
