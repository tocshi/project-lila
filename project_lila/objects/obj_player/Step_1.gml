move_out_of_wall();

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

	if(buff_array[0] > 0){
		buff_array[0]--;
		ds_list_replace(buff,i,buff_array);
	}
	if(buff_array[0] <= 0){
		removeBuff(self.id,buff_array[2],false);
	}
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

for (var i = 0; i < ds_list_size(buff); ++i){
	var buff_name = array_get(buff[| i],2);
	buff_effect_handler(buff_name);
}


// Update visible buff list for use in buff bar 
ds_list_copy(visBuff, buff);

if (atkTimer > 0){
	atkTimer--;
	if(atkTimer <= 0){
		canAttack = true;
		canUseSkill = true;
	}
}

//REGENERATION
statmap[? "hp"] += statmap[? "hpregen"];
if(highRegenThreshold >= 90){
	statmap[? "mp"] += statmap[? "mpregen"]*2;
} else {
	statmap[? "mp"] += statmap[? "mpregen"];
}

// Level up if xp requirement is met
var lvlup_xp = 100*power(global.playerLevel+1,1.3);
if(global.playerXP >= lvlup_xp){
	instance_create_depth(x,y,depth+1,obj_lvlup_effect);
	global.playerLevel++;
	event_perform(ev_other,ev_user0);
}