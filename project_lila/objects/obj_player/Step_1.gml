// Calculate stat changes from equipped items...move this to a script later you bimbo 
if(!equipApplied){applyEquips(self.id);}

if(statChange){
	recalcStats(self.id);
}


// CALCULATE STATS
// Sum up all stat buffs/debuffs
var speedup = sumMap(speedups, 0);
var relative_speedUp = multMap(relative_speedups, 1);
var slow = sumMap(slows, 0);
var relative_slow = multMap(relative_slows, 1);

//TIMERS
for (var i = 0; i < array_length_1d(cd); i++){
	if(cd[i] > 0){cd[i]--;}
}

for (var i = 0; i < ds_list_size(buff); if(!buffRemoved){i++;}){
	buffRemoved = false;
	var buff_array = ds_list_find_value(buff,i);
	buff_effect_handler(buff_array[2]);
	if(buff_array[0] > 0){
		buff_array[0]--;
		ds_list_replace(buff,i,buff_array);
	}
	if(buff_array[0] <= 0){
		removeBuff(self.id,buff_array[2])
		buffRemoved = true;
		recalcStats(self.id);
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
statmap[? "finalshld"] = clamp(statmap[? "finalshld"],-100,100);



