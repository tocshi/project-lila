// Become unstuck from a wall
if(!place_free(x,y)){
	var wall = instance_place(x,y,obj_wall_parent);
	move_outside_solid(point_direction(wall.x,wall.y,x,y),10);
}

if(statChange){
	recalcStats(self.id);
	// Determine current atk element
	if(ds_map_exists(global.itemData[| equips[0]],"element")){
		atkelement = ds_map_find_value(global.itemData[| equips[0]],"element");
	}
	else {
		atkelement = "none";
	}
}

//TIMERS
// Skill Cooldowns
for (var i = 0; i < array_length_1d(cd); ++i){
	if(cd[i] > 0){
		cd[i]--;}
}
if(cd[0] <= 0 && essence < 0){essence = 0;}
// Item Cooldowns
for (var i = 0; i < array_length_1d(itemcd); ++i){
	if(itemcd[i] > 0){itemcd[i]--;}
}
// Buffs
for (var i = ds_list_size(buff)-1; i >= 0; i--){
	var buff_array = ds_list_find_value(buff,i);

	if(buff_array[1] == false){
		ds_list_delete(visBuff, i);
	}

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

// Update visible buff list for use in buff bar 
ds_list_copy(visBuff, buff);

if (atkTimer > 0){
	atkTimer--;
	if(atkTimer <= 0){
		canAttack = true;
		canUseSkill = true;
		canMove = true;
	}
}

//REGENERATION
statmap[? "hp"] += statmap[? "hpregen"];
if(highRegenThreshold >= 90){
	statmap[? "mp"] += statmap[? "mpregen"]*2;
} else {
	statmap[? "mp"] += statmap[? "mpregen"];
}


