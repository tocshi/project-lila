/// @description Draw dps counter

// Inherit the parent event
event_inherited();
draw_self();
show_debug_message("x: " + string(x));
show_debug_message("y: " + string(y));
display.text = "Total damage: " + string(damage)							+ 
			   "\nDps: " + string(dps)										+
			   "\n def: " + string(statmap[? "def"])						+
			   "\n fire_def: " + string(statmap[? "fire_def"])       		+
			   "\n ice_def: " + string(statmap[? "ice_def"])				+
			   "\n lightning_def: " + string(statmap[? "lightning_def"])	+
			   "\n earth_def: " + string(statmap[? "earth_def"])			+
			   "\n wind_def: " + string(statmap[? "wind_def"])				+
			   "\n light_def" + string(statmap[? "light_def"])				+
		 	   "\n dark_def" + string(statmap[? "dark_def"]);
