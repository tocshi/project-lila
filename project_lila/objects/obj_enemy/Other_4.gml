// set cpp based on modified normal distribution
var lvldiff = statmap[? "level"] - global.playerLevel;
var result = 1;
if(lvldiff < -20){result = 0;}
else if(lvldiff < 0){
	result = ceil(50 * (1/(sqrt(2 * pi))) * exp(-0.5 * (power((lvldiff - 5.5) / 8,2))));
}
else if(lvldiff <= 20){
	result = ceil(50 * (1/(sqrt(2 * pi))) * exp(-0.5 * (power((lvldiff - 10) / 15,2))));
}
else{
	result = ceil(50 * (1/(sqrt(2 * pi))) * exp(-0.5 * (power((lvldiff - 17.3) / 4,2))));
}
statmap[? "cpp"] = result;
//show_debug_message("cpp for " + string(id) + " is " + string(statmap[? "cpp"]));