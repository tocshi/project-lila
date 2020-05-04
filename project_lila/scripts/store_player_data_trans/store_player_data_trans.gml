// TO ONLY BE CALLED FROM PLAYER OBJECT!

global.lastClass = object_index;
var class = statmap[? "class"];
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

global.playerSavedStats[? "level"]		= statmap[? "level"];
global.playerSavedStats[? "xp"]			= statmap[? "xp"];
global.playerSavedStats[? "cpp"]		= statmap[? "cpp"];
	
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