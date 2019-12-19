x_coord = argument0 - camera_get_view_x(global.currentCamera);
y_coord = argument1 - camera_get_view_y(global.currentCamera)

// item sprites are 64x64

// check whether coordinates are in equip slot area (adjusting for box margins)

/*
if (x_coord - 11 >= 198 
&& x_coord - 11 <= 198 + 3*86 
&& y_coord - 11 >= 119 
&& y_coord - 11 <= 119 + 4*86) {
		// Floor division by 86 after adjusting for offsets
		x_slot = (x_coord - 11 - 198) div 86;
		y_slot = (y_coord - 11 - 119) div 86;
		// Return the slot number
		return y_slot*10 + x_slot;
}
*/

// check whether coordinates are in inventory slot area (adjusting for box margins)
if (x_coord - 1 >= 490 
&& x_coord - 1 <= 490 + 10*66 
&& y_coord - 1 >= 121 
&& y_coord - 1 <= 121 + 10*66) {
		// Floor division by 66 after adjusting for offsets
		x_slot = (x_coord - 1 - 490) div 66;
		y_slot = (y_coord - 1 - 121) div 66;
		// Return the slot number
		return y_slot*10 + x_slot;
}

// Return -1 if coords do not correspond with a slot
return -1;