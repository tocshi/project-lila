event_inherited();
image_blend = c_olive;
statmap[? "maxhp"] = 500;
statmap[? "hp"] = 500;
statmap[? "maxmp"] = 30;
statmap[? "mp"] = 30;
statmap[? "hpregen"] = 0;
statmap[? "mpregen"] = 0.25;
statmap[? "atk"] = 15;
statmap[? "movespeed"] = 2.2;
statmap[? "xp"] = 20;

ds_map_copy(basestatmap, statmap);

aggro_range = 3000;
recalc_countdown = 0;
ai_path = path_add();

if (!variable_instance_exists(id, "ai_path")) {
	show_debug_message("ai_path not created");
}

getPath(id, obj_player, ai_path);

canKnockback	= true;
standing_still = 0;
target = noone;