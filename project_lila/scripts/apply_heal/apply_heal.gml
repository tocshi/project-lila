/// @param target The target to be healed
/// @param value  Amount of healing 
/// @param scaling Optional. If omitted, the heal will be a flat heal. Otherwise value will be used as a
/// decimal percentage of scaling. scaling is one of ["max_health", "current_health", "missing_health"]
var target = argument0;
var value = argument1;
var total_heal = 0;
if (argument_count < 2) {
	total_heal = value;
} else {
	var scaling = argument2;
	var multiplier = 0;
	switch(scaling) {
		case "max_health": multiplier = target.statmap[? "maxhp"]; break;
		case "current_health": multiplier = target.statmap[? "hp"]; break;
		case "missing_health": multiplier = target.statmap[? "maxhp"] - target.statmap[? "hp"]; break;
	}
	total_heal = value * multiplier;
}

target.statmap[? "hp"] += total_heal;
if (target.statmap[? "hp"] > target.statmap[? "maxhp"]) {
	target.statmap[? "hp"] = target.statmap[? "maxhp"];	
}