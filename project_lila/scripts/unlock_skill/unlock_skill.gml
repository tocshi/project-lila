/// @description "Checks if the player has a skill unlocked, returns true if the player does, false otherwise"

var skillname = argument0;

if(get_skill_data(skillname,"unlocked") == 0 && global.playerCPP[? global.player.statmap[? "class"]] >= get_skill_data(skillname,"cppcost")){
	set_skill_data(skillname, "unlocked", 1);
	global.playerCPP[? global.player.statmap[? "class"]] -= get_skill_data(skillname,"cppcost");
}