event_inherited();
statmap[? "maxhp"] = 1000000;
statmap[? "hp"] = 1000000;
statmap[? "hpregen"] = 1000/60;
statmap[? "mpregen"] = 0;
statmap[? "essence_rate"] = 1000;

ds_map_copy(basestatmap, statmap);

canKnockback = false;
