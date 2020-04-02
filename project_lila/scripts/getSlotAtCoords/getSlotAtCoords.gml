var x_coord = argument0 - camera_get_view_x(global.currentCamera);
var y_coord = argument1 - camera_get_view_y(global.currentCamera)

// item sprites are 64x64

// check whether coordinates are in inventory slot area (adjusting for box margins)
if (x_coord - 1 >= global.invItemBox[0, 0] 
&& x_coord - 1 <= global.invItemBox[0, 0] + 10*66 
&& y_coord - 1 >= global.invItemBox[0, 1]  
&& y_coord - 1 <= global.invItemBox[0, 1] + 10*66) {
		// Search horizontal/vertical slot position
		var x_slot;
		var y_slot;
		
		for (x_slot = 0; x_slot < 10; ++x_slot) {
			if (x_coord < global.invItemBox[x_slot, 0] - 1 || x_coord > global.invItemBox[x_slot, 0] + 65) {
				continue;
			} else {
				break;
			}
		}
		for (y_slot = 0; y_slot < 10; ++y_slot) {
			if (y_coord < global.invItemBox[y_slot*10, 1] - 1 || y_coord > global.invItemBox[y_slot*10, 1] + 65) {
				continue;
			} else {
				break;
			}
		}
		// Calculate slot number
		var slot = y_slot*10 + x_slot;
		// Return slot number paired with GUI area identifier
		var return_array = array_create(2);
		return_array[0] = slot;
		return_array[1] = "Inventory";
		return return_array;
}



// check whether coordinates are in equip slot area (adjusting for box margins)

if (x_coord - 11 >= global.equipItemBox[0, 0] 
&& x_coord - 11 <= global.equipItemBox[0, 0] + 3*86 
&& y_coord - 11 >= global.equipItemBox[0, 1] 
&& y_coord - 11 <= global.equipItemBox[0, 1] + 4*86) {
		// Search horizontal/vertical slot position
		var x_slot;
		var y_slot;
		
		for (x_slot = 0; x_slot < 3; ++x_slot) {
			if (x_coord < global.equipItemBox[x_slot, 0] - 11 || x_coord > global.equipItemBox[x_slot, 0] + 75) {
				continue;
			} else {
				break;
			}
		}
		for (y_slot = 0; y_slot < 4; ++y_slot) {
			if (y_coord < global.equipItemBox[y_slot*3, 1] - 11 || y_coord > global.equipItemBox[y_slot*3, 1] + 75) {
				continue;
			} else {
				break;
			}
		}
		// Calculate slot number
		var slot = y_slot*3 + x_slot;
		// Return slot number paired with GUI area identifier
		var return_array = array_create(2);
		return_array[0] = slot;
		return_array[1] = "Equip";
		return return_array;
}

// Return -1 if coords do not correspond with a slot
var return_array = array_create(2);
return_array[0] = -1;
return_array[1] = "none";
return return_array;