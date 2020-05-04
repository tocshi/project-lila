/// @description "Checks if the player has a skill unlocked, returns true if the player does, false otherwise"

var skillname = argument0;

for(var i = 0; i < ds_list_size(global.skillData); ++i){
	var skillmap = global.skillData[| i];
	if(skillmap[? "name"] == skillname){
		if(skillmap[? "class"] != global.player.statmap[? "class"]){return false;}
		if(skillmap[? "unlocked"] > 0){return true;}
		else{return false;}
	}
}