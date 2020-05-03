/// @description Draw dps counter

// Inherit the parent event
event_inherited();
//draw_self();

if (display == noone)  {
	exit;	
}
display.text = " Total Damage: "   + string(damage)										+ 
			   "\n          DPS: " + string(dps)										+
			   "\n    # of Hits: " + string(hits)										+
			   "\n Time Elapsed: " + string(seconds div 60) + ":" + string(floor(seconds) mod 60)	+
			   "\n          DEF: " + string(statmap[? "def"])							+
			   "\n     Fire DEF: " + string(statmap[? "fire_def"])						+
			   "\n      Ice DEF: " + string(statmap[? "ice_def"])						+
			   "\nLightning DEF: " + string(statmap[? "lightning_def"])					+
			   "\n    Earth DEF: " + string(statmap[? "earth_def"])						+
			   "\n     Wind DEF: " + string(statmap[? "wind_def"])						+
			   "\n    Light DEF: " + string(statmap[? "light_def"])						+
		 	   "\n     Dark DEF: " + string(statmap[? "dark_def"])						+
		 	   "\n Final Shield: " + string(statmap[? "finalshld"]);
