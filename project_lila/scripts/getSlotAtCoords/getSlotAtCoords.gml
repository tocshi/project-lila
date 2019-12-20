var x_coord = argument0 - camera_get_view_x(global.currentCamera);
var y_coord = argument1 - camera_get_view_y(global.currentCamera)

// item sprites are 64x64

// check whether coordinates are in equip slot area (adjusting for box margins)

if (x_coord - 11 >= 198 
&& x_coord - 11 <= 198 + 3*86 
&& y_coord - 11 >= 119 
&& y_coord - 11 <= 119 + 4*86) {
		// Floor division by 86 after adjusting for offsets
		var x_slot = (x_coord - 11 - 198) div 86;
		var y_slot = (y_coord - 11 - 119) div 86;
		// Calculate slot number
		var slot = y_slot*3 + x_slot;
		// Return slot number paired with GUI area identifier
		var return_array = array_create(2);
		return_array[0] = slot;
		return_array[1] = "Equip";
		return return_array;
}


// check whether coordinates are in inventory slot area (adjusting for box margins)
if (x_coord - 1 >= 490 
&& x_coord - 1 <= 490 + 10*66 
&& y_coord - 1 >= 121 
&& y_coord - 1 <= 121 + 10*66) {
		// Floor division by 66 after adjusting for offsets
		var x_slot = (x_coord - 1 - 490) div 66;
		var y_slot = (y_coord - 1 - 121) div 66;
		// Calculate slot number
		var slot = y_slot*10 + x_slot;
		// Return slot number paired with GUI area identifier
		var return_array = array_create(2);
		return_array[0] = slot;
		return_array[1] = "Inventory";
		return return_array;
}

// Return -1 if coords do not correspond with a slot
var return_array = array_create(2);
return_array[0] = -1;
return_array[1] = "none";
return return_array;