/// @description Check that mouse is still held
// You can write your code in this editor
if (delay >= 0) {
	delay--;
	exit;
}
if(global.gui_state == 2 && global.pause == 1){
	if (mouse_check_button_released(mb_left) && isDrag || mouse_check_button_pressed(mb_left) && !isDrag) {
		origin_instance.drag_activated = false;
		origin_instance.hold_activated = false;
		var slotinfo = getSkillSlotAtCoords(mouse_x, mouse_y);
		var slot = slotinfo[0];
		var area = slotinfo[1];
		show_debug_message("origin: " + origin_type + string(origin_slot));
		show_debug_message("destination: " + area + string(slot));
	
		if(origin_type == "Available") {
			// Dropped on equip slot
			if (area == "Equipped" && slot != -1) {
				global.equippedSkillBox[slot] = name;
				updateGUI();
			}
		}
		else if(origin_type == "Equipped") {
			// Dropped on equip slot
			if (area == "Equipped" && slot != -1 && slot != origin_slot) {
				// dropped to empty slot
				if (global.equippedSkillBox[slot] == "") {
					global.equippedSkillBox[slot] = name;
					global.equippedSkillBox[origin_slot] = "";
					updateGUI();
				} else { 
					// slot is occupied, swap items
					global.equippedSkillBox[origin_slot] = global.equippedSkillBox[slot];
					global.equippedSkillBox[slot] = name;
					updateGUI();
				}
			} else {
				global.equippedSkillBox[origin_slot] = "";
				updateGUI();
			}
		}
	
		global.holding = false;
		global.dragging = false;
		instance_destroy();
	}
}

x = mouse_x - 32;
y = mouse_y - 32;