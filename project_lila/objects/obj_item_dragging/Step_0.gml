/// @description Check that mouse is still held
// You can write your code in this editor

if (!mouse_check_button(mb_left) && isDrag || mouse_check_button(mb_left) && !isDrag) {
	origin_instance.drag_activated = false;
	origin_instance.hold_activated = false;
	var slotinfo = getSlotAtCoords(mouse_x, mouse_y);
	var slot = slotinfo[0];
	var area = slotinfo[1];
	show_debug_message("origin: " + origin_type + string(origin_slot));
	show_debug_message("destination: " + area + string(slot));
	
	if(origin_type == "Inventory") {
		// Dropped on inventory slot
		if (area == "Inventory" && slot != -1 && slot != origin_slot) {
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
		// Dropped on equip slot
		if (area == "Equip" && slot != -1) {
			// dropped to empty slot
			if (slot == getEquipSlot(itemid) && global.player.equips[slot] == 0) {
				show_debug_message("Dropped on empty slot");
				equipItem(global.player, itemid);
				updateGUI();
			} 
			else if (slot == getEquipSlot(itemid)) { 
				// slot is occupied, swap items
				global.playerItems[itemid]--;
				var unequippeditemid = global.player.equips[slot];
				unequipItem(global.player, unequippeditemid);
				global.playerItems[itemid]++;
				equipItem(global.player, itemid);
				if (global.playerInv[origin_slot] == 0) {
					global.playerInv[findArrayIndex(global.playerInv, unequippeditemid)] = 0;
					global.playerInv[origin_slot] = unequippeditemid;
				}
				updateGUI();
			}
		}
	}
	else if(origin_type == "Equip") {
		// Dropped on inventory slot
		if (area == "Inventory" && slot != -1) {
			// dropped to empty slot
			if (global.playerInv[slot] == 0) {
				unequipItemToSlot(global.player, itemid, slot);
				updateGUI();
			} else { 
				// slot is occupied, swap items
				unequipItem(global.player, itemid);
				updateGUI();
			}
		}
	}
	
	global.holding = false;
	global.dragging = false;
	instance_destroy();
}

x = mouse_x - 32;
y = mouse_y - 32;