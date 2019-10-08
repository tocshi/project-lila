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

//TIMERS
for (var i = 0; i < array_length_1d(cd); i++){
	if(cd[i] > 0){cd[i]--;}
}

for (var i = 0; i < ds_list_size(buff); if(!buffRemoved){i++;}){
	buffRemoved = false;
	var buff_array = ds_list_find_value(buff,i);
	if(buff_array[0] > 0){
		buff_array[0]--;
		ds_list_replace(buff,i,buff_array);
		//debug
		var effect = instance_create_layer(x,y+32,"Instances",obj_debug_buff);
		effect.vspeed = -1;
	}
	if(buff_array[0] <= 0){
		script_execute(buff_array[3],self);
		ds_list_delete(buff,i);
		buffRemoved = true;
	}
}


//COUNTDOWN EVENTS
if (cd[0] == 1){canMove = true;}

