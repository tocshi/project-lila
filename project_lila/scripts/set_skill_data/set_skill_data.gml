/// @param0 name
/// @param1 type
/// @param1 value

var name = argument0;
var type = argument1;
var value = argument2;

if(name == "" || type == ""){return -1;}

for(var i = 0; i < ds_list_size(global.skillData); ++i){
	if(ds_map_find_value(global.skillData[| i],"name") == name){
		if(ds_map_exists(global.skillData[| i],type)){
			ds_map_set(global.skillData[| i],type,value);
			show_debug_message(type + " in dynamic is " + string(get_skill_data(name,type)))
			exit;
		}
		else{
			show_error("Cannot find skill data type specified.",false);
		}
	}
}
show_error("Cannot find skill name specified.",true);