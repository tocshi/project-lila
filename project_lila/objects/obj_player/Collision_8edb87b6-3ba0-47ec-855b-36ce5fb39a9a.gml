global.playerItems[other.itemid]++;

// Insert item in first unoccupied player inventory slot
if (global.playerItems[other.itemid] <= 1) {
	for (var i=0; i < array_length_1d(global.playerInv); i++) {
		if (global.playerInv[i] == 0) {
			global.playerInv[i] = other.itemid;
			break;
		}
	}
}

other.mask_index = spr_empty;
other.fading = true;