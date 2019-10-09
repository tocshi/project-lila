//CHECK DEATH
if (statmap[? "hp"] <= 0 && !isDead){
	isDead = true;
	mask_index = spr_empty;
	alarm[0] = 30;
}

//REGENERATION
statmap[? "hp"] += statmap[? "hpregen"];
statmap[? "mp"] += statmap[? "mpregen"];

//STAT CLAMPING
statmap[? "atkspeed"] = clamp(statmap[? "atkspeed"],0.01,10);
statmap[? "movespeed"] = clamp(statmap[? "movespeed"],0,30);
statmap[? "hp"] = clamp(statmap[? "hp"],0,statmap[? "maxhp"]);
statmap[? "mp"] = clamp(statmap[? "mp"],0,statmap[? "maxmp"]);

//FACING THE RIGHT WAY
if((direction >= 0 && direction <= 90) || (direction >= 270 && direction < 360)){
	image_xscale = 1;
} else {
	image_xscale = -1;
}