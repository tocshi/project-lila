var target = argument0;
var item = argument1;

if(getEquipSlot(item) == -1 || global.playerItems[item] <= 0){exit;}
if(target.equips[getEquipSlot(item)] > 0){
	unequipItem(target,item);
}

if(target == global.player){
	global.playerItems[item]--;
	global.player.equips[getEquipSlot(item)] = item;
	
	for(var i = 0; i < ds_list_size(global.equipStats); i++){
		if(!is_undefined(ds_map_find_value(global.itemData[| item], global.equipStats[| i]))){
			target.basestatmap[? global.equipStats[| i]] += ds_map_find_value(global.itemData[| item], global.equipStats[| i]);
		}
	}
	target.statChange = true;
}

recalcStats(target);