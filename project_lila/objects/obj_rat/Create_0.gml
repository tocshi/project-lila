event_inherited();
statmap[? "level"] = 4;
statmap[? "maxhp"] = 60;
statmap[? "hp"] = statmap[? "maxhp"];
statmap[? "hpregen"] = 0;
statmap[? "mpregen"] = 0;
statmap[? "atk"] = 10;
statmap[? "atkspeed"] = 0.3;
statmap[? "movespeed"] = 6;
statmap[? "xp"] = 8;

ds_map_copy(basestatmap, statmap);

canKnockback	= true;