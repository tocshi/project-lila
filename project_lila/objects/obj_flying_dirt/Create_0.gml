event_inherited();
statmap[? "level"] = 1;
statmap[? "maxhp"] = 50;
statmap[? "hp"] = statmap[? "maxhp"];
statmap[? "hpregen"] = 0;
statmap[? "mpregen"] = 0;
statmap[? "atk"] = 8;
statmap[? "atkspeed"] = 0.5;
statmap[? "movespeed"] = 2;
statmap[? "xp"] = 8;

ds_map_copy(basestatmap, statmap);

canKnockback	= true;
image_blend = c_green;