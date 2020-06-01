// set cpp based on modified normal distribution
var lvldiff = statmap[? "level"] - global.player.statmap[? "level"];
var result = 1;
if(lvldiff < -20){result = 0;}
else{
	result = ceil(50 * (1/(sqrt(2 * pi))) * exp(-0.5 * (power((lvldiff - 10) / 8.5,2))));
}
statmap[? "cpp"] = result;
//show_debug_message("cpp for " + string(id) + " is " + string(statmap[? "cpp"]));