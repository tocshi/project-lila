// restore stats
if(ds_map_exists(global.playerSavedStats,"xp")){
	global.player.statmap[? "hp"]		= global.playerSavedStats[? "hp"];
	global.player.statmap[? "mp"]		= global.playerSavedStats[? "mp"];
	global.player.statmap[? "level"]	= global.playerSavedStats[? "level"];
	global.player.statmap[? "xp"]		= global.playerSavedStats[? "xp"];
	global.player.statmap[? "hpshield"]	= global.playerSavedStats[? "hpshield"];
	global.player.basestatmap[? "maxhp"] = 100 + global.player.statmap[? "level"]*10 + round(sqr(global.player.statmap[? "level"])/10);
	global.player.basestatmap[? "hpregen"] = global.player.basestatmap[? "maxhp"]/100/60;
	global.player.statChange = true;
}