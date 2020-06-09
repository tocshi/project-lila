/// @param0 name
/// @param1 type

var name = argument0;
var type = argument1;

if(name == "" || type == ""){return -1;}

for(var i = 0; i < ds_list_size(global.skillData); ++i){
	if(ds_map_find_value(global.skillData[| i],"name") == name){
		if(ds_map_exists(global.skillData[| i],type)){
			return ds_map_find_value(global.skillData[| i],type);
		}
		else{
			show_error("Cannot find skill data type specified.",false);
			return -1;
		}
	}
}
show_error("Cannot find skill name specified.",true);
return -1;