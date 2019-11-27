var target = argument0;

for(var i = 0; i < ds_list_size(global.equipStats); ++i){
	target.statmap[? global.equipStats[| i]] = ds_map_find_value(target.basestatmap,global.equipStats[| i]);
}