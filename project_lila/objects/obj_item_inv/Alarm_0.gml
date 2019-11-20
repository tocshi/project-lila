/// @description Get sprite after it's properly set
// You can write your code in this editor

drag_sprite = asset_get_index(ds_map_find_value(global.itemData[| itemid], "sprite"));
show_debug_message(sprite_get_name(drag_sprite));
drag_sprite_set = true;