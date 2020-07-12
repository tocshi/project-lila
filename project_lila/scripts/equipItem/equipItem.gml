var target = argument0;
var itemid = argument1;

if(getEquipSlot(itemid) == -1 || global.playerItems[itemid] <= 0){exit;}

// Check player level
if(global.playerLevel < ds_map_find_value(global.itemData[| itemid],"lvl")) {
	hud_message("Item requires Level " + string(ds_map_find_value(global.itemData[| itemid],"lvl")) + " to use!");
	exit;
}

// Check whether the class is compatible with the weapon
if(!is_undefined(ds_map_find_value(global.weaponClassMap, ds_map_find_value(global.itemData[| itemid],"category")))) {
	var compatibleClasses = ds_map_find_value(global.weaponClassMap, ds_map_find_value(global.itemData[| itemid],"category"));
	if(!isInArray(compatibleClasses, global.player.statmap[? "class"])) {
		var compatibleClassString = "";
		for(var i = 0; i < array_length_1d(compatibleClasses); ++i) {
			if (i > 0) {
				compatibleClassString += ", ";
			}
			compatibleClassString += compatibleClasses[i];
		}
		hud_message(string(ds_map_find_value(global.itemData[| itemid],"category")) + " can only be equipped by " + compatibleClassString);
		exit;
	}
}


if(target == global.player){
	global.playerItems[itemid]--;
	if (global.playerItems[itemid] <= 0) {
		global.playerInv[findArrayIndex(global.playerInv, itemid)] = 0;
	}
	if(target.equips[getEquipSlot(itemid)] > 0){
		unequipItem(target,target.equips[getEquipSlot(itemid)]);
	}
	global.player.equips[getEquipSlot(itemid)] = itemid;
	
	for(var i = 0; i < ds_list_size(global.equipStats); ++i){
		if(!is_undefined(ds_map_find_value(global.itemData[| itemid], global.equipStats[| i]))){
			target.basestatmap[? global.equipStats[| i]] += ds_map_find_value(global.itemData[| itemid], global.equipStats[| i]);
		}
	}
	
	if(ds_map_exists(global.itemData[| itemid],"unleashGauge")){
		target.unleashGauge = ds_map_find_value(global.itemData[| itemid],"unleashGauge");
		target.essence = 0;
	}
	target.statChange = true;
}
updateGUI();