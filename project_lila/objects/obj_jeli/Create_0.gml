event_inherited();
statmap[? "level"] = 1;
statmap[? "maxhp"] = 50;
statmap[? "hp"] = statmap[? "maxhp"];
statmap[? "hpregen"] = 0;
statmap[? "mpregen"] = 0;
statmap[? "xp"] = 8;

ds_map_copy(basestatmap, statmap);

canKnockback	= true;
