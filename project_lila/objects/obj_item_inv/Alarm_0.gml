if(!ds_map_exists(global.itemData[| itemid],"activeCD")){exit;}
maxcd = ds_map_find_value(global.itemData[| itemid],"activeCD") * room_speed;

drag_sprite = asset_get_index(ds_map_find_value(global.itemData[| itemid], "sprite"));
show_debug_message(sprite_get_name(drag_sprite));

drag_sprite_set = true;
