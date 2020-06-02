var x_coord = argument0 - camera_get_view_x(global.currentCamera);
var y_coord = argument1 - camera_get_view_y(global.currentCamera);

// item sprites are 64x64

// check whether coordinates are in hotbar area (adjusting for box margins)
if (x_coord - 11 >= global.equippedSkillBox[0, 0] 
&& x_coord - 11 <= global.equippedSkillBox[0, 0] + 8*86 
&& y_coord - 11 >= global.equippedSkillBox[0, 1]  
&& y_coord - 11 <= global.equippedSkillBox[0, 1] + 86) {
		// Search slot position
		var slot;
		for (slot = 0; slot < 8; ++slot) {
			if (x_coord < global.equippedSkillBox[slot, 0] - 11 || x_coord > global.equippedSkillBox[slot, 0] + 75) {
				continue;
			} else {
				break;
			}
		}
		// Return slot number paired with GUI area identifier
		var return_array = array_create(2);
		return_array[0] = slot;
		return_array[1] = "Equipped";
		return return_array;
}

// Return -1 if coords do not correspond with a slot
var return_array = array_create(2);
return_array[0] = -1;
return_array[1] = "none";
return return_array;