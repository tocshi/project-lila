var target = argument0;
var item = argument1;
show_debug_message("Slot: " + string(getEquipSlot(item)));
if(getEquipSlot(item) == -1){exit;}
if(target.equips[getEquipSlot(item)] == 0){exit;}

if(target == global.player){
	global.playerItems[item]++;
	if (global.playerItems[item] <= 1) {
		for (var i=0; i < array_length_1d(global.playerInv); i++) {
			if (global.playerInv[i] == 0) {
				global.playerInv[i] = item;
				break;
			}
		}
	}
	global.player.equips[getEquipSlot(item)] = 0;

	for(var i = 0; i < ds_list_size(global.equipStats); i++){
		if(!is_undefined(ds_map_find_value(global.itemData[| item], global.equipStats[| i]))){
			target.basestatmap[? global.equipStats[| i]] -= ds_map_find_value(global.itemData[| item], global.equipStats[| i]);
		}
	}
	target.statChange = true;
}