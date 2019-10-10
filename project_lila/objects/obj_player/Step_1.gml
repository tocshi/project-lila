//CHECK DEATH
if (statmap[? "hp"] <= 0 && !isDead){
	isDead = true;
	room_goto(rm_playerdeath);
}

// CALCULATE MOVESPEED
// Sum up all slows/speedups
speedup = sumMap(speedups, 0);
relative_speedUp = multMap(relative_speedups, 1);
slow = sumMap(slows, 0);
relative_slow = multMap(relative_slows, 1);

// Update movement speed from effects
statmap[? "movespeed"] = (statmap[? "base_movespeed"] + speedup - slow) * relative_speedUp * relative_slow;

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

//FACING THE RIGHT WAY
if(x <= destX){
	image_xscale = 1;
} else {
	image_xscale = -1;
}

//TIMERS
for (var i = 0; i < array_length_1d(cd); i++){
	if(cd[i] > 0){cd[i]--;}
}

for (var i = 0; i < ds_list_size(buff); if(!buffRemoved){i++;}){
	buffRemoved = false;
	var buff_array = ds_list_find_value(buff,i);
	buff_visual_handler(buff_array[2]);
	if(buff_array[0] > 0){
		buff_array[0]--;
		ds_list_replace(buff,i,buff_array);
	}
	if(buff_array[0] <= 0){
		script_execute(buff_array[3],self);
		ds_list_delete(buff,i);
		buffRemoved = true;
	}
}

if (atkTimer > 0){
	atkTimer--;
	if(atkTimer <= 0){
		canAttack = true;
		canUseSkill = true;
		canMove = true;
	}
}

