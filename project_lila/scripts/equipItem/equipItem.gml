var target = argument0;
var itemid = argument1;

if(getEquipSlot(itemid) == -1 || global.playerItems[itemid] <= 0){exit;}
// TODO!! Write a check that exits if you try to equip the a weapon to a class that can't use it

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