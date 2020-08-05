event_inherited();
statmap[? "level"] = 4;
statmap[? "maxhp"] = 60;
statmap[? "hp"] = statmap[? "maxhp"];
statmap[? "hpregen"] = 0;
statmap[? "mpregen"] = 0;
statmap[? "atk"] = 12;
statmap[? "atkspeed"] = 0.8;
statmap[? "movespeed"] = 8;
statmap[? "xp"] = 15;

ds_map_copy(basestatmap, statmap);

canKnockback	= true;