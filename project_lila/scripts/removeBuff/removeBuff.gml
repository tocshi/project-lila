var target = argument0;
var name = argument1;
var isForce = argument2;

for (var i = 0; i < ds_list_size(target.buff); ++i;){
	var buff_array = ds_list_find_value(target.buff,i);
	if(buff_array[2] == name){
		if(!isForce){script_execute(buff_array[3],self);}
		ds_list_delete(target.buff,i);
		target.statChange = true;
		exit;
	}
}