var target = argument0;
var name = argument1;
var type = argument2;

if(!instance_exists(target)){return -1;}

for (var i = 0; i < ds_list_size(target.buff); ++i;){
	var buff_array = ds_list_find_value(target.buff,i);
	if(buff_array[2] == name){
		switch(type){
			case "time":
			return buff_array[0];
			
			case "stacks":
			return buff_array[5];
			
			case "maxstacks":
			return buff_array[6];
			
			case "data":
			return buff_array[9];
		
			default:
			show_error("get buff data type is invalid!", false);
			return -1;
		}
	}
}
show_error("unable to find buff...somehow!", false);
return -1;