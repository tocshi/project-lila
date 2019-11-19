var user = argument0;
var itemid = argument1;

var itemData = global.itemData[| itemid];
if(!ds_map_exists(itemData, "activeSkill") || global.playerItems[itemid] <= 0){exit;}

if(!script_execute(asset_get_index(itemData[? "activeSkill"]), user, itemid)){
	exit;
}

if(itemData[? "type"] == "consumable"){
	global.playerItems[itemid]--;	
}

if(user == global.player){
	user.itemcd[itemid] = itemData[? "activeCD"]*room_speed;
}
