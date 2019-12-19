/// @description Check that mouse is still held
// You can write your code in this editor

// Sometimes the LMB release check fails when releasing while dragging really fast 
// so this additional check guarantees safety

if (!mouse_check_button(mb_left)) {
	origin_instance.drag_activated = false;
	origin_instance.hold_activated = false;
	var slot = getSlotAtCoords(mouse_x, mouse_y);
	show_debug_message("origin: " + string(origin_slot));
	show_debug_message("destination: " + string(slot));
	if (slot != -1 && slot != origin_slot) {
		// dropped to empty slot
		if (global.playerInv[slot] == 0) {
			global.playerInv[slot] = itemid;
			global.playerInv[origin_slot] = 0;
			updateGUI();
		} else { 
			// slot is occupied, swap items
			global.playerInv[origin_slot] = global.playerInv[slot];
			global.playerInv[slot] = itemid;
			updateGUI();
		}
	}
	global.holding = false;
	global.dragging = false;
	instance_destroy();
}

x = mouse_x - 32;
y = mouse_y - 32;