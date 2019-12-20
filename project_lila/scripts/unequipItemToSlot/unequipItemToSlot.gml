var target = argument0;
var itemid = argument1;
var target_slot = argument2;
show_debug_message("Slot: " + string(getEquipSlot(itemid)));
if(getEquipSlot(itemid) == -1){exit;}
if(target.equips[getEquipSlot(itemid)] == 0){exit;}

if(target == global.player){

	global.playerItems[itemid]++;
	if (global.playerItems[itemid] <= 1) {
		global.playerInv[target_slot] = itemid;
	}
	global.player.equips[getEquipSlot(itemid)] = 0;


	for(var i = 0; i < ds_list_size(global.equipStats); i++){
		if(!is_undefined(ds_map_find_value(global.itemData[| itemid], global.equipStats[| i]))){
			target.basestatmap[? global.equipStats[| i]] -= ds_map_find_value(global.itemData[| itemid], global.equipStats[| i]);
		}
	}
	
	if(ds_map_exists(global.itemData[| itemid],"unleashGauge")){
		target.unleashGauge = 0;
	}
	
	target.statChange = true;
}
updateGUI();