map = argument0;
num = argument1;
size = ds_map_size(map)
key = ds_map_find_first(map);
for (i = 0; i < size; i++;) {
   num += ds_map_find_value(map, key);
   key = ds_map_find_next(map, key);
}
return num;