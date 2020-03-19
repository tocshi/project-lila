/// @description Draw dps counter

// Inherit the parent event
event_inherited();
draw_self();
show_debug_message("x: " + string(x));
show_debug_message("y: " + string(y));
display.text = "Total damage: " + string(damage)							+ 
			   "\nDps: " + string(dps)										+
			   "\ndef: " + string(statmap[? "def"])						+
			   "\nfire_def: " + string(statmap[? "fire_def"])       		+
			   "\nice_def: " + string(statmap[? "ice_def"])				+
			   "\nlightning_def: " + string(statmap[? "lightning_def"])	+
			   "\nearth_def: " + string(statmap[? "earth_def"])			+
			   "\nwind_def: " + string(statmap[? "wind_def"])				+
			   "\nlight_def" + string(statmap[? "light_def"])				+
		 	   "\ndark_def" + string(statmap[? "dark_def"]);
