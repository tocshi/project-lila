event_inherited();
statmap[? "maxhp"] = 31;
statmap[? "hp"] = 31;
statmap[? "hpregen"] = 0.5;
statmap[? "mpregen"] = 0;
ds_map_copy(basestatmap, statmap);

canKnockback	= true;

// Ally HP Bar
var minihp = instance_create_layer(x, y, "dmgTxt", obj_allyhpbar);
minihp.hpwidth	= sprite_width;
minihp.target	= id;