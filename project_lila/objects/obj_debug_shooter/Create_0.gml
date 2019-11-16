event_inherited();
image_blend = c_purple;
statmap[? "maxhp"] = 1000;
statmap[? "hp"] = 1000;
statmap[? "hpregen"] = 1000;
statmap[? "mpregen"] = 0;

ds_map_copy(basestatmap, statmap);

canKnockback = true;

alarm[1] = room_speed*2;