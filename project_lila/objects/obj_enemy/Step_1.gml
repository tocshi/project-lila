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
statmap[? "finalshld"] = clamp(statmap[? "finalshld"],-100,100);

//FACING THE RIGHT WAY
if((direction >= 0 && direction <= 90) || (direction >= 270 && direction < 360)){
	image_xscale = 1;
} else {
	image_xscale = -1;
}

//ATK TIMER
if (atkTimer > 0){
	atkTimer--;
	if(atkTimer <= 0){
		canAttack = true;
		canUseSkill = true;
		canMove = true;
		speed = 0;
	}
}

// BUFF TIMER

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
	}
}