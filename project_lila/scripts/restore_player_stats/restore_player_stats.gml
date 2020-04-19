if(ds_map_exists(global.playerSavedStats,"xp")){
	global.player.statmap[? "hp"]		= global.playerSavedStats[? "hp"];
	global.player.statmap[? "mp"]		= global.playerSavedStats[? "mp"];
	global.player.statmap[? "level"]	= global.playerSavedStats[? "level"];
	global.player.statmap[? "xp"]		= global.playerSavedStats[? "xp"];
	global.player.statmap[? "cpp"]		= global.playerSavedStats[? "cpp"];
	global.player.statmap[? "hpshield"]	= global.playerSavedStats[? "hpshield"];
	global.player.basestatmap[? "maxhp"] = 100 + statmap[? "level"]*10 + round(sqr(statmap[? "level"])/10);
	global.player.basestatmap[? "hpregen"] = statmap[? "maxhp"]/100/60;
}