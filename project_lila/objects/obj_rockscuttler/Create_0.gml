event_inherited();
statmap[? "level"] = 8;
statmap[? "maxhp"] = 120;
statmap[? "hp"] = statmap[? "maxhp"];
statmap[? "hpregen"] = 0;
statmap[? "mpregen"] = 0;
statmap[? "atk"] = 16;
statmap[? "atkspeed"] = 0.3;
statmap[? "movespeed"] = 2;
statmap[? "xp"] = 18;

ds_map_copy(basestatmap, statmap);

canKnockback	= true;