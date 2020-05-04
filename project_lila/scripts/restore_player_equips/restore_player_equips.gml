var class = global.player.statmap[? "class"];
// restore equips
if(ds_map_exists(global.playerEquipLoadouts,class)){
	for(var i = 0; i < array_length_1d(global.player.equips); ++i){
		if(array_get(global.playerEquipLoadouts[? class],i) > 0){
			equipItem(global.player,array_get(global.playerEquipLoadouts[? class],i));
		}
	}
}

// restore hotbar
if(ds_map_exists(global.playerItemBarLoadouts,class)) {
	global.player.itemBar = global.playerItemBarLoadouts[? class];
}