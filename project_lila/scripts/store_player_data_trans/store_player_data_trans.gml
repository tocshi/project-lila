// TO ONLY BE CALLED FROM PLAYER OBJECT!
// Save items
global.lastClass = object_index;
global.lastRoom = room;
var class = statmap[? "class"];
// Save equip and itembar
if(!ds_map_exists(global.playerEquipLoadouts,class)) {
	global.playerEquipLoadouts[? class] = array_create(array_length_1d(equips));
}
if(!ds_map_exists(global.playerItemBarLoadouts,class)) {
	global.playerItemBarLoadouts[? class] = array_create(array_length_1d(itemBar));
}

for(var i = 0; i < array_length_1d(equips); ++i){
	if(equips[i] > 0){
		array_set(global.playerEquipLoadouts[? class],i,equips[i]);
		unequipItem(self,equips[i]);
	}
}
for(var i = 0; i < array_length_1d(itemBar); ++i){
	if(itemBar[i] > 0){
		array_set(global.playerItemBarLoadouts[? class],i,itemBar[i]);
	}
}

// Save stats
global.playerSavedStats[? "level"]		= global.playerLevel;
global.playerSavedStats[? "xp"]			= global.playerXP;
	
if(!isDead){
	global.playerSavedStats[? "hp"]			= statmap[? "hp"];
	global.playerSavedStats[? "mp"]			= statmap[? "mp"];
	global.playerSavedStats[? "hpshield"]	= statmap[? "hpshield"];
}
else{
	global.playerSavedStats[? "hp"]			= statmap[? "maxhp"];
	global.playerSavedStats[? "mp"]			= statmap[? "maxmp"];
	global.playerSavedStats[? "hpshield"]	= 0;
}

// Save Skills
if(!ds_map_exists(global.playerSkillLoadouts,class)) {
	global.playerSkillLoadouts[? class] = array_create(array_length_1d(skills));
}
for(var i = 0; i < array_length_1d(skills); ++i){
	array_set(global.playerSkillLoadouts[? class],i,skills[i]);
}

// Save Buffs
ds_list_copy(global.playerSavedBuffs,buff);