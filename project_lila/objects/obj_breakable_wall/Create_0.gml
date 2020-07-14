event_inherited();

statmap[? "level"] = 1;
statmap[? "maxhp"] = 20;
statmap[? "hp"] = statmap[? "maxhp"];
statmap[? "hpregen"] = 0;
statmap[? "mpregen"] = 0;
statmap[? "xp"] = 0;
statmap[? "essence_rate"]	= 0;

ds_map_copy(basestatmap, statmap);

show_hp_bar = false;
