/// @description Draw dps counter

// Inherit the parent event
event_inherited();
display.text = "Total damage: " + damage							+ 
			   "\nDps: " + dps										+
			   "\n def: " + statmap[? "def"]						+
			   "\n fire_def: " + statmap[? "fire_def"]       		+
			   "\n ice_def: " + statmap[? "ice_def"]				+
			   "\n lightning_def: " + statmap[? "lightning_def"]	+
			   "\n earth_def: " + statmap[? "earth_def"]			+
			   "\n wind_def: " + statmap[? "wind_def"]				+
			   "\n light_def" + statmap[? "light_def"]				+
		 	   "\n dark_def" + statmap[? "dark_def"];
