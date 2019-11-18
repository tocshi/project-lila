event_inherited();
image_blend = c_olive;
statmap[? "maxhp"] = 500;
statmap[? "hp"] = 500;
statmap[? "hpregen"] = 1;
statmap[? "mpregen"] = 0;

ds_map_copy(basestatmap, statmap);

aggro_range = 360;
recalc_countdown = 0;
ai_path = path_add();

if (!variable_instance_exists(id, "ai_path")) {
	show_debug_message("ai_path not created");
}

getPath(id, obj_player, ai_path);