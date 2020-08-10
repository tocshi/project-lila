event_inherited();
statmap[? "level"] = 1;
statmap[? "maxhp"] = 50;
statmap[? "hp"] = statmap[? "maxhp"];
statmap[? "hpregen"] = 0;
statmap[? "mpregen"] = 0;
statmap[? "atk"] = 8;
statmap[? "atkspeed"] = 3;
statmap[? "movespeed"] = 3;
statmap[? "xp"] = 8;
statmap[? "range"] = 512;

ds_map_copy(basestatmap, statmap);

canKnockback	= false;
image_blend = c_green;