if(!ds_map_exists(global.itemData[| itemid],"activeCD")){exit;}
maxcd = ds_map_find_value(global.itemData[| itemid],"activeCD") * room_speed;
