var user = argument0;
var itemid = argument1;

var itemData = global.itemData[| itemid];
if(!ds_map_exists(itemData, "activeSkill") || user.itemcd[itemid] > 0){exit;}
if(user == global.player){
	if(global.playerItems[itemid] <= 0 && !isInArray(global.player.equips,itemid)){exit;}
}

if(!script_execute(asset_get_index(itemData[? "activeSkill"]), user, itemid)){
	exit;
}

if(itemData[? "type"] == "consumable"){
	global.playerItems[itemid]--;	
	if (global.playerItems[itemid] <= 0) {
		global.playerInv[findArrayIndex(global.playerInv, itemid)] = 0;
	}
}

if(user == global.player){
	user.itemcd[itemid] = itemData[? "activeCD"]*room_speed;
}
