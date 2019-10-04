var name = argument0;

for (var i = 0; i < ds_list_size(buff); i++;){
	var buff_array = ds_list_find_value(buff,i);
	if(buff_array[2] == name){
		script_execute(buff_array[3],self);
		ds_list_delete(buff,i);
	}
}