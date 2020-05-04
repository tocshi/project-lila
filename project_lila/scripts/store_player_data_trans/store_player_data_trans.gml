// TO ONLY BE CALLED FROM PLAYER OBJECT!

global.lastClass = object_index;
var class = statmap[? "class"];
if(!ds_map_exists(global.playerEquipLoadouts,class)){global.playerEquipLoadouts[? class] = array_create(array_length_1d(equips));}
for(var i = 0; i < array_length_1d(equips); ++i){
	if(equips[i] > 0){
		array_set(global.playerEquipLoadouts[? class],i,equips[i]);
		unequipItem(self,equips[i]);
	}
}
//TODO! Check for isDead and save hp and mp if not