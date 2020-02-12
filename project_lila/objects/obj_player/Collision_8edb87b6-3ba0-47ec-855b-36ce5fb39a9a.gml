global.playerItems[other.itemid]++;

// Insert item in first unoccupied player inventory slot
addItem(other.itemid);

other.mask_index = spr_empty;
other.fading = true;