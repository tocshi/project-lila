//CHECK DEATH
if (statmap[? "hp"] <= 0 && !isDead){
	isDead = true;
	mask_index = spr_empty;
	alarm[0] = 30;
}

// Become unstuck from a wall
if(!place_free(x,y) && canKnockback){
	var wall = instance_place(x,y,obj_wall_parent);
	move_outside_solid(point_direction(wall.x,wall.y,x,y),10);
}

if(statChange){
	recalcStats(self.id);
}

//TIMERS
// Buffs
for (var i = ds_list_size(buff)-1; i >= 0; i--){
	var buff_array = ds_list_find_value(buff,i);

	buff_effect_handler(buff_array[2]);
	if(buff_array[0] > 0){
		buff_array[0]--;
		ds_list_replace(buff,i,buff_array);
	}
	if(buff_array[0] <= 0){
		removeBuff(self.id,buff_array[2],false);
		recalcStats(self.id);
	}
}

//REGENERATION
statmap[? "hp"] += statmap[? "hpregen"];
if(highRegenThreshold >= 90){
	statmap[? "mp"] += statmap[? "mpregen"]*2;
} else {
	statmap[? "mp"] += statmap[? "mpregen"];
}

//STAT CLAMPING
statmap[? "atkspeed"] = clamp(statmap[? "atkspeed"],0.01,10);
statmap[? "movespeed"] = clamp(statmap[? "movespeed"],0,30);
statmap[? "hp"] = clamp(statmap[? "hp"],0,statmap[? "maxhp"]);
statmap[? "mp"] = clamp(statmap[? "mp"],0,statmap[? "maxmp"]);
statmap[? "finalshld"] = clamp(statmap[? "finalshld"],-100,100);

//FACING THE RIGHT WAY
if(x <= destX){
	image_xscale = 1;
} else {
	image_xscale = -1;
}

statChange = false;

