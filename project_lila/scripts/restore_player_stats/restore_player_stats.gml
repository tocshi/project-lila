if(ds_map_exists(global.playerSavedStats,"xp")){
	global.player.statmap[? "hp"]		= global.playerSavedStats[? "hp"];
	global.player.statmap[? "mp"]		= global.playerSavedStats[? "mp"];
	global.player.statmap[? "lvl"]		= global.playerSavedStats[? "lvl"];
	global.player.statmap[? "xp"]		= global.playerSavedStats[? "xp"];
	global.player.statmap[? "cpp"]		= global.playerSavedStats[? "cpp"];
	global.player.statmap[? "hpshield"]	= global.playerSavedStats[? "hpshield"];
}