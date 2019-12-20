event_inherited();
image_blend = c_yellow;
statmap[? "maxhp"] = 500;
statmap[? "hp"] = 500;
statmap[? "hpregen"] = 1;
statmap[? "mpregen"] = 0;
statmap[? "movespeed"] = 5;

ds_map_copy(basestatmap, statmap);

canKnockback = true;

alarm[1] = 1;

second = false;