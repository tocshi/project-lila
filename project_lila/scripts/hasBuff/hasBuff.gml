var target = argument0;
var name = argument1;

if(!instance_exists(target)){return false;}

for (var i = 0; i < ds_list_size(target.buff); i++;){
	var buff_array = ds_list_find_value(target.buff,i);
	if(buff_array[2] == name){return true;}
}
return false;